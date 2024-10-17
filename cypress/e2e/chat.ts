import { Given, When, Then } from "@badeball/cypress-cucumber-preprocessor";
import 'cypress-mochawesome-reporter/cucumberSupport';

let messageSent = "";

Given("I visit Chat App", () => {
  cy.visit("http://localhost:3000");
});

When("I login as {string} with password {string}", (username: string, password: string) => {
  cy.get('[test-id="username"]').type(
    username
  );
  cy.get('[test-id="password"]').type(
    password
  );
  cy.get('[test-id="login-button"]').click();
});

Then("I see the title {string}", (title: string) => {
  cy.get('[test-id="title"]').should('have.text', title)
});

Then("I see error message {string}", (title: string) => {
  cy.get('[test-id="error-message"]').should('have.text', title)
});

When("I select user {string} to chat", (username: string) => {
  cy.get(`.chat-user[test-id="${username}"] a`).click();
});

When("I send message {string}", (message: string) => {
  messageSent = `${message}-${new Date().toISOString()}`
  cy.get('[test-id="message"]').type(messageSent);
  cy.get('[test-id="send-button"]').click();
});

Then("I see the message sent", () => {
  cy.contains('.message', messageSent);
});

When("I go back", () => {
  cy.get('[test-id="back-button"]').click();
});

When("I logout", () => {
  cy.get('[test-id="logout-button"]').click();
});
