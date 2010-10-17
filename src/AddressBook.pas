{

}
Program AddressBook;

{$I inc/AddressBookEntry.pas}         { /*__*/ }

Const
        ADDRESS_BOOK_IO_ERROR = 1;    { /*__*/ }

Var
        AddressBookError : Integer;
        entry            : AddressBookEntry;

        choice : Integer; // remove when curses appears

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

writeln('Welcome to stub!');
writeln('1. Create new address book');
writeln('2. Choose a current address book');
writeln('3. Add new address book entry to the selected book');
writeln('4. Read all entries from the selected book');
writeln('5. Delete an entry from the selected address book');
writeln('0. Exit');

repeat
        begin
                write('Choose a number of action: ');
                read(choice);
                writeln('You choose: ', choice);

                case choice of
                        0 :
                                begin
                                writeln('Have a nice day!');
                                end;
                        1 :
                                begin
                                writeln('');
                                end;
                        2 :
                                begin
                                writeln('');
                                end;
                        3 :
                                begin
                                writeln('');
                                end;
                        4 :
                                begin
                                writeln('');
                                end;
                        5 :
                                begin
                                writeln('');
                                end;
                end;
        end;
until choice = 0;

{
AddressBookGetEntries('books/family1');
if AddressBookError <> 0 then
begin
        writeln('IO-error happend');
end;
}

End.
