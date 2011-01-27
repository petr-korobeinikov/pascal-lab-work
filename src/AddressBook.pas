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

{$I inc/AddressBookEntry.pas}           { Подключаем определение типа "Запись Адресной Книги" }

const
        ADDRESS_BOOK_OK               = 0;    { Ошибок нет }
        ADDRESS_BOOK_IO_ERROR         = 1;    { Ошибка чтения/записи }
        ADDRESS_BOOK_CANCEL_OPERATION = 2;    { Была нажата кнопка "Отменить" }


        { Список констант, отвечающих пунктам главного меню }
        ACTION_CREATE           = 0;
        ACTION_CHOOSE           = 1;
        ACTION_WORK             = 2;
        ACTION_SEARCH           = 3;
        ACTION_EXIT             = 4;

var
        AddressBookError        : integer;                     { Глобальная переменная, хранящая в себе последнюю ошибку }
        AddressBookCurrent      : pchar;                       { Название адресной книги, с которой работаем в текущий момент }
        AddressBookEntryList    : array of AddressBookEntry;   { Текущий список записей адресной книги }

        { Список пунктов главного меню }
        choices : array[ACTION_CREATE..ACTION_EXIT] of pchar;
        choice  : integer;

{$I inc/AddressBookCreate.pas}           { Подключаем определение процедуры создания адресной книги }
{$I inc/AddressBookAddEntry.pas}         { Подключаем определение процедуры добавления записи в адресную книгу }
{$I inc/AddressBookGetEntries.pas}       { Подключаем определение процедуры получения списка записей }
{$I inc/AddressBookRemoveEntry.pas}      { Подключаем определение процедуры удаления записи из адресной книги }

{$I ui/UI_ShowSplashScreen.pas}          { Подключаем определение процедуры вывода заставки программы }
{$I ui/UI_ShowMainMenu.pas}              { Подключаем определение процедуры вывода главного меню программы }
{$I ui/UI_ShowMessageBox.pas}            { Подключаем определение процедуры вывода окна сообщения }
{$I ui/UI_ShowAddressBookNameForm.pas}   { Подключаем определение процедуры вывода окна названия адресной книги }

begin
        { Массив пунктов главного меню }
        choices[ACTION_CREATE] := 'Создать записную книжку';
        choices[ACTION_CHOOSE] := 'Выбрать текущую записную книжку';
        choices[ACTION_WORK]   := 'Работа с записной книжкой';
        choices[ACTION_SEARCH] := 'Поиск по запросу';
        choices[ACTION_EXIT]   := 'Выход';

        choice := ACTION_EXIT;

        { Инициализируем псевдографику }
        newtInit;
        newtCls;
        
        { Выводим заставку }
        UI_ShowSplashScreen;
        
        { Выводим главное меню }
        repeat
                {
                        Обнуляем переменную, хранящую код последней ошибки.
                        В противном случае её значение могло бы сохраниться
                        после последней очередной итерации.
                }
                AddressBookError := ADDRESS_BOOK_OK;
                
                { Выводим главное меню }
                UI_ShowMainMenu;

                case choice of
                ACTION_CREATE:
                        begin
                                UI_ShowAddressBookNameForm;
                                
                                if AddressBookError = ADDRESS_BOOK_CANCEL_OPERATION then
                                        begin
                                                { Пользователь отменил действие }
                                                UI_ShowMessageBox('Действие отменено', 'Вы решили прервать операцию.');
                                                continue;
                                        end
                                else
                                        begin
                                                { Пытаемся создать записную книжку }
                                                { ... }
                                                UI_ShowMessageBox('Введено значение', AddressBookCurrent);
                                                { UI_ShowMessageBox('Ошибка!', 'Не получилось создать книжку.'); }
                                                UI_ShowMessageBox('Книжка успешно создана', 'Книжка успешно создана');
                                        end;
                        end;
                ACTION_CHOOSE:
                        begin
                                UI_ShowAddressBookNameForm;
                                
                                if AddressBookError = ADDRESS_BOOK_CANCEL_OPERATION then
                                        begin
                                                { Пользователь отменил действие }
                                                UI_ShowMessageBox('Действие отменено', 'Вы решили прервать операцию.');
                                                continue;
                                        end
                                else
                                        UI_ShowMessageBox('Выбрана текущая книжка', strcat('Выбрана книжка ', AddressBookCurrent));
                        end;
                ACTION_WORK:
                        begin
                                UI_ShowMessageBox(choices[choice], choices[choice]);
                        end;
                ACTION_SEARCH:
                        begin
                                UI_ShowMessageBox(choices[choice], choices[choice]);
                        end;
                ACTION_EXIT: { Завершение работы программы }
                        break;
                end;
        until false;
        
        { Выключаем псевдографический режим }
        newtFinished;
end.

