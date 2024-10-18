import 'cypress-mochawesome-reporter/cucumberSupport';
import { Given, When, Then } from "@badeball/cypress-cucumber-preprocessor";
import { chatPage, loginPage } from '../pages'

let messageSent = "";

Given("I visit Chat App", () => {
  cy.visit("http://localhost:3000");
});

When("I login as {string} with password {string}", (username: string, password: string) => {
  loginPage.login(username, password);
});

Then("I see the title {string}", (title: string) => {
  chatPage.verifyTitle(title);
});

Then("I see error message {string}", (message: string) => {
  loginPage.verifyLoginMessage(message);
});

When("I select user {string} to chat", (username: string) => {
  chatPage.openUser(username);
});

When("I send message {string}", (message: string) => {
  messageSent = chatPage.sendMessage(message);
});

Then("I see the message sent", () => {
  chatPage.verifyMessage(messageSent);
});

When("I go back", () => {
  chatPage.goBack();
});

When("I logout", () => {
  chatPage.logout();
});

When("I wait 5 seconds in chat room", () => {
  cy.wait(6000);
});

When("I send a long message", (longMessage: string) => {
  messageSent = chatPage.sendMessage(longMessage);
});

When("I send {int} messages", (times:number, message: string) => {
  for (let i = 0; i < times; i++) {
    chatPage.sendMessage(`${message}-Automated message ${i + 1}`);
  }
})