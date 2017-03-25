Given(/^(?:a|an) (.*) user can log in to the application$/) do |type|
  on_view(Home).login_as_user(type)
end

Given(/^an authenticated user on the overlord page$/) do
  on_view(Home).login_as_authenticated_user
  on(Navigation).navigate.to_overlord_page
end

Given(/^an authenticated user on the stardate page$/) do
  on_view(Home).login_as_authenticated_user
  on(Navigation).navigate.to_stardate_page
end
