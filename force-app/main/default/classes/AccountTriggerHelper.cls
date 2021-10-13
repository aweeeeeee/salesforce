public class AccountTriggerHelper {
	public static void BillingValidate(List<Account> BillingVal) {
        for(Account acct : BillingVal){
            if(acct.BillingStreet ==  null || acct.BillingStreet == '') {
                acct.BillingStreet.addError('Please Input Billing Address');
            }
        }
    }
    
    public static void appendContact(List<Account> accList){
        List<Contact> conList = new List<Contact>();
        for(Account acc : accList) {
			  Contact con = new Contact(AccountId = acc.Id);
			  List<String> name = acc.Name.split(' ');
              con.LastName = name[0] + 'New Contact';
              con.FirstName = name[1] + 'New Contact';
			  conList.add(con);
		}
		insert conList;
    }
    
}