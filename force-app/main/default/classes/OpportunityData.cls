public with sharing class OpportunityData {
    @AuraEnabled(cacheable=true)
    public static List<Opportunity> getOpportunities() {
        return [SELECT Id, Name, Amount FROM opportunity];
    }
}
