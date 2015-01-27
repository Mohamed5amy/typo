Given /^the following articles exist:$/ do |table|
  # table is a Cucumber::Ast::Table
  Article.create table.hashes
end

Then /^the article "(.*?)" should have "(.*?)"$/ do |arg1, arg2|
  Article.find_by_title(arg1).body.should eq arg2
end
    
Given /^I logged out of the admin panel$/ do
  visit '/accounts/logout'
end
    