json.array!(@application_setups) do |application_setup|
  json.extract! application_setup, :id, :app_setup_type_id, :language_id, :code_id, :description, :str_value
  json.url application_setup_url(application_setup, format: :json)
end
