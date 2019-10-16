json.extract! record, :id, :type, :host, :ttl, :content, :priority, :created_at, :updated_at
json.url record_url(record, format: :json)
