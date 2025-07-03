Class unittests.shvarov.persistent.TestTSProperties Extends %UnitTest.TestCase
{

/// Testcase if LastUpdate property is not empty after insert and is set to current time.
Method TestLastUpdateAfterInsert()
{
	set tYesterday=$ZDT($H-1,3)
	set tResults=##class(shvarov.persistent.base).%New()
	Do tResults.%Save()
	Do $$$AssertTrue((tResults.LastUpdate'=""),"LastUpdate is not empty after insert: "_tResults.LastUpdate)
	Do $$$AssertTrue(($SYSTEM.SQL.Functions.DATEDIFF("second",tYesterday,tResults.LastUpdate)>0),"LastUpdate is sooner than expected: Yesterday "_tYesterday_" should be before "_tResults.LastUpdate)
}

/// Testcase if LastUpdate property is updated after update.
Method TestLastUpdateAfterUpdate()
{
	set tResults=##class(shvarov.persistent.base).%New()
	Do tResults.%Save()
	//set tResults
	set tCreatedAt=tResults.LastUpdate
	h 1 // wait 1 second to ensure that LastUpdate will be different
	set tResults.CreatedAt=$ZDT($H-1,3) //set CreatedAt to yesterday
	Do tResults.%Save()
	Do $$$AssertTrue(($SYSTEM.SQL.Functions.DATEDIFF("second",tCreatedAt,tResults.LastUpdate)>0),"LastUpdate is sooner than expected: It was created at "_tCreatedAt_" and it should be before the updated time "_tResults.LastUpdate)
}

/// Testcase if LastUser property is not empty after insert and is set to current user.
Method TestLastUserAfterInsert()
{
	set tResults=##class(shvarov.persistent.base).%New()
	Do tResults.%Save()
	Do $$$AssertTrue((tResults.LastUser'=""),"LastUser is not empty after insert: "_tResults.LastUser)
	Do $$$AssertTrue((tResults.LastUser=$Username),"LastUser is not equal to current user: "_tResults.LastUser_" should be "_$Username)
}

}
