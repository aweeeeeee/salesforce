public with sharing class AccountSearchController {
    //lwc
    @AuraEnabled(cacheable=true)
    public static List<Account> getAccounts(String actName){
       List<Account> accountList = new List<Account>();
       if(actName !=''){
           String AccountName = '%' + actName + '%';
           accountList = [select id, name from Account where name like:accountName];
           return accountList;
       }
       return accountList;
    }
}
