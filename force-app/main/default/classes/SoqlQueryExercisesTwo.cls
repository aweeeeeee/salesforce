public with sharing class SoqlQueryExercisesTwo {
    public SoqlQueryExercisesTwo() {
        Account acct = [SELECT Id FROM Account WHERE Name='awe'];
        acct.Name ='aweawe';
        update acct;
        System.debug('succesfully updated');

        //Account acc = [SELECT ID FROM Account WHERE Name='Tea Factory'];
       // Delete acc;
        //System.debug('Successfuly Deleted');
    }
}
