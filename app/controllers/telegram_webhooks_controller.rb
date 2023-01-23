class TelegramWebhooksController < Telegram::Bot::UpdatesController
  include Telegram::Bot::UpdatesController::MessageContext

  ### AUTH
  class AuthorizationError < StandardError; end

  before_action :authorize!
  rescue_from 'AuthorizationError', with: :deny_access
  ALLOW_USERS = ['fralunia', 'Serg1923'].freeze
  ALLOW_IDS = [445590809].freeze
  use_session!

  def start!(*)
    Telegram::InitUser.run(from: from)

    respond_with :message, text: Telegram::Greeting.new(from).greet, parse_mode: 'HTML'

    inline_menu!
  end

  def my_stores!
    stores = tg_user.user.stores.map do |store|
      { text: "🆔 #{store.name}", callback_data: "store/#{store.id}" }
    end

    respond_with :message, text: 'Список магазинов:', reply_markup: {
      inline_keyboard: [
        stores,
        [{ text: "🆕 Добавить", callback_data: "add_new_store" }]
      ],
    }
  end

  def settings!
    respond_with :message, text: Telegram::Greeting.new(from).under_construction, parse_mode: 'HTML'
  end

  def reports!
    respond_with :message, text: Telegram::Greeting.new(from).under_construction, parse_mode: 'HTML'
  end

  def my!(*)
    sub_menu(tg_user.stores)
  end

  def stock!
    tg_user.user.stores.each do |store|
      ::Telegram::Notifications::StocksNew.new(store).call
    end
  end

  def add_store!(*)
    inline_menu!
  end

  def inline_menu!(*)
    respond_with :message, text: Telegram::Greeting.new(from).add_store, reply_markup: {
      inline_keyboard: [
        [
          { text: '🟣 Wildberries', callback_data: 'add_campaign_wb' },
          { text: '🔵 OZON', callback_data: 'add_campaign_ozon' },
          { text: '🟠 ЯМаркет', callback_data: 'add_campaign_ya_market' },
        ],
      ],
    }
  end

  def campaign_list!(*)
    respond_with :message, text: Telegram::Greeting.new(from).campaign_list, parse_mode: 'HTML'
  end

  def callback_query(data)
    # bot.delete_message(chat_id: from["id"], message_id: payload["message"]["message_id"])
    case data
    when 'add_new_store' then add_store!
    when 'add_campaign_wb'
      save_context :add_store_wb!
      respond_with :message, text: 'Введите api ключ из ЛК'
    when 'add_campaign_ozon'
      save_context :add_store_ozon!
      respond_with :message, text: Telegram::Greeting.new(from).under_construction, parse_mode: 'HTML'

      # respond_with :message, text: 'Введите api ключ из ЛК'
    when 'add_campaign_ya_market'
      save_context :add_ya_market!
      respond_with :message, text: Telegram::Greeting.new(from).under_construction, parse_mode: 'HTML'

      # respond_with :message, text: 'Введите api ключ из ЛК'
    when 'check_price'
      answer_callback_query 'проверяю цены'
      answer_inline_query price_check
    when 'products_list'
      products
    else
      answer_callback_query t('.no_alert')
    end
  end

  def add_store_wb!(token = nil, *)
    return inline_menu! if token.blank?

    result = Telegram::Wb::NewStore.run(tg_user: tg_user, token: token)

    if result.valid?
      respond_with :message, text: Telegram::Greeting.new(from).success_add, parse_mode: 'HTML'
      # respond_with :animation, animation: File.open('app/assets/images/telegram/work_in_progress.gif'), caption: 'Собираем информацию...'
    else
      save_context :add_store_wb!
      message = result.errors.messages.values.flatten.join(' ,')
      respond_with :message, text: message, parse_mode: 'HTML'

      inline_menu!
    end

  ensure
    delete_message
  end

  def delete_message
    TG_BOT.delete_message(chat_id: from['id'], message_id: payload['message_id'])
  end

  def add_store_ozon!(token = nil, *)
    respond_with :message, text: Telegram::Greeting.new(from).under_construction, parse_mode: 'HTML'

    # inline_menu! unless token.present?

    # result = Telegram::AddNewStore.run(username: from['username'], token: token, type: :ozon)
    #
    # if result.valid?
    #   respond_with :message, text: Telegram::Greeting.new(from).success_add, parse_mode: 'HTML'
    # else
    #   message = result.errors.messages.values.flatten.join(' ,')
    #   respond_with :message, text: message, parse_mode: 'HTML'
    #
    #   inline_menu!
    # end
    #
    # ensure

  end

  def add_campaign_ya_market
    respond_with :message, text: Telegram::Greeting.new(from).under_construction, parse_mode: 'HTML'
  end

  def sub_menu(list = nil)
    data = list.map { |l| { text: l.slug, callback_data: l.slug } }

    respond_with :message, text: t('.prompt'), reply_markup: {
      inline_keyboard: [data],
    }
  end

  def search!(sku = nil, *)
    if sku.present?
      Wildberries::SearchByQuery.run(q: 'разделочная доска', sku: sku)
    else
      respond_with :message, text: 'Отправь артикул', reply_markup: {
        selective: true,
        force_reply: true
      }
    end
    save_context :search!
  end

  def help!(*)
    respond_with :message, text: t('.content')
  end

  def add_url!(url = nil, *)
    if url
      import_data = Import::Products.run(user: user, url: url)

      if import_data.valid?
        respond_with :message, text: Telegram::ImportReport.call(user, import_data.result)
      else
        respond_with :message, text: "Ошибка: #{import_data.errors}"
      end

    else
      respond_with :message, text: 'кидай ссылку на таблицу:', reply_markup: {
        selective: true,
        force_reply: true
      }

      save_context :add_url!
    end
  end

  def list!(*)
    respond_with :message, text: inline_query(Product, 0)
  end

  def products
    respond_with :message, text: inline_query(user.products, 0)
  end

  # def memo!(*args)
  #   if args.any?
  #     session[:memo] = args.join(' ')
  #     respond_with :message, text: t('.notice')
  #   else
  #     respond_with :message, text: t('.prompt')
  #     save_context :memo!
  #   end
  # end

  # def remind_me!(*)
  #   to_remind = session.delete(:memo)
  #   reply = to_remind || t('.nothing')
  #   respond_with :message, text: reply
  # end

  def keyboard!(value = nil, *)
    if value
      respond_with :message, text: t('.selected', value: value)
    else
      save_context :keyboard!
      respond_with :message, text: t('.prompt'), reply_markup: {
        keyboard: [t('.buttons')],
        resize_keyboard: true,
        one_time_keyboard: true,
        selective: true,
      }
    end
  end

  def start_keyboard!(*)
    respond_with :message, text: 'Меню', reply_markup: {
      inline_keyboard: [
        [
          { text: 'Назад', callback_data: 'back' },
        ],
      # [{ text: t('.repo'), url: 'https://github.com/telegram-bot-rb/telegram-bot' }],
      ],
    }
  end

  def products_list(product)
    # products = Product.all.select(:name, :min_price, :max_price)
    # i = 0
    #
    # products_list = products.map do |product|
    # 	i += 1
    # 	"#{i}: " +
    # 	"#{product.name} \n " +
    # 	"мин.цена: #{product.min_price}, " +
    # 	"макс.цена: #{product.max_price}"
    # end.join("\n")

  end

  def price_check
    respond_with :message, text: CheckPriceProcess.check('aliexpress', 'Lego toys')
  end

  def inline_query(query, _offset)
    query = query # it's just an example, don't use large queries.
    t_description = t('.description')
    t_content = t('.content')
    results = Array.new(5) do |i|
      {
        type: :article,
        title: "#{query}-#{i}",
        id: "#{query}-#{i}",
        description: "#{t_description} #{i}",
        input_message_content: {
          message_text: "#{t_content} #{i}",
        },
      }
    end

    answer_inline_query results
  end

  # As there is no chat id in such requests, we can not respond instantly.
  # So we just save the result_id, and it's available then with `/last_chosen_inline_result`.
  # def chosen_inline_result(result_id, _query)
  #   session[:last_chosen_inline_result] = result_id
  # end

  # def last_chosen_inline_result!(*)
  #   result_id = session[:last_chosen_inline_result]
  #   if result_id
  #     respond_with :message, text: t('.selected', result_id: result_id)
  #   else
  #     respond_with :message, text: t('.prompt')
  #   end
  # end

  def message(message)
    if message['reply_to_message'].present?
      case message.dig('reply_to_message', 'text')

      when 'кидай ссылку на таблицу:'
        add_url!(message['text'])
      end
    end

    respond_with :message, text: t('.content', text: message['text'])
  end

  def action_missing(action, *_args)

    if action_type == :command
      respond_with :message,
                   text: t('telegram_webhooks.action_missing.command', command: action_options[:command])
    end
  end

  private

  def user?
    if from['username'].present?
      from['username'].in?(ALLOW_USERS)
    else
      from['id'].in?(ALLOW_IDS)
    end
  end

  def tg_user
    @tg_user ||= TgUser.find_by(username: from['username']) || TgUser.find_by(chat_id: from['id'])
  end

  def authorize!
    return true if user?

    raise AuthorizationError
  end

  def name
    from['username'] || from['first_name']
  end

  def deny_access
    respond_with :message, text: "⚠ Кто вы #{name}? \n Я вас не знаю, обратитесь к адиминстратору"
  end

end
