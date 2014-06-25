Feature: Create and Edit Categories
  As a blog administrator
  I want to be able to create new categories and edit existing categories
  
  Background:
    Given the blog is set up
    And I am logged into the admin panel
    
  Scenario: Successfully create new category
    Given I am on the new category page
    When I fill in "category_name" with "Test Cat"
    And I fill in "category_keywords" with "abc def"
    And I fill in "category_permalink" with "test-cat"
    And I fill in "category_description" with "Description goes here"
    And I press "Save"
    Then I should be on the new category page
    And I should see "Test Cat"
    And I should see "abc def"
    And I should see "test-cat"
    And I should see "Description goes here"
    
  Scenario: Successfully edit existing category
    Given I am on the edit page for category "General"
    When I fill in "category_name" with "General Edited"
    And I fill in "category_keywords" with "some keyword"
    And I fill in "category_description" with "general description"
    And I press "Save"
    Then I should be on the new category page
    And I should see "General Edited"
    And I should see "some keyword"
    And I should see "general description"
