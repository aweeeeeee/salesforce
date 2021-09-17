public with sharing class ConditionalStatement {
    public ConditionalStatement() {
            String Name ='juan';
            String Status='premium';

            String Result = Name =='juan'
                        ? status == 'premium'
                            ? 'yes its premium'
                                : 'no its not premium'
                        : 'not correct name';

            System.debug(Result);
    }
}
