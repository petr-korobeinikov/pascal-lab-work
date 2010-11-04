{
        Контрольная работа
        Дисциплина: Информатика (часть 3)
        Студент:    Коробейников П.А.
        Группа:     ВАИ-1-09
        Тема:       Создание БД Записная книжка
}
program AddressBook;

{$I inc/AddressBookEntry.pas}         { Подключаем определение типа "Запись Адресной Книги" }

const
        ADDRESS_BOOK_OK       = 0;    { Ошибок нет }
        ADDRESS_BOOK_IO_ERROR = 1;    { Ошибка чтения/записи }

var
        AddressBookError        : integer;                   { Глобальная переменная, хранящая в себе последнюю ошибку }
        AddressBookCurrent      : string[80];                { Название адресной книги, с которой работаем в текущий момент }
        AddressBookEntryList    : array of AddressBookEntry; { Текущий список записей адресной книги }


        entry   : AddressBookEntry;
        choice  : integer; // remove when curses appears

        name    : string[80];
        current : string[80];

{$I inc/AddressBookCreate.pas}        { Подключаем определение процедуры создания адресной книги }
{$I inc/AddressBookAddEntry.pas}      { Подключаем определение процедуры добавления записи в адресную книгу }
{$I inc/AddressBookGetEntries.pas}    { Подключаем определение процедуры получения списка записей }
{$I inc/AddressBookRemoveEntry.pas}   { Подключаем определение процедуры удаления записи из адресной книги }


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

