{

}
procedure AddressBookGetEntries(name : string);
var
        f     : file of AddressBookEntry;        { Файловая переменная }
        entry : AddressBookEntry;                {  }
begin
        assign(f, name);             { Связываем файловую переменную с файлом }
        {$I-}
        reset(f);                    { Устанавливаем указатель на первую позицию в файле }
        {$I+}

        if IOResult <> 0 then
                begin
                        AddressBookError := ADDRESS_BOOK_IO_ERROR;    { Сообщаем системе о возникновении ошибки }
                        exit;                                         { Выходим из процедуры }
                end
        else
                begin
                        while not eof(f) do
                        begin
                                read(f, entry);
                                writeln(entry.Name, ' ', entry.Phone, ' ', entry.BirthDate);
                        end;

                        close(f);  { Закрываем файл }
                end;
end;

