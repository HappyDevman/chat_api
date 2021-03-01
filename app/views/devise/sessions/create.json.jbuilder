json.user do
  json.call(current_user, :id, :email)
end
json.token @token
