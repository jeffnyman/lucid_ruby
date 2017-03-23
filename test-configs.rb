#!/usr/bin/env ruby

# This file exists only to validate the data grabbing routines.

$: << './config'
require "config"

puts Config.config_set
puts "----------------"
puts Config.env_set
puts "----------------"
puts Config.current
puts "----------------"
puts Config.current_group
puts Config.current_server
puts Config.current_user
puts "----------------"
puts Config.context(Config.current_user)
puts "----------------"
puts "(Context)"
puts "----------------"
puts Config.context
puts Config.context['url']
puts Config.context['username']
puts Config.context['password']
puts "----------------"
puts Config.context('admin')
puts Config.context('admin')['username']
puts Config.context('admin')['password']
puts "----------------"
puts Config.context('tester')
puts Config.context('tester')['username']
puts Config.context('tester')['password']
