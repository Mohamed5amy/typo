Feature: Merge Articles
  As a blog administrator
  In order to avoid multiple similar articles
  I want to be able to merge two articles

  Background:
    Given the blog is set up
    And I am logged into the admin panel
    And the following articles exist:
        | id | title                   | body   |
        | 3  | Aladdin                 | Alad   |
        | 4  | The Terminator          | Term   |
        | 5  | When Harry Met Sally    | Harry  |
        | 6  | The Help                | Help   |
        | 7  | Chocolat                | Chocol |
    

  Scenario: When articles are merged, the merged article should contain the text of both previous articles
  Given I am on the edit page of "Aladdin"
  When I fill in "merge_with" with "4"
    And I press "Merge"
    Then the article "Aladdin" should have "Alad Term"

  Scenario:  A non-admin cannot merge two articles
    Given I logged out of the admin panel
    When I go to the edit page of "Aladdin"
    Then I should not see "Merge"
    And I should be on the login page
