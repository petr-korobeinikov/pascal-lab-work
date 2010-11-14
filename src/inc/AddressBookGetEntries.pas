{
        Процедура получения записей из адресной книги
        Параметры:
                name   строка   название адресной книги
}
procedure AddressBookGetEntries(name : string);
var
        f     : file of AddressBookEntry;        { Файловая переменная }
        entry : AddressBookEntry;                {  }
        i     : integer;
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
                        i := 0;
                        setlength(AddressBookEntryList, filesize(f));
                        while not eof(f) do
                        begin
                                read(f, entry);
                                //writeln(entry.Name, ' ', entry.Phone, ' ', entry.BirthDate);
                                AddressBookEntryList[i] := entry;
                                inc(i);
                        end;

                        close(f);  { Закрываем файл }
                end;
end;

