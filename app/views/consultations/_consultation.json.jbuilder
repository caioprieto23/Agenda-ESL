json.extract! (consultation, :id, :title, :description, :start_time, :start_date, :created_at, :updated_at, :user_id)
json.url consultation_url(consultation, format: :json)
