public with sharing class TransactionLogHandler {

    //event practice
    public static void doHandleException(System.Exception ex , String ProcessName) {

        Error_Log__c transactionLog = new Error_Log__c (
            Log_Details__c = ex.getStackTraceString()+'<br>' + ex.getMessage()
            + '<br>' + ex.getCause() + '<br>' + ex.getTypeName() + '<br>' + ex.getLineNumber(),
            Lod_DateTime__c = System.Now(),
            Process_Name__c = processName
        );
        
        insert transactionLog;
        /**
         * anonymous window
         * try{
                integer i = 10/0;
            } catch(System.Exception ex){
                TransactionLogHandler.doHandleException(ex, 'DeveloperConsole');
            }
         */
    }

    public static void doHandleExceptionWithError(String Errors, String ProcessName) {

        Error_Log__c transactionLog = new Error_Log__c (
            Log_Details__c = errors,
            Lod_DateTime__c = System.Now(),
            Process_Name__c = processName
        );
        
        insert transactionLog;
        /**
         * anonymous window
         * try{
                integer i = 10/0;
            } catch(System.Exception ex){
                TransactionLogHandler.doHandleException(ex, 'DeveloperConsole');
            }
         */
    }
}
