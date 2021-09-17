public with sharing class ForLoop {
    public ForLoop() {
            Integer Total =0;

            for (Integer i = 1; i <= 10; i++){
                Total = Total + i;
            }

            System.debug(Total);

            Integer Year = 2020;
            Integer Num = 20;

            String Result = Math.Mod(Year,4) == 0
                            ? 'yes its a leap year'
                                : 'no its not leap year';

            for (Integer x = 1; x <= 10; x++){
                String s = Math.Mod(x,2) != 0
                                ? x + 'odd number'
                                    : x + 'even number';

                System.debug(s);
            }
           
            Integer TotalOdd = 0;

            for (Integer x = 1; x <= 10; x++){
                    if(Math.Mod(x,2) != 0) {
                            TotalOdd = TotalOdd + x;

                    }
                               
               
            }
            System.debug(TotalOdd);
            System.debug(Result);
    }
}
