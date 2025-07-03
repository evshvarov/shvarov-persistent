Class shvarov.persistent.base Extends %Persistent
{

/// This class is a base class for persistent objects.
/// It provides common functionality for all persistent objects.
/// It is not intended to be instantiated directly.
/// Instead, it should be extended by other classes that require persistence.
/// A property that will always content time the instance was created.
Property CreatedAt As %TimeStamp [ InitialExpression = {$ZDT($H, 3)} ];

/// A property that will always content time the instance was last updated.
Property LastUpdate As %TimeStamp [ SqlComputeCode = {set {*}=$ZDATETIME($HOROLOG,3)}, SqlComputed, SqlComputeOnChange = (%%INSERT, %%UPDATE) ];

Property LastUser As %String [ SqlComputeCode = {set {*}=$Username}, SqlComputed, SqlComputeOnChange = (%%INSERT, %%UPDATE) ];

Storage Default
{
<Data name="baseDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>CreatedAt</Value>
</Value>
<Value name="3">
<Value>LastUpdatedAt</Value>
</Value>
<Value name="4">
<Value>LastUpdate</Value>
</Value>
<Value name="5">
<Value>LastUser</Value>
</Value>
</Data>
<DataLocation>^shvarov.persistent.baseD</DataLocation>
<DefaultData>baseDefaultData</DefaultData>
<IdLocation>^shvarov.persistent.baseD</IdLocation>
<IndexLocation>^shvarov.persistent.baseI</IndexLocation>
<StreamLocation>^shvarov.persistent.baseS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
