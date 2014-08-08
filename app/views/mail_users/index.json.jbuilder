json.array!(@mail_users) do |mail_user|
  json.extract! mail_user, :id, :name, :email, :login
  json.url mail_user_url(mail_user, format: :json)
end
