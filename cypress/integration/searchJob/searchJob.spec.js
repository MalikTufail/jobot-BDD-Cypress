import selectors from "../../src/locators.json"    
const {whatSearch, whereSearch, searchtitle, remote, whatLabel, searchSuggestion} = selectors.search
describe('Become a client', () => {
    
    Given('A search page', () => {
        cy.visit('https://uat.jobot.com/')
    })
    // When('I Search for a Job and verify the relevant results', () => {
    //     let array1 =  ['QA Engineer','Software Engineer','QA Analyst']
    //     for (var i=0; i < array1.length; i++){
    //     console.log(array1[i])
    //     cy.get(whatSearch).clear().type(array1[i])
    //     cy.get(whereSearch).clear().type('Remote')
    //     cy.get('button').contains(/Search/i).click()
    //     cy.get(searchtitle).then ($test => {
    //         cy.get($test).find('a[type="button"]').each(($el, index, $list) => {
    //             cy.contains($el[0].innerText).scrollIntoView().should('be.visible')
    //         })
    //         cy.get($test).find(remote).each(($remote, index, $list) => {
    //             cy.get($remote).contains(/Remote/i).should('have.class', 'text-bold').should('be.visible')
    //         })
    //     })
    //     }
    // })
    When('I Search for a job and verify the relevant results', (datatable) => {
        datatable.hashes().forEach((value) => {
        cy.get(whatSearch).clear().type(value.job)
        cy.get(whereSearch).clear().type('Remote')
        cy.get('button').contains(/Search/i).click()
        cy.get(searchtitle).then ($test => {
            cy.get($test).find('a[type="button"]').each(($el, index, $list) => {
                cy.contains($el[0].innerText).scrollIntoView().should('be.visible')
            })
            cy.get($test).find(remote).each(($remote, index, $list) => {
                cy.get($remote).contains(/Remote/i).should('have.class', 'text-bold').should('be.visible')
            })
        })
    })
    })
    When('I type in the search field', () => {
        cy.get(whatSearch).clear().type('QA')
        cy.get(searchSuggestion).each( relevant => {
            cy.contains(relevant[0].innerText).should('be.visible')
        })
    })
    When('I click on the search button', () => {
        cy.get('button').contains(/Search/i).click()
        cy.get(whatLabel).should('have.class', 'q-field--error')
    })
})