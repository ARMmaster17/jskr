json.extract! event, :id, :name, :occurred, :state_id, :lead_id, :person, :notes, :created_at, :updated_at
json.url event_url(event, format: :json)
