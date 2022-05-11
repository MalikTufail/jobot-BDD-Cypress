import validData from '../../fixtures/validData.json'
import invalidData from '../../fixtures/invalidData.json'
import selectors from "../../src/locators"
import validation from "../../fixtures/validation.json"
const {invalidEmailId, invalidZipCode, invlidPhoneNumber} = invalidData
const {emailId, firstName, lastName, phoneNumber, company, companyWebsite, jobTitle, position, zipCode, text} = validData
describe('Become a client', () => {
    Given('A sign up page', () => {
        cy.visit('/become-a-client')
    })
/// When
    When(/^I type "([^"]*)" in email field/, function(type) {
        cy.get(selectors.emailAddress).type(type);         
    });
    When(/^I type valid email "([^"]*)" in the email field/, function(type) {
        cy.get(selectors.emailAddress).type(type);         
    });
    When("I don't enter the First Name", () => {
        cy.get(selectors.firstNameField).type('')
    })
/// And 
    And("I don't enter the Last Name", () => {
        cy.get(selectors.lastNameField).type('')
    })
    And (/^I type "([^"]*)" in first name field/, function(type) {
        cy.get(selectors.firstNameField).type(type)
    })
    And (/^I type "([^"]*)" in last name field/, function(type) {
        cy.get(selectors.lastNameField).type(type)
    })
    And (/^I type "([^"]*)" in phone no field/, function(type) {
        cy.get(selectors.phoneNumberField).type(type)
    })
    And (/^I type "([^"]*)" in company field/, function(type) {
        cy.get(selectors.companyField).type(type)
    })
    And (/^I type "([^"]*)" in company website field/, function(type) {
        cy.get(selectors.companyWebsiteField).type(type)
    })
    And (/^I type "([^"]*)" in Your job field/, function(type) {
        cy.get(selectors.jobTitleField).type(type)
    })
    And (/^I select "([^"]*)" from industry dropdown/, function(type) {
        cy.get(selectors.jobTitleField).type(type)
    })
    And (/^I type "([^"]*)" in position field/, function(type) {
        cy.get(selectors.positionField).type(type)
    })
    And (/^I type "([^"]*)" in zipcode field/, function(type) {
        cy.get(selectors.zipCodeField).type(type)
    })
    And (/^I type "([^"]*)" in hiring goals field/, function(type) {
        cy.get(selectors.textArea).type(type)
    })
    And (/^I type valid phone no "([^"]*)" in the phone no field/, function(type1) {
        cy.get(selectors.phoneNumberField).type(type1)
    })
    And (/^I type valid zip code "([^"]*)" in zipcode field/, function(type) {
        cy.get(selectors.zipCodeField).type(type)
    })
    And ('I click on Submit', function () {
        cy.button(selectors.submitBtn)
    })
/// Then
    Then('I should see the error message', () => {
        cy.contains(validation.emailFieldValidationMsg)
    })
    Then(/^I should see the validation on "([^"]*)" field/, () => {
        cy.contains(validation.validationMsg)
    })
    Then('I should become a client successfully', () => {
        cy.contains(/Thank you for reaching out to Jobot/i)
    })
    Then('I should see the error message of already existing email', () => {
        cy.contains(validation.existingEmailMsg)
    })
    Then(/^I should see the error message on "([^"]*)" field/, () => {
        cy.contains(/Only integers are accepted/i)
    })
    Then('I should see the error message on all the mandatory fields', () => {
        cy.contains(validation.validationMsgOnBlankSpaces)
    })
    Then('I should see the validation message of min 5 integers', () => {
        cy.contains(validation.zipCodeLessThanFiveCharactersValidation)
    })
    Then('I should see the validation message of max 10 integers', () => {
        cy.contains(validation.zipCodeMoreThantenCharactersValidation)
    })
    Then(/^I shouldn't see the validation on "([^"]*)" field/, () => {
        cy.contains(/Thank you for reaching out to Jobot/i)
    })
})