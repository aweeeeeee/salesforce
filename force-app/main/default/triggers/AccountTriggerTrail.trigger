trigger AccountTriggerTrail on Account (before insert,before update) {
   
   /** if(Trigger.isBefore){
        if(Trigger.isInsert){
            for (Account account : Trigger.New) {
                //if(account.Match_Billing_Address__c == true){
                    //account.ShippingPostalCode = account.BillingPostalCode;
               // }
    		}
        }
        
    }**/
    //https://trailhead.salesforce.com/content/learn/modules/apex_triggers/apex_triggers_intro
}