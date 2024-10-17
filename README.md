# wedevelop-challenge AQA

This backend project uses:
1. Cypress as E2E framework
1. [Cucumber plugin](https://github.com/badeball/cypress-cucumber-preprocessor) for redacting features. Note that Cypress does not officially support Cucumber so the plugin has some limitations 
2. TypeScript as language

## How to install

1. Make sure Backend and Frontend are running.
2. Make sure to have NodeJs on your local environment (LTS version is recommended)
3. Open a terminal inside the project and execute `npm install`
4. Execute `npx cypress open` to open cypress
5. Execute `npx cypress run` to run all tests in headless mode, the report will be generated at `cypress/reports` once the run is completed

## How to run tests

1. Once Cypress app is opened, select E2E Testing, then Chrome
2. Select `chatapp` feature to run the tests
