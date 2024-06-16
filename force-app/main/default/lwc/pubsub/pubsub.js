/** 
 Here Salesforce already publish a pubsub.js file which we will use. 
 * A basic pub-sub mechanism for sibling component communication 

 * 
 */ 

const events = {};

 
 const samePageRef = (pageRef1, pageRef2) => {
     const obj1 = pageRef1.attributes;
     const obj2 = pageRef2.attributes;
     return Object.keys(obj1)
         .concat(Object.keys(obj2))
         .every(key => {
             return obj1[key] === obj2[key];
         });
 };
 /** 

 * Registers a callback for an event 

 * @param {string} eventName – Name of the event to listen for. 

 * @param {function} callback – Function to invoke when said event is fired. 

 * @param {object} thisArg – The value to be passed as the this parameter to the callback function is bound. 

 */ 
 

 const registerListener = (eventName, callback, thisArg) => {
     
     if (!thisArg.pageRef) {
         throw new Error(
             'pubsub listeners need a "@wire(CurrentPageReference) pageRef" property'
         );
     }
 
     if (!events[eventName]) {
         events[eventName] = [];
     }
     const duplicate = events[eventName].find(listener => {
         return listener.callback === callback && listener.thisArg === thisArg;
     });
     if (!duplicate) {
         events[eventName].push({ callback, thisArg });
     }
 };
 /** 

 * Unregisters a callback for an event 

 * @param {string} eventName – Name of the event to unregister from. 

 * @param {function} callback – Function to unregister. 

 * @param {object} thisArg – The value to be passed as the this parameter to the callback function is bound. 

 */ 

 

 const unregisterListener = (eventName, callback, thisArg) => {
     if (events[eventName]) {
         events[eventName] = events[eventName].filter(
             listener =>
                 listener.callback !== callback || listener.thisArg !== thisArg
         );
     }
 };
 
 
 const unregisterAllListeners = thisArg => {
     Object.keys(events).forEach(eventName => {
         events[eventName] = events[eventName].filter(
             listener => listener.thisArg !== thisArg
         );
     });
 };
 
 
 const fireEvent = (pageRef, eventName, payload) => {
     if (events[eventName]) {
         const listeners = events[eventName];
         listeners.forEach(listener => {
             if (samePageRef(pageRef, listener.thisArg.pageRef)) {
                 try {
                     listener.callback.call(listener.thisArg, payload);
                 } catch (error) {
                     // fail silently
                 }
             }
         });
     }
 };
 
 export {
     registerListener,
     unregisterListener,
     unregisterAllListeners,
     fireEvent
 };