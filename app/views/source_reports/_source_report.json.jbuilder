json.extract! source_report, :id, :store_id, :url, :report_type, :created_at, :updated_at
json.url source_report_url(source_report, format: :json)
