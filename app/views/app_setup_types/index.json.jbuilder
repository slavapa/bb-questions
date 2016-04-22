json.array!(@app_setup_types) do |app_setup_type|
  json.extract! app_setup_type, :id, :id, :name, :description
  json.url app_setup_type_url(app_setup_type, format: :json)
end
