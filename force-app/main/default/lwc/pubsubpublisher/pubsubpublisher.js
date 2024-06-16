import { LightningElement } from 'lwc';
import pubsub from 'c/pubsub'
export default class Pubsubpublisher extends LightningElement {
    pubme(event)
    {
        let message ={
            "message" :'Hii ,this is pubsub also know as singleton',
            "name" :"Banoj",
            "Phone" :"5678909"
        }
        pubsub.fireEvent("eventnotify",message);
    }
}