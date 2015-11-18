Given(/^the professor course "([^"]*)" "([^"]*)" "([^"]*)"$/) do |arg1, arg2, arg3|
  @input=arg1, @input2=arg2, @input3=arg3
end

When(/^the user checks for prfessor conflicts$/) do
  @output = `/usr/bin/python checkProfTest.py #{@input} #{@input2} #{@input3}`
  raise('Command Failed!') unless $?.success?
end

Then(/^the resultant professor conflicts should be "([^"]*)"$/) do |arg1|
  expect(@output).to eq(arg1)
end