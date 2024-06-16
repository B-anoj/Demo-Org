({
	DoAdd: function(component, event, helper) {
        debugger;
		var num1 = component.get("v.num1");
        var num2 = component.get("v.num2");
        var res = parseInt(num1) + parseInt(num2);
        component.set("v.res", res);
	},
    DoSub : function(component, event, helper){
        debugger;
        var num1 = component.get("v.num1");
        var num2 = component.get("v.num2");
        var res = num1 - num2;
        component.set("v.res", res);
        
    },
    Domul : function(component, event, helper){
        debugger;
         var num1 = component.get("v.num1");
        var num2 = component.get("v.num2");
        var res = num1 * num2;
        component.set("v.res", res);
        
    },
    DoDiv : function(component, event, helper){
        debugger;
        var num1 = component.get("v.num1");
        var num2 = component.get("v.num2");
        var res = num1 / num2;
        component.set("v.res", res);
    }   
})