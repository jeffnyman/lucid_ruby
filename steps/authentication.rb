Given(/^(?:a|an) (.*) user can log in to the application$/) do |type|
  on_view(Home).login_as_user(type)
end
