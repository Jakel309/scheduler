Given(/^the input "([^"]*)"$/) do |arg1|
  @input=arg1
end

When(/^the program is run$/) do
  @output = `/usr/bin/python getStud.py #{@input}`
  raise('Command Failed!') unless $?.success?
end

Then(/^the output should be "([^"]*)"$/) do |arg1|
  expect(@output).to eq(arg1)
end