Given(/^the course and upper bounds "([^"]*)" "([^"]*)" "([^"]*)"$/) do |arg1, arg2, arg3|
   @input=arg1, @input2=arg2, @input3=arg3
end

When(/^the program is run$/) do
  @output = `/usr/bin/python findAvailTest.py #{@input} #{@input2} #{@input3}`
  raise('Command Failed!') unless $?.success?
end

Then(/^the possible time slots should be "([^"]*)"$/) do |arg1|
  expect(@output).to eq(arg1)
end