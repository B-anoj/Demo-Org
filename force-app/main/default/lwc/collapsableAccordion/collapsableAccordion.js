import { LightningElement ,track} from 'lwc';
export default class CollapsableAccordion extends LightningElement {
    // activeSection;
//    @track variable1 = false;
//    @track variable2 = false;
//    @track variable3 = false;
    // handleSectionToggle(event){
    //     this.activeSection = "You have Opened:::" + event.detail.openSections; 
    // }

    // handelclik1(event){
    //     this.variable1 = true;
    //     this.variable2 = false;
    //     this.variable3 = false;
    // }

    // handelclik2(event){
    //     this.variable2 = true;
    //     this.variable1 = false;
    //     this.variable3 = false;
    // }

    // handelclik3(event){
    //     this.variable3 = true;
    //     this.variable1 = false;
    //     this.variable2 = false;
    // }

   @track activeSectionMessage = '';

    handleToggleSection(event) {
        this.activeSectionMessage =
            'Open section name:  ' + event.detail.openSections;
    }

    // handleSetActiveSectionC() {
    //     const accordion = this.template.querySelector('.example-accordion');

    //     accordion.activeSectionName = 'C';
    // }


}