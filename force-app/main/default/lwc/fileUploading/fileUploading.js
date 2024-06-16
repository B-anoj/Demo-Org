import { LightningElement, api } from 'lwc';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';

export default class FileUploading extends LightningElement {
    @api recordId;
    get acceptedFormats() {
        return ['.pdf', '.csv'];
    }

    handleSubmit(event) {
        debugger;
        event.preventDefault();
       // event.target.submit();
    }

    // handleSuccess() {
    //     debugger;
    //     this.showToast('Success', 'Files uploaded successfully', 'success');
    // }

    // handleError() {
    //     debugger;
    //     this.showToast('Error', 'There was an error uploading files', 'error');
    // }

    handleUploadFinished(event) {
        debugger;
        const uploadedFiles = event.detail.files;
        // Perform actions with uploaded files (if needed)
        this.showToast('Success', `${uploadedFiles.length} files uploaded successfully`, 'success');
    }

    showToast(title, message, variant) {
        const toastEvent = new ShowToastEvent({
            title: title,
            message: message,
            variant: variant
        });
        this.dispatchEvent(toastEvent);
    }
}