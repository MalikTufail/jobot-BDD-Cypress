Feature: Search for a Job
    I want to Search a Job

    # Scenario: user is not able to submit the form with invalid Email address
    # Given A search page
    # When I Search for a Job and verify the relevant results
    
    Scenario: user is not able to submit the form with invalid Email address
        Given A search page
        When I Search for a job and verify the relevant results
        |job |
        |QA Engineer |
        |software Developer |
        |QA Analyst | 

    # Scenario: the search field should show suggestions that matche typed keyword
    # Given A search page
    # When I type in the search field

    # Scenario: when user click on the search button directly, the search results should be displayed
    # Given A search page
    # When I click on the search button