Given(/^overlord cannot be viewed by a test user$/) do
  on_view(Home).login_as_user("test")
  on(Navigation).navigate.to_overlord_page(expect_fail: true)
end

Given(/^overlord can be viewed by an admin user$/) do
  on_view(Home).login_as_user("admin")
  on(Navigation).navigate.to_overlord_page
end
