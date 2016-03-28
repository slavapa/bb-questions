json.array!(@questions) do |question|
  json.extract! question, :id, :name, :from, :ip, :banned, :selected, :approved, :sequence, :question, :translation, :reformed
  json.url question_url(question, format: :json)
end
