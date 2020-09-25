import { LightningElement } from 'lwc';
 
export default class AccountBillingAddress extends LightningElement {

    billingAddress;

    constructor() {
        super();
        console.log('AccountBillingAddress Run Constructor');

        this.billingAddress = {
            street: 'Rua do Bisso',
            streetNumber: '34543',
            additionalInfo: 'apto 4432',
            zipCode: '12225070',
            city: 'São José dos Campos',
            state: 'SP'
        }

    }

    connectedCallback() {
        console.log('AccountBillingAddress Connected Callback');
    }

    renderedCallback() {
        console.log('AccountBillingAddress Rendered Callback');
    }

}