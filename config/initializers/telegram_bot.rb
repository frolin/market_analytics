bot_name = ENV.fetch('BOT_NAME', :dev_chat).to_sym
TG_BOT = Telegram.bots[bot_name]