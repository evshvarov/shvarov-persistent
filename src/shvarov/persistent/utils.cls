Class shvarov.persistent.utils Extends %RegisteredObject
{

ClassMethod AddAncestor(className As %String, ancestor As %String) As %Status
{
    // Open the existing class definition
    set clsObj = ##class(%Dictionary.ClassDefinition).%OpenId(className)
    if clsObj = "" {
        write "Class not found!", !
        quit $$$ERROR($$$GeneralError, "Class not found")
    }

    // Add the new ancestor to the Super property
    set currentAncestors = clsObj.Super
    if currentAncestors '= "" {
        set newAncestors = currentAncestors _ "," _ ancestor
    } else {
        set newAncestors = ancestor
    }
    set clsObj.Super = newAncestors

    // Save and compile the updated class
    set status = clsObj.%Save()
    if $$$ISERR(status) {
        do $SYSTEM.OBJ.DisplayError(status)
        quit status
    }
    set status = $SYSTEM.OBJ.Compile(className, "k")
    if $$$ISERR(status) {
        do $SYSTEM.OBJ.DisplayError(status)
        quit status
    }

    write "Ancestor added successfully!", !
    quit $$$OK
}

}
