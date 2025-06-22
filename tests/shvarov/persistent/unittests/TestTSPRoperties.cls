Class shvarov.persistent.unittests.TestTSProperties Extends %UnitTest.TestCase
{

Method LastUpdateForInsert()
{
	set time=$H,P(time,",",2)=$P(time,",",2)-1
	set tExpected=$ZDATETIME(time,3)
	set tResults=##class(shvarov.persistent.base).%New()
	Do tResults.%Save()
	Do $$$AssertTrue((tResults.LastUpdate'=""),"LastUpdate is not empty after insert: "_tResults.LastUpdate)
	Do $$$AssertTrue(($SYSTEM.SQL.DATEDIFF("second",tExpected,$ZDT(tResults.LastUpdate,3))),"LastUpdate is later than expected: "_tExpected_" before "_tResults.LastUpdate)
}

}
