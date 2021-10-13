trigger AccountCaseDetailTrigger on Account (before insert,after insert,
                                   before update, after update) {
	AccountCaseDetailHandler.CreateHandler();
}