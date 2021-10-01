public virtual class CityCensusToQueue {
    public void ToQueue() {

        Group assignQue = [SELECT Id,Name FROM Group WHERE Type='Queue' AND Name='Makati City Approvers'];

    }
}
