public with sharing class collectionsMap {
    public collectionsMap() {
        Map<Id,List<Opportunity>> accIdWithOpplIstMap=new Map<Id,List<Opportunity>>();
        For(Account acc :[SELECT id,(SELECT id,Name FROM Opportunities)FROM Account]){
        accIdWithOpplIstMap.put(acc.Id,acc.Opportunities);
            system.debug(acc.Id);
            system.debug(acc.Opportunities);
        }
    }
    //https://github.com/pozil/apex-sorting
    //https://developer.salesforce.com/docs/atlas.en-us.apexcode.meta/apexcode/apex_dev_guide.htm
    //https://docs.oracle.com/javase/6/docs/api/index.html?java/lang/Iterable.html
    //https://developer.salesforce.com/docs/atlas.en-us.apexref.meta/apexref/apex_namespace_System.htm
}
