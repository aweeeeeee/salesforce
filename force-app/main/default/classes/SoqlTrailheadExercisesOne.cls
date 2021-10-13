public with sharing class SoqlTrailheadExercisesOne {
    //public class AccountUtility =soql trailhead
        public static void viewAnnualRevenue(){
            String acctRev = '';
            List<Account> accountsList = [SELECT Name, AnnualRevenue FROM Account];
            //Account acctRev = new Account();
            for (Account Acc : accountsList) {
                //acctRev.Name = 'Account Name:' + Acc.Name;
                //acctRev.AnnualRevenue = 'Annual Revenue:' + Acc.AnnualRevenue;
                //accountsList.add(acctRev);
                acctRev = 'Account Name:' + Acc.Name + 'Annual Revenue' + Acc.AnnualRevenue;
                
            }
            System.debug(acctRev);
        }

}