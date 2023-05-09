# == Schema Information
#
# Table name: photos
#
#  id         :bigint           not null, primary key
#  image_data :jsonb
#  product_id :bigint           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Photo < ApplicationRecord
  include ImageUploader::Attachment(:image)

  belongs_to :product
end
