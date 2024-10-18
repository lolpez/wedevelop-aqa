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

  Scenario: Logout user after 5 seconds
    When I login as "ana_mejia" with password "ana_mejia"
    Then I see the title "Welcome, Ana Mejia"
    When I wait 5 seconds in chat room
    Then I see the title "Login"

  Scenario: User A sends a long message to user B
    When I login as "ana_mejia" with password "ana_mejia"
    Then I see the title "Welcome, Ana Mejia"
    When I select user "luis_lopez" to chat
    Then I see the title "Chat with luis_lopez"
    When I send a long message
      """
      A big message
      ===============
      Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.
      Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.
      Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.
      Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.
      """
    Then I see the message sent

  Scenario: User A sends a message to user B with special characters
    When I login as "ana_mejia" with password "ana_mejia"
    Then I see the title "Welcome, Ana Mejia"
    When I select user "luis_lopez" to chat
    Then I see the title "Chat with luis_lopez"
    When I send a long message
      """
      A big message with special characters !@#$%^&*()_+=-09876754321|\n\n\n|?><,.'';"" 🤔✈️😅🖨️🚗
      ===============
      Lorem! ipsum@ dolor# sit$ amet%                 consectetur^ adipiscing& elit* (sed)  
      _do- =eiusmod+ {tempor}        [incididunt] ut| labore: et; dolore' magna"  
      aliqua? /~😀😂🤣😅😊😋🙃

      Lorem<> ipsum`               dolor~ sit amet!!! consectetur  
      adipiscing elit &&&&&??? ###$$$. 🎉🎊🎯📢📣💥!! 🎁⚠️🔔📱💡🤯.  

      "Eiusmod" tempor! incidunt? 😎🤗😴  
      -- ut labore @@@##$$$ incididunt= ut /dolore*  
      aliquip<>            excepteur[] sint occaecat🥳 cupidatat~ non🤠 proident,               
      sunt## in&           culpa! qui🙃 officia🤔 deserunt🎯 mollit[] anim~  
      id💡 est laborum.
      """
    Then I see the message sent

  Scenario Outline:  User A sends multiple messages to user B
    When I login as "ana_mejia" with password "ana_mejia"
    Then I see the title "Welcome, Ana Mejia"
    When I select user "luis_lopez" to chat
    Then I see the title "Chat with luis_lopez"
    When I send <times> messages
      """
      A big message with special characters !@#$%^&*()_+=-09876754321|\n\n\n|?><,.'';"" 🤔✈️😅🖨️🚗
      ===============
      Lorem! ipsum@ dolor# sit$ amet% consectetur^ adipiscing& elit* (sed)  
      _do- =eiusmod+ {tempor} [incididunt] ut| labore: et; dolore' magna"  
      aliqua? /~😀😂🤣😅😊😋🙃

      Lorem<> ipsum` dolor~ sit amet!!! consectetur  
      adipiscing elit &&&&&??? ###$$$. 🎉🎊🎯📢📣💥!! 🎁⚠️🔔📱💡🤯.  

      "Eiusmod" tempor! incidunt? 😎🤗😴  
      -- ut labore @@@##$$$ incididunt= ut /dolore*  
      aliquip<> excepteur[] sint occaecat🥳 cupidatat~ non🤠 proident,  
      sunt## in& culpa! qui🙃 officia🤔 deserunt🎯 mollit[] anim~  
      id💡 est laborum.
      """

    Examples:
      | times | 
      | 10    | 
      | 20    | 
      | 50    | 
      | 100   |