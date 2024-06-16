({
	doInit : function(component, event, helper) {
		debugger;
        var getCurrentId = component.get("v.recordId");
        component.set("v.RecordId",getCurrentId);
	}
})