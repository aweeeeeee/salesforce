public with sharing class ExerciseTwo {
    public ExerciseTwo() {

        
       
    }

     /** StringArrayTest s = bew  */
 
    public static String[] generateStringArray(integer len) {
           
            String[] myArray = new List<String>();
                
                for(Integer i=0;i< len;i++) {
                        myArray.add('Test ' +i);          
                        System.debug(myArray[i]);
                } 
                return myArray;
    }   
    /** StringArrayTest.generateStringArray(5); */
    
}
