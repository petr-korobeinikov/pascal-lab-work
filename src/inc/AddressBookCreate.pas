{

}
procedure AddressBookCreate(name : String);
var
        f : file of AddressBookEntry;

begin
        assign(f, name);        { Связываем имя файла с файловой переменной }
        {$I-}
        rewrite(f);             { Переписываем содержимое файла }
        {$I+}

        if IOResult <> 0 then
                begin
                        AddressBookError := ADDRESS_BOOK_IO_ERROR;  { Сообщаем программе об ошибке открытия файла }
                        exit;                                       { Выход из процедуры }
                end
        else
                begin
                        AddressBookError := ADDRESS_BOOK_OK;    { Сообщаем системе, что ошибок нет }
                        close(f);                               { Закрытие файла }
                end;
end;

