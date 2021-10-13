public with sharing virtual class ExtClsTwo {
    public virtual void printStr() {
        System.debug('this is the default string');
        Account[] accts = [SELECT Name,Phone FROM Account];
        System.debug(accts);
    }
}