Feature: Chat App

  Background: Background name
    Given I visit Chat App

  Scenario: Login with existing user
    When I login as "ana_mejia" with password "ana_mejia"
    Then I see the title "Welcome, Ana Mejia"

  Scenario: Login with non existing user
    When I login as "non_user" with password "abc"
    Then I see error message "Invalid username or password"

  Scenario: User A sends a message to user B
    When I login as "ana_mejia" with password "ana_mejia"
    Then I see the title "Welcome, Ana Mejia"
    When I select user "luis_lopez" to chat
    Then I see the title "Chat with luis_lopez"
    When I send message "hello world"
    Then I see the message sent
    When I go back
    And I select user "luis_lopez" to chat
    Then I see the message sent

  Scenario: User A sends a message to user B and user B sees the message
    When I login as "ana_mejia" with password "ana_mejia"
    Then I see the title "Welcome, Ana Mejia"
    When I select user "luis_lopez" to chat
    Then I see the title "Chat with luis_lopez"
    When I send message "hello world"
    Then I see the message sent
    When I go back
    And I logout
    And I login as "luis_lopez" with password "luis_lopez"
    Then I see the title "Welcome, Luis Lopez"
    When I select user "ana_mejia" to chat
    Then I see the message sent