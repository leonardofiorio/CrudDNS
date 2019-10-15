json.extract! domain, :id, :name, :type, :ttl, :primary_name_server, :contact, :refresh, :retry, :expire, :minimum, :created_at, :updated_at
json.url domain_url(domain, format: :json)
