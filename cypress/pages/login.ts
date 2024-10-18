class LoginPage{
    login(username: string, password: string){
        cy.get('[test-id="username"]').type(username);
        cy.get('[test-id="password"]').type(password);
        cy.get('[test-id="login-button"]').click();
    }

    verifyLoginMessage(message){
        cy.get('[test-id="error-message"]').should('have.text', message)
    }
}


export const loginPage = new LoginPage();