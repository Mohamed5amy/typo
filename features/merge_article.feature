Feature: Merge Articles
  As a blog administrator
  In order to avoid multiple similar articles
  I want to be able to merge two articles

  Background:
    Given the blog is set up
    And I am logged into the admin panel
    And the following articles exist:
        | id | title                   | body   |
        | 1  | Aladdin                 | Alad   |
        | 2  | The Terminator          | Term   |
        | 3  | When Harry Met Sally    | Harry  |
        | 4  | The Help                | Help   |
        | 5  | Chocolat                | Chocol |
    

  Scenario: When articles are merged, the merged article should contain the text of both previous articles
  Given I am on the edit page of "Aladdin"
  When I fill in "merge_with" with "2"
    And I press "Merge"
    Then the article "Aladdin" should have "Ala Term"

  Scenario:  A non-admin cannot merge two articles
    Given I logged out of the admin panel
    When I go to the edit page of "Aladdin"
    Then I should not see "Merge"
    And I should be on the home page
