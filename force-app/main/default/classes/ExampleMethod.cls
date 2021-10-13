public with sharing class ExampleMethod {
    public ExampleMethod() {

    }

    public static Integer wilt(Integer numberOfPetals){
        if(numberOfPetals >= 1){
            numberOfPetals--;
        }
        return numberOfPetals;
    }
    public static void grow(Integer height, Integer maxHeight){
        height = height + 2;
        if(height >= maxHeight){
            pollinate();
        }
    }
    public static void pollinate(){
        System.debug('Pollinating...');
    }
    /**
     * ExampleMethod.wilt(4);
        ExampleMethod.grow(5, 7);
     * 
     */

    public static void sObjectsInsert(){
        Account store = new Account();
        store.Name = 'The Tea Factory';
        store.AccountNumber = '356281';
        store.Phone = '555-0158';
        insert store;
    }
    /** ExampleMethod.sObjectsInsert(); */

    public static void sObjectsInsert(Integer value){
        Integer counter = 1;
        //create a list to add our accounts
        List<Account> teaFactoryAccounts = new List<Account>();
        while(counter <= value){
            //display the current counter value
            System.debug('Counter Value before Incrementing ' + counter);
            //create a new account
            Account store = new Account();
            store.Name = 'The Tea Factory ' + counter;
            store.AccountNumber = '35629' + counter;
            teaFactoryAccounts.add(store);
            System.debug(teaFactoryAccounts);
            //increment the counter
            counter = counter + 1;
            System.debug('Counter Value after incrementing ' + counter);
        }
        System.debug('Size of Account List: ' + teaFactoryAccounts.size() );
        System.debug('Elements in Account List: ' + teaFactoryAccounts);
        //insert all of the accounts in the list
        insert teaFactoryAccounts;
    }
        /** ExampleMethod.sObjectInsert(3) */

     public static void orderTea(){
            Set<String> teaTypes = new Set <String>();
            teaTypes.add('Black');
            teaTypes.add('White');
            teaTypes.add('Herbal');
            system.debug(teaTypes);
        }
    /** ExampleMethod.orderTear(); */

    public static void orderTea2(){
        Set<String> teaTypes = new Set <String>();
        teaTypes.add('Black');
        teaTypes.add('White');
        teaTypes.add('Herbal');
        system.debug(teaTypes);

        Map <String, String> teaTypess = new Map <String, String>();
        teaTypess.put('Black', 'Earthy');
        teaTypess.put('White', 'Sweet');
        teaTypess.put('Herbal', 'Sweet');
    	system.debug(teaTypess);
        
    }
    /** ExampleMethod.ordertea2(); */
    
}