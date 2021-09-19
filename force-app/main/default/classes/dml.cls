public with sharing class dml {
    public dml() {
            /**
             *  // Create the account sObject 
                Account acct = new Account(Name='Acme', Phone='(415)555-1212', NumberOfEmployees=100);
                // Insert the account by using DML
                insert acct;
                // Get the new ID on the inserted sObject argument
                ID acctID = acct.Id;
                // Display this ID in the debug log
                System.debug('ID = ' + acctID);
                // Debug log result (the ID will be different in your case)
                // DEBUG|ID = 001D000000JmKkeIAF
             * bulk delete
             * 
             * Contact[] contactsDel = [SELECT Id FROM Contact WHERE LastName='Smith']; 
                delete contactsDel;

             */
            public static Account insertNewAccount(String acctn){
                if(acctn != '') {
                    try {
                     Account acct = new Account(Name=acctn);
                     insert acct;
                     System.debug('succes');
                     return acct;
                    } catch(Exception e){
                       System.Debug('Account not created');
                       return null;
                    }
                    
                } else {
                    return null;
                }

                //dml.insertNewAccount('awe');
    }
}
