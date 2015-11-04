<<<<<<< HEAD
Given(/^the input "([^"]*)"$/) do |arg1|
  @input=arg1
end

When(/^the program is run$/) do
  @output = `/usr/bin/python getStud.py #{@input}`
  raise('Command Failed!') unless $?.success?
end

Then(/^the output should be "([^"]*)"$/) do |arg1|
  expect(@output).to eq(arg1)
=======
Given(/^the input "([^"]*)"$/) do |arg1|
  @input=arg1
end

When(/^the program is run$/) do
  @output = `/usr/bin/python getStud.py #{@input}`
  raise('Command Failed!') unless $?.success?
end

Then(/^the output should be "([^"]*)"$/) do |arg1|
  expect(@output).to eq(arg1)
>>>>>>> 7827a4af786e6a8ce8e303d5a54363774bf33afa
end