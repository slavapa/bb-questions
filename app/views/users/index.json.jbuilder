json.array!(@users) do |user|
  json.extract! user, :id, :name, :family_name, :email, :password_digest, :remember_digest
  json.url user_url(user, format: :json)
end
