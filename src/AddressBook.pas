{

}
Program AddressBook;

{$I inc/AddressBookEntry.pas}         { /*__*/ }
{$I inc/AddressBookCreate.pas}        { /*__*/ }
{$I inc/AddressBookAddEntry.pas}      { /*__*/ }
{$I inc/AddressBookGetEntries.pas}    { /*__*/ }
{$I inc/AddressBookRemoveEntry.pas}   { /*__*/ }

Var
        entry : AddressBookEntry;

Begin
{
        AddressBookCreate('friends');
        AddressBookCreate('co-workers');
        AddressBookCreate('family');
}

{
with entry do
begin
        Name          := 'John Doe';
        Phone         := '123 45 67';
        CelluarPhone  := '8 111 222 33 44';
        BirthDate     := '26.06.1988';
        Email         := 'johndoe@gmail.com';
        ICQ           :=  123456789;
end;
}

{
        AddressBookAddEntry('books/family', entry);
}

AddressBookGetEntries('books/family');

End.
