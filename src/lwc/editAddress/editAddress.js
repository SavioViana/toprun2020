import { api, LightningElement } from 'lwc';
 
export default class EditAddress extends LightningElement {

    @api
    address;

    constructor () {
        super();
        console.log('EditAddress Run Constructor');

        this.address = {
            street : 'Rua XUYZ'
            , streetNumber : '123'
            , additionalInfo : 'apto 432'
            , zipCode : '12222000'
            , city : 'São José dos Campos'
            , state : 'SP'
        }

    }

    connectedCallback () {
        console.log('EditAddress Connected Callback');
    }

    renderedCallback () {
        console.log('EditAddress Rendered Callback');
    }

    handleSearchedAddress (event) {
        console.log ( JSON.stringify (event.detail)  );
        this.address = event.detail;
    }


}