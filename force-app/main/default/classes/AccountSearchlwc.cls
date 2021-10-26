public with sharing class AccountSearchlwc {

   @AuraEnabled(cacheable=true)
   public static List<Account> getAccounts(String actName){
        String keyString = '%'+actName+'%';

        return [select id, name from Account where name like:keyString];

   }
}
