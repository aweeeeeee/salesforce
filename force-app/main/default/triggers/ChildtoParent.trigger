trigger ChildtoParent on Contact (after update) {

    Map<Id,Contact> MapCo = New Map <Id, Contact>();
    Map<Id,Contact> MapCon = New Map <Id, Contact>();

    list<Account>batch1 = new list<Account>();
    list<Account>batch2 = new list<Account>();

    if (trigger.isExecuting && trigger.isAfter & trigger.isUpdate){

        for(Contact Co : trigger.new){
            if(Co != trigger.OldMap.get(Co.Id)){

                MapCo.put(Co.AccountId, Co);
                MapCon.put(Co.Id,Co);

                if(MapCo.size() > 0 ){
                    batch1 = [SELECT Id, Name FROM Account Where Id =:MapCo.KeySet()];
                }
            }
            
            for(Account Acc: batch1){
                System.debug('acct' + acc);
                Contact c = [SELECT Id, Name FROM Contact WHERE AccountId=:Acc.id LIMIT 1 ];
				
                acc.Name = c.Name + ' New Contact';
                batch2.add(acc);
                System.debug(acc.Name);
            }
        }

        update batch2;
    }
}