{
        Контрольная работа
        Дисциплина: Информатика (часть 3)
        Студент:    Коробейников П.А.
        Группа:     ВАИ-1-09
        Тема:       Создание БД Записная книжка
}
program AddressBook;
uses
        sysutils;

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
        
        i       : integer;

        name    : string[80];
        current : string[80];

{$I inc/AddressBookCreate.pas}        { Подключаем определение процедуры создания адресной книги }
{$I inc/AddressBookAddEntry.pas}      { Подключаем определение процедуры добавления записи в адресную книгу }
{$I inc/AddressBookGetEntries.pas}    { Подключаем определение процедуры получения списка записей }
{$I inc/AddressBookRemoveEntry.pas}   { Подключаем определение процедуры удаления записи из адресной книги }

begin
{
AddressBookCreate('books/family');

for i := 1 to 7 do
begin
        with entry do
        begin
                Name          := 'John Doe ' + IntToStr(i);
                Phone         := '123 45 67';
                CelluarPhone  := '8 111 222 33 44';
                BirthDate     := '26.06.1988';
                Email         := 'johndoe@gmail.com';
                ICQ           :=  123456789;
        end;
        
        AddressBookAddEntry('books/family', entry);
end;
}

{ AddressBookRemoveEntry('books/family', 1); }

{ Считываем все записи из адресной книги }
AddressBookGetEntries('books/family');
if AddressBookError <> 0 then
        begin
                writeln('IO-error happend');
        end
else
        begin
                writeln('high(list)', high(AddressBookEntryList));
                for i := 0 to high(AddressBookEntryList) do
                begin
                        writeln(AddressBookEntryList[i].Name, ' ', AddressBookEntryList[i].Phone, ' ', AddressBookEntryList[i].BirthDate);
                end;
        end;

end.

