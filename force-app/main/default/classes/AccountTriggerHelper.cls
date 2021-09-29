public class AccountTriggerHelper {
	public static void BillingValidate(List<Account> BillingVal) {
        for(Account acct : BillingVal){
            if(acct.BillingStreet ==  null || acct.BillingStreet == '') {
                acct.BillingStreet.addError('Please Input Billing Address');
            }
        }
    }
    
}