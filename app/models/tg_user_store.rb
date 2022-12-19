class TgUserStore < ApplicationRecord
  belongs_to :tg_user
  belongs_to :store
end
