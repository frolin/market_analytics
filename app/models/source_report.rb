class SourceReport < ApplicationRecord
  # include FileUploader::Attachment(:file) # adds an `file` virtual attribute
  belongs_to :store

  store_accessor :data, :google_doc_id
end
