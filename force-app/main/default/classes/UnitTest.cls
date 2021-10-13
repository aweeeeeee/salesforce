@isTest
public with sharing class UnitTest {
   
    @isTest
    static void accountTest(){
        Account acc = new Account(Name='aweaw', Industry='education',Rating='Hot',Phone = '111-1111');
        insert acc;
    }
    // click run test button - right

    //other sample
    @testSetup
    static void mySetupData(){
        Account acc = new Account(Name='aweaw', Industry='education',Rating='Hot',Phone = '111-1111');
        insert acc;
    }

    @isTest
    static void accountTestSetup(){
        Account accountRecord = [SELECT Id FROM Account Where Name ='aweaw'];
        System.debug(accountRecord);
        System.assertNotEquals(null, accountRecord);
    }
}