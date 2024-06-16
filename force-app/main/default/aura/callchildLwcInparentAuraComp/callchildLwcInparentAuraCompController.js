// parentAuraController.js
({
    handleChildEvent: function(component, event, helper) {
        var message = event.getParam('message');
        // Perform actions based on the data received from the child LWC
        console.log(message);
    }
})