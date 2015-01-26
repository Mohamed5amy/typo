Given /^the following articles exist:$/ do |table|
  # table is a Cucumber::Ast::Table
  Article.create table.hashes
end

Then /^the article "(.*?)" should have "(.*?)"$/ do |arg1, arg2|
  pending # express the regexp above with the code you wish you had
end
    