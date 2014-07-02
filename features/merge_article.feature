Feature: Merge Articles
  As a blog administrator
  I want to preserve both articles' content, but merge them together into one article.

  Background:
    Given the blog is set up
    Given the following users exist:
    | login       | password | email                | profile_id | name        | state  |
    | admin       | aaaaaaaa | admin@mail.com       | 1          | Admin       | active |
    | blogger     | bbbbbbbb | blogger@mail.com     | 2          | Blogger     | active |
    | contributor | cccccccc | contributor@mail.com | 3          | Contributor | active |
    Given the following articles exist:
    | id | title          | author       | body                             | published |
    | 11 | Test article 1 | admin        | Welcome to my blob               | 1         |
    | 12 | Test article 2 | blogger      | An article from a blogger        | 1         |
    | 13 | Test article 3 | contributor  | An article from a contributor    | 1         |

  Scenario: A non-admin cannot merge articles.
    Given I am logged in as "blogger" with password "bbbbbbbb"
    And I am on the edit page for article "Test article 2"
    Then I should not see "Merge Articles"

  Scenario: A admin is allowed to merge article when edit an article
    Given I am logged in as "admin" with password "aaaaaaaa"
    And I am on the edit page for article "Test article 1"
    Then I should see "Merge Articles"

  Scenario: Merging option is not available when Creating new article
    Given I am logged in as "admin" with password "aaaaaaaa"
    And I am on the new article page
    Then I should not see "Merge Articles"

  Scenario: When articles are merged, the merged article should contain the text of both previous articles.
    Given I am logged in as "admin" with password "aaaaaaaa"
    And I am on the edit page for article "Test article 1"
    When I fill in "merge_with" with "12"
    And I press "Merge"
    Then I should be on the admin content page
    And I should see "Test article 1"
    When I follow "Test article 1"
    Then I should see "Welcome to my blob"
    And I should see "An article from a blogger"
