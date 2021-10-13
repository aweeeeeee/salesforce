trigger LeadTrigger on Lead (before insert,after insert) {
    if(Trigger.isBefore){
        if(Trigger.isInsert){
            for(Lead tempLead : Trigger.New){
                tempLead.LastName = tempLead.Lastname + '(New)';
            }
        }
    }
}