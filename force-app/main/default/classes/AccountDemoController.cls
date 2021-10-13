public with sharing class AccountDemoController {
    public AccountDemoController() {

    }

    @AuraEnabled(cacheable=true)
    public static list<Account> dipslayAcctRecords(){

        List<Account> accList = [SELECT Id, Name FROM Account limit 5];
        return accList;
    }

    @AuraEnabled
    public static list<Contact> displayConRecords(String AccId){
      List<Contact> conList = new List<Contact>();
      for(Contact co: [SELECT Id,LastName,AccountId FROM Contact WHERE AccountId =:AccID]){
        conList.add(co);
      }
      return conList;
    }
}