trigger AccountTriger on Account (before insert,before update) {
    if(Trigger.isBefore && Trigger.IsInsert){
        System.debug('before insert trigger');
    }
    if(Trigger.isUpdate){
        if(Trigger.isBefore){
            for(Account acc: Trigger.new){
                System.debug('new name' + acc.Name);
                System.debug('old name' + Trigger.oldMap.get(acc.Id).Name);
            }
        }
    }
    
    // created new account and view debug log. and update
}