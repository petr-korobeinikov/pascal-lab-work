{
        Контрольная работа
        Дисциплина: Информатика (часть 3)
        Студент:    Коробейников П.А.
        Группа:     ВАИ-1-09
        Тема:       Создание БД Записная книжка
}
program AddressBook;
uses
        sysutils,
        newt;

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

{$I ui/UI_ShowSplashScreen.pas}       { Подключаем определение процедуры вывода заставки программы }

begin
        { Инициализируем псевдографику }
        newtInit;
        newtCls;
        
        { Выводим заставку }
        UI_ShowSplashScreen;
        
        { Выключаем псевдографический режим }
        newtFinished;
end.

