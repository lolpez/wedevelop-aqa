class ChatPage{

    verifyTitle(title: string){
        cy.get('[test-id="title"]').should('have.text', title);
    }

    openUser(username: string){
        cy.get(`.chat-user[test-id="${username}"] a`).click();
    }

    sendMessage(message: string){
        const messageSent = `${message}-${new Date().toISOString()}`
        cy.get('[test-id="message"]').type(messageSent, {
          delay: 0,
          parseSpecialCharSequences: false
        });
        cy.get('[test-id="send-button"]').click();
        this.verifyMessage(messageSent);
        return messageSent;
    }

    verifyMessage(message: string) {
        cy.contains('.message p', message.replace(/[\n\r\s]+/g, ' '), { timeout: 20000 });
    }

    goBack() {
        cy.get('[test-id="back-button"]').click();
    }

    logout() {
        cy.get('[test-id="logout-button"]').click();
    }
    
}


export const chatPage = new ChatPage();