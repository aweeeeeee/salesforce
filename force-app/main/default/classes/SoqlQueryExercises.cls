public with sharing class SoqlQueryExercises {
    public SoqlQueryExercises() {
        /**
         * 1.Write a method to insert an Account record. Also insert five related contacts to that same account.

            2.Write a SOQL query to fetch the contact records that were inserted in previous question. (Hint: Use the CreatedDate field to add filter)

            3.Write a query on Contact object and fetch the Account details. Use child to parent relationship query.

            4.Write a query on Account object and fetch the related contacts. Use the parent to child relationship query.
         * 
         */
        try {
            Account acct =  new Account(
                Name = 'awe'
            );
            insert acct;
            
            System.debug('sucess insert account');

            ID acctID = acct.ID;
            System.debug(acctID);
            Integer Num = 1;

            List<Contact> Ctn = new List<Contact>();
                while (Num <= 5){
                    Contact ct = new Contact();
                    ct.FirstName = 'aweF' + Num;
                    ct.LastName = 'aweL' + Num;
                    ct.AccountID = acctID;
                    Num = Num + 1;
                    Ctn.add(ct);
                }
            insert ctn;
            System.debug('succesfuly insert contact');

            //List<Contact> CtnDisplay = [SELECT Id, FirstName, LastName FROM Contact WHERE AccountID = acctID ];
            //System.debug(CtnDisplay.size());
            Account[] accts = [SELECT Name,Phone FROM Account];
            System.debug(accts);

            Contact[] ctnDisplay = [SELECT id, FirstName, Lastname FROM Contact ];
            System.debug(ctnDisplay);
           
        }
        catch (Exception e){
            System.debug('error');
        }

    }
}
