public with sharing class SoqlSavePoint {
    public SoqlSavePoint() {
        Account acc = new Account(
            Name  ='awe new'
        )
        insert acc;

        Account accQuery = [ SELECT Id FROM Account Where Name='awe new'];
        System.debug(accQuery);

        System.Savepoint spt = Databsae.setSavepoint();

        try{
            Contact con = new Contact(
                LastName = 'aweawe'
            );
           
        }
        inssert con;
        catch (Exception ex){
            Database.rollback(spt);
        }
    }
}
