User.find_or_create_by!(email: "user@example.com") do |user|
  user.password = "password"
end
