public with sharing class MassDeleteContacts {
    //lwc
    @AuraEnabled(cacheable=true)
    public static List<Contact> getContactList(){
        return [
            SELECT Id, firstName, lastName, Title, Phone, Email
                FROM Contact where FirstName!=null order by createdDate desc
        ];
    }

    @AuraEnabled
    public static Void deleteSelectedContacts(List<Id> selContactIdList){

        List<Contact> contactList = new List<Contact>();
        contactList = [select id from Contact where id in:selContactIdList];
        if(contactlist!=null && contactlist.size()>0){
            delete contactList;
        }
    }
}
