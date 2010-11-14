{
        Процедура добавления записи в адресную книгу.
        Параметры:
                name    строка   название адресной книги
                entry   запись   запись адресной книги
}
procedure AddressBookAddEntry(name : string; entry : AddressBookEntry);
var
        f : file of AddressBookEntry;
begin
        assign(f, name);       { Связываем имя файла с файловой переменной }
        {$I-}
        reset(f);              { Сбрасываем указатель на первую позицию в файле }
        {$I+}

        if IOResult <> 0 then
                begin
                        AddressBookError := ADDRESS_BOOK_IO_ERROR;   { Сообщаем программе об ошибке открытия файла }
                        exit;                                        { Выход из процедуры }
                end
        else
                begin
                        seek(f, filesize(f)); { Переход на последнюю позицию в файле }
                        write(f, entry);      { Добавление в файл записи }
                        close(f);             { Закрытие файла }
                end;
end;

