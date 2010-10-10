{

}
Program AddressBook;

{$I inc/AddressBookCreate.pas}        { /*__*/ }
{$I inc/AddressBookAddEntry.pas}      { /*__*/ }
{$I inc/AddressBookGetEntries.pas}    { /*__*/ }
{$I inc/AddressBookRemoveEntry.pas}   { /*__*/ }

Begin
{
        AddressBookCreate('friends');
        AddressBookCreate('co-workers');
        AddressBookCreate('family');
}

End.
