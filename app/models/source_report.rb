# == Schema Information
#
# Table name: source_reports
#
#  id          :bigint           not null, primary key
#  store_id    :bigint           not null
#  data        :jsonb
#  report_type :string
#  file_data   :jsonb
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class SourceReport < ApplicationRecord
  # include FileUploader::Attachment(:file) # adds an `file` virtual attribute
  belongs_to :store

  store_accessor :data, :google_doc_id
end
