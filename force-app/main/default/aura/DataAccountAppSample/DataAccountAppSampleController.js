({
	onInit : function(component, event, helper) {
		helper.getAccounts(component);
        helper.checkActive(component);
        helper.getTypePicklist(component, event);
        helper.getIndustryPicklist(component, event);      
        component.set("v.columns",  [
            {label: 'Account Name', fieldName: 'Name', type: 'text'},
            {label: 'Phone', fieldName: 'Phone', type: 'text'},
            {label: 'Industry', fieldName: 'Industry', type: 'text'},
            {label: 'Type', fieldName: 'Type', type: 'text'},
            {label: 'Action', type: 'button', typeAttributes: {
                label: 'Delete',
                name: 'delete',
                title: 'Delete',
                disabled: false,
                iconName: 'utility:delete',
                iconPosition: 'left',
                variant: 'destructive'
            }}
            ]);
        
	},
    
    showAccounts : function(component, event, helper){
      helper.getAccounts(component);
      helper.checkActive(component);
    },
    
    openModel: function(component, event, helper) {
      component.set("v.isOpen", true);
   },
 
   closeModel: function(component, event, helper) {
      component.set("v.isOpen", false);
   },
    
    doSave : function(component, event, helper) {
      helper.saveItms(component);
      helper.checkActive(component);
	},
    
    handleRowAction : function(component, event, helper) {
        var action = event.getParam('action');
        helper.deleteRecord(component, event);
    },
    
    changeAccStatus: function(component, event, helper){
        helper.getAccStatus(component);
    },
    
    searchTable: function (cmp, event, helper) {
        var allRecords = cmp.get("v.allData");
        var searchFilter = event.getSource().get("v.value").toUpperCase();
        var tempArray =[];
        var i;
        
        for(i=0; i<allRecords.length; i++){
            if((allRecords[i].Name && allRecords[i].Name.toUpperCase().indexOf(searchFilter) != -1) || 
               (allRecords[i].Phone && allRecords[i].Phone.toUpperCase().indexOf(searchFilter) != -1)){
                tempArray.push(allRecords[i]);
            }
        }
        cmp.set("v.data",tempArray);
    }

    
     
})