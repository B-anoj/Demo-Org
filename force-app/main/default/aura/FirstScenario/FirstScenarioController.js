({
	saveClick : function(component, event, helper) {
        debugger;
        var ldname = component.find("lname").get("v.value");
        var ldstatus= component.find("lstatus").get("v.value");
        var ldemail= component.find("lemail").get("v.value");
        var lcompany= component.find("lcomp").get("v.value");
        var saveaction=component.get("c.cretrecord");
        
        saveaction.setParams({
            "lname":ldname
        });
         saveaction.setCallback(this, function(response){
             debugger;
            var state=response.getState();
            if(state === "SUCCESS"){
                component.set("v.message","Lead created successfully.")
            }else if(state === "ERROR"){
                console.log("problem save the record"+state);
            }else{
                console.log("no problem"+state);
            }
           
        });
        $A.enqueueAction(saveaction);
	}
})