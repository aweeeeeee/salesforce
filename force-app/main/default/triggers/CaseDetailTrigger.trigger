trigger CaseDetailTrigger on Case (before insert, after insert,
                                   before update, after update) {
    if(Trigger.IsBefore){
        if(Trigger.isUpdate){
            
            List<AggregateResult> activeCase = [SELECT count(Id)activeCase,
                                                contactId FROM Case
                                                	WHERE Status IN ('New', 'Working', 'Escalated')
                                                		group by contactId];
            List<AggregateResult> closedCase = [SELECT count(Id)closedCase,
                                                contactId FROM Case
                                                	WHERE Status ='Closed'
                                                		group by contactId];
            List<AggregateResult> totalCase = [SELECT count(Id)totalCase,
                                                contactId FROM Case
                                                		group by contactId];
            
			Integer ActiveC = (Integer) activeCase[0].get('activeCase');
            Integer ClosedC = (Integer) activeCase[0].get('closedCase');
			Integer TotalC = (Integer) activeCase[0].get('totalCase');            
            
            Set<Id> accountIds = new Set<Id>();
                       
            List<Account> accList = new List<Account>([SELECT Id, Active_Cases__c, Closed_Cases__c, 
                                    			Total_Cases__c, Last_Updated_Case__c FROM Account 
                                                       WHERE Id IN :accountIds]);
            
    		Map<Id,List<Account>> AccountMap = new Map<Id,List<Account>>();
            
            for(Account acct :  accList) {
                Acct.Active_Cases__c = ActiveC;
                Acct.Closed_Cases__c = ClosedC;
                Acct.Total_Cases__c = TotalC;
                Acct.Last_Updated_Case__c = '';
                accList.add(Acct);
                
            }         
            update accList;
            
            
        }
    }
}