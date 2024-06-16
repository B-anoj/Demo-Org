import { LightningElement,wire } from 'lwc';

import { publish,MessageContext} from 'lightning/messageService';

import COUNTING_UPDATED_CHANNEL from '@salesforce/messageChannel/create_update__c';

export default class lwcpub1 extends LightningElement {

@wire(MessageContext)MessageContext  //Load the message by the help of wire method.



handleincrement(){

const payload = { operator : 'add',constant :1 };

publish(this.MessageContext ,COUNTING_UPDATED_CHANNEL ,payload );

}

handledecrement(){

const payload ={

    operator : 'sub',

    constant :1

};

publish(this.MessageContext ,COUNTING_UPDATED_CHANNEL ,payload );

}

handlemultiply(){

const payload ={

    operator : 'multiply',

    constant :2

};

publish(this.MessageContext ,COUNTING_UPDATED_CHANNEL ,payload );

}

}