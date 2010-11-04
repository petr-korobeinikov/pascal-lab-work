{

}
program AddressBook;

{$I inc/AddressBookEntry.pas}         { /*__*/ }

const
        ADDRESS_BOOK_OK       = 0;
        ADDRESS_BOOK_IO_ERROR = 1;    { /*__*/ }

var
        AddressBookError        : integer;
        AddressBookCurrent      : string[80]; // Name of book currently selected
        AddressBookEntryList    : array of AddressBookEntry; { Used by AddressBookRemoveEntry() and AddressBookGetEntries() }


        entry   : AddressBookEntry;
        choice  : integer; // remove when curses appears

        name    : string[80];
        current : string[80];

{$I inc/AddressBookCreate.pas}        { /*__*/ }
{$I inc/AddressBookAddEntry.pas}      { /*__*/ }
{$I inc/AddressBookGetEntries.pas}    { /*__*/ }
{$I inc/AddressBookRemoveEntry.pas}   { /*__*/ }


begin

//AddressBookCreate('books/family');

with entry do
begin
        Name          := 'John Doe';
        Phone         := '123 45 67';
        CelluarPhone  := '8 111 222 33 44';
        BirthDate     := '26.06.1988';
        Email         := 'johndoe@gmail.com';
        ICQ           :=  123456789;
end;

//AddressBookAddEntry('books/family', entry);

AddressBookRemoveEntry('books/family', 1);

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
                readln(choice);
                writeln('You choose: ', choice);

                case choice of
                        0 :
                                begin
                                writeln('Have a nice day!');
                                end;
                        1 :
                                begin
                                        write('Input a name for new address book: ');
                                        readln(name);
                                        AddressBookCreate(name);
                                        if AddressBookError <> ADDRESS_BOOK_OK then
                                                writeln('Some errors happend! =(')
                                        else
                                                writeln('Book successfully created!')
                                end;
                        2 :
                                begin
                                writeln('Input a name of book you choose: ');
                                end;
                        3 :
                                begin
                                write('Input a name of a book you choose: ');
                                readln(name);
                                writeln('Input a person information.');
                                write(': ');
                                readln();
                                write(': ');
                                readln();
                                write(': ');
                                readln();
                                write(': ');
                                readln();
                                write(': ');
                                readln();
                                write(': ');
                                readln();
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

end.
