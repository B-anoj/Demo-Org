import { LightningElement } from 'lwc';

export default class ChildEvent extends LightningElement {
    handleEvent() {
        const event = new CustomEvent('childEvent', {
            detail: { message: 'Hello from child LWC!' }
        });
        this.dispatchEvent(event);
    }
}