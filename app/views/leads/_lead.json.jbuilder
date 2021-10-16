json.extract! lead, :id, :company, :position, :source_id, :location, :notes, :created_at, :updated_at
json.url lead_url(lead, format: :json)
