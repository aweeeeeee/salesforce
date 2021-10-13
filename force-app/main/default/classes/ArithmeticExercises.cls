public with sharing class ArithmeticExercises {

    /**
         * Write an Apex class MathCalculator that performs arithmetic operations on Integers based on the following methods on the input numbers passed to them as arguments.
            •add() – Sums 2 input integer arguments and returns the summation
            •multiply() – Multiplies 2 input integer arguments and returns the product

            Add a method printOutput() that prints the summation or the product from the add or multiple methods to the Debug Log.

            (Hint: Implement add(), multiply() and printOutput() as private static methods invoked by a public instance doMath() method. The doMath() method will be invoked from the Execute Anonymous window)
         */

    public Integer TotalSum;
    public Integer TotalMulti;

    public void add(Integer NumOne,Integer Numtwo){
        this.TotalSum = NumOne + Numtwo;
        System.debug(this.TotalSum);
    }

    public void multiply(Integer NumOnee,Integer NumTwoo){
        this.TotalMulti = NumOnee * Numtwoo;
        System.debug(this.TotalMulti);
    }

    public void PrintOutPut(){
       
        System.debug('total sum' + TotalSum);
        System.debug('total multiplication' + TotalMulti);
    }
}