Given(/^a provisioned bomb$/) do
  on(Provision).create_bomb
end

Given(/^an activated bomb$/) do
  on(Provision).create_bomb
  on(Bomb).enter_code('1234').then.activate_bomb
end

Given(/^an activated bomb with a countdown of "([^"]*)" seconds$/) do |seconds|
  on(Provision).create_bomb(countdown: seconds)
  on(Bomb).enter_code('1234').then.activate_bomb
end

When(/^the bomb is activated$/) do
  on(Bomb).enter_code('1234').then.activate_bomb
end

When(/^the bomb is deactivated$/) do
  on(Bomb).enter_code('0000').then.deactivate_bomb
end

When(/^the bomb is activated by the keypad$/) do
  on(Bomb).enter_code_in_keypad('1234').then.activate_bomb
end

When(/^the bomb is deactivated by the keypad$/) do
  on(Bomb).enter_code_in_keypad('0000').then.deactivate_bomb
end

When(/^a code is entered and deleted$/) do
  on(Bomb).enter_code_in_keypad('7777').then.delete_code
end

When(/^the countdown finishes$/) do
  on(Bomb).check_that.countdown_has_finished
end

When(/^an incorrect deactivation code is entered three times$/) do
  on(Bomb).enter_code('1139').then.deactivate_bomb
  on(Bomb).enter_code('1138').then.deactivate_bomb
  on(Bomb).enter_code('1137').then.deactivate_bomb
end

Then(/^the bomb will display as inactive$/) do
  verify on(Bomb).confirm_inactive_bomb_state
end

Then(/^the bomb will display as active$/) do
  verify on(Bomb).confirm_active_bomb_state
end

Then(/^the timer will start counting down$/) do
  on(Bomb).check_that.countdown_has_started
end

Then(/^the timer will stop counting down$/) do
  on(Bomb).check_that.countdown_has_stopped
end

Then(/^the countdown timer will be set to "([^"]*)" seconds$/) do |seconds|
  on(Bomb).countdown_value_is(seconds)
end

Then(/^the bomb will detonate$/) do
  on(Bomb).confirm_detonation
end

Then(/^the countdown value cannot be changed$/) do
  on(Bomb).confirm_countdown_cannot_be_changed
end

Then(/^the code is blank$/) do
  on(Bomb).confirm_empty_code
end
