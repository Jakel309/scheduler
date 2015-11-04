Given(/^the input "([^"]*)" "([^"]*)" "([^"]*)"$/) do |arg1, arg2, arg3|
  @input=arg1, @input2=arg2, @input3=arg3
end

When(/^the user checks for conflicts$/) do
  @output = `/usr/bin/python checkMove.py #{@input} #{@input2} #{@input3}`
  raise('Command Failed!') unless $?.success?
end

Then(/^the resultant conflicts should be "([^"]*)"$/) do |arg1|
  expect(@output).to eq(arg1)
end