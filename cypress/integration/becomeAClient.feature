
Feature: Become A Client
    I want to become a client

    Scenario Outline: user is not able to submit the form without entering first name
        Given A sign up page
        When I type valid email "<valid_Email>" in the email field
        And  I click on Submit
        Then I should see the validation on "<name>" field

    Examples:
        | valid_Email    | name       |
        | test@gmail.com | First Name |

    Scenario Outline: user is not able to submit the form without entering last name
        Given A sign up page
        When I type valid email "<valid_Email>" in the email field
        And  I click on Submit
        Then I should see the validation on "<name>" field

    Examples: 
        | valid_Email    | name       |
        | test@gmail.com | Last Name  |

    Scenario Outline: user is not able to submit the form with valid data
        Given A sign up page
        When I type valid email "<valid_Email>" in the email field
        And  I type "<first_name>" in first name field
        And  I type "<last_name>" in last name field
        And  I type valid phone no "<valid_phone>" in the phone no field
        And  I type "<company_name>" in company field
        And  I type "<valid_website>" in company website field
        And  I type "<your_job_title>" in Your job field
        And  I select "<select>" from industry dropdown
        And  I type "<position>" in position field
        And  I type valid zip code "<valid_zip_code>" in zipcode field
        And  I click on Submit
        Then I should become a client successfully

        Examples:
            | valid_Email | first_name | last_name | valid_phone | company_name | valid_website | your_job_title    | select | position | valid_zip_code | hiring_goals |           
            | test@gmail.com | Taimur  | aamer     | 03333333333    | Test Company | http://www.test.com | Testing Job Title | Banking| QA Engineer | 12345 | Testing Hiring Goals |

    Scenario Outline: user should not be able to submit the form with already existing email
        Given A sign up page
        When I type valid email "<valid_Email>" in the email field
        And  I click on Submit
        Then I should see the validation on "<name>" field

        Examples:
            | valid_Email    | name        |
            | test@gmail.com | Email field |
            
    Scenario Outline: user is not able to submit the form with invalid Data
        Given A sign up page
        When I type "<invalid_Email>" in email field
        And  I type "<first_name>" in first name field
        And  I type "<last_name>" in last name field
        And  I type "<invalid_phone>" in phone no field
        And  I type "<company_name>" in company field
        And  I type "<valid_website>" in company website field
        And  I type "<your_job_title>" in Your job field
        And  I select "<select>" from industry dropdown
        And  I type "<position>" in position field
        And  I type "<invalid_zip_code>" in zipcode field
        And  I type "<hiring_goals>" in hiring goals field
        And  I click on Submit
        Then I should see the error message

        Examples:
            | invalid_Email | first_name | last_name | invalid_phone | company_name | invalid_website | your_job_title    | select | position | invalid_zip_code | hiring_goals |           
            | test@         | Taimur     | aamer     | hk$&jkhgf%    | Test Company | http://www.test.com | Testing Job Title | Banking| Software Developer | 123 | Testing Hiring Goals |
    
    Scenario Outline: user is not able to submit the form, leaving mandetery fields empty
        Given A sign up page
        And  I click on Submit
        Then I should see the validation on all the mandatory fields

    Scenario Outline: user should not give alphabets and special characters in phone no field
        Given A sign up page
        When I type valid email "<valid_Email>" in the email field
        And  I type "<invalid_phone>" in phone no field
        And  I click on Submit
        Then I should see the error message on "<name>" field

        Examples:
        | valid_Email     |invalid_phone| name      |
        | test@gmail.com  | abcdefgh    | Phone No  |

    Scenario Outline: user should not give alphabets and special characters in zipCode field
        Given A sign up page
        When I type valid email "<valid_Email>" in the email field
        And  I type "<invalid_zip_code>" in zipcode field
        And  I click on Submit
        Then I should see the error message on "<name>" field

        Examples:
        | valid_Email     |invalid_zip_code| name      |
        | test@gmail.com  | abc$%@#$       | Zip Code  |

    Scenario Outline: user should not enter the zipCode less than 5 digits
        Given A sign up page
        When I type valid email "<valid_Email>" in the email field
        And  I type "<invalid_zip_code>" in zipcode field
        And  I click on Submit
        Then I should see the validation message of min 5 integers

        Examples:
        | valid_Email     |invalid_zip_code|
        | test@gmail.com  | 123            |

    Scenario Outline: user should not enter the zipCode more than 10 digits
        Given A sign up page
        When I type valid email "<valid_Email>" in the email field
        And  I type "<invalid_zip_code>" in zipcode field
        And  I click on Submit
        Then I should see the validation message of max 10 integers

        Examples:
        | valid_Email     |invalid_zip_code|
        | test@gmail.com  | 12345678912    |

    Scenario Outline: user is not able to submit the form without entering Workphone
        Given A sign up page
        When I type valid email "<valid_Email>" in the email field
        And  I click on Submit
        Then I should see the validation on "<name>" field

        Examples:
            | valid_Email    | name            |
            |test@gmail.com  | Workphone field |

    Scenario Outline: user is not able to submit the form without entering Company name
        Given A sign up page
        When I type valid email "<valid_Email>" in the email field
        And  I click on Submit
        Then I should see the validation on "<name>" field

        Examples:
            | valid_Email    | name            |
            | test@gmail.com | Company field   |

    Scenario Outline: user is not able to submit the form without entering Company's website
        Given A sign up page
        When I type valid email "<valid_Email>" in the email field
        And  I click on Submit
        Then I should see the validation on "<name>" field

        Examples:
            | valid_Email    | name            |
            | test@gmail.com | Company Website |

    Scenario Outline: user is not able to submit the form without entering Your Job field
        Given A sign up page
        When I type valid email "<valid_Email>" in the email field
        And  I click on Submit
        Then I should see the validation on "<name>" field

        Examples:
            | valid_Email    | name     |
            | test@gmail.com | Your Job |

    Scenario Outline: user is not able to submit the form without entering Positions field 
        Given A sign up page
        When I type valid email "<valid_Email>" in the email field
        And  I click on Submit
        Then I should see the validation on "<name>" field

        Examples:
            | valid_Email    | name      |
            | test@gmail.com | Positions |

    Scenario Outline: user is not able to submit the form without entering zip code field
        Given A sign up page
        When I type valid email "<valid_Email>" in the email field
        And  I click on Submit
        Then I should see the validation on "<name>" field

        Examples:
            | valid_Email    | name      |
            | test@gmail.com | Zip code  |

    Scenario Outline: user is not able to submit the form without entering Hiring goals text area
        Given A sign up page
        When I type valid email "<valid_Email>" in the email field
        And  I click on Submit
        Then I should see the validation on "<name>" field

        Examples:
            | valid_Email    | name         |
            | test@gmail.com | Hiring goals |

    Scenario Outline: user is able to submit the form without entering Workphone
        Given A sign up page
        When I type valid email "<valid_Email>" in the email field
        And  I click on Submit
        Then I shouldn't see the validation on "<name>" field

        Examples:
            | valid_Email    | name      |
            | test@gmail.com | Workphone |


    Scenario Outline: user is able to submit the form without entering Company
        Given A sign up page
        When I type valid email "<valid_Email>" in the email field
        And  I click on Submit
        Then I shouldn't see the validation on "<name>" field

        Examples:
            | valid_Email    | name      |
            | test@gmail.com | Company   |

    Scenario Outline: user is able to submit the form without entering Company Website
        Given A sign up page
        When I type valid email "<valid_Email>" in the email field
        And  I click on Submit
        Then I shouldn't see the validation on "<name>" field

        Examples:
            | valid_Email    | name             |
            | test@gmail.com | Company Website  | 

    Scenario Outline: user is able to submit the form without entering Your Job Title
        Given A sign up page
        When I type valid email "<valid_Email>" in the email field
        And  I click on Submit
        Then I shouldn't see the validation on "<name>" field

        Examples:
            | valid_Email    | name        |
            | test@gmail.com | Job Title   |

    Scenario Outline: user is able to submit the form without entering Position
        Given A sign up page
        When I type valid email "<valid_Email>" in the email field
        And  I click on Submit
        Then I shouldn't see the validation on "<name>" field

        Examples:
            | valid_Email    | name       |
            | test@gmail.com | Position   |

    Scenario Outline: user is able to submit the form without entering Zip code
        Given A sign up page
        When I type valid email "<valid_Email>" in the email field
        And  I click on Submit
        Then I shouldn't see the validation on "<name>" field

        Examples:
            | valid_Email    | name       |
            | test@gmail.com | Zip code   |


    Scenario Outline: user is able to submit the form without entering Hiring goals
        Given A sign up page 
        When I type valid email "<valid_Email>" in the email field
        And  I click on Submit
        Then I shouldn't see the validation on "<name>" field

        Examples:
            | valid_Email    | name           |
            | test@gmail.com | Hiring Goals   |
