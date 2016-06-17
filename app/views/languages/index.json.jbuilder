json.array!(@languages) do |language|
  json.extract! language, :id, :name, :code, :is_rtl
  json.url language_url(language, format: :json)
end
