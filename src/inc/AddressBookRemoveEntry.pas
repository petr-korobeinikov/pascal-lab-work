{

}
procedure AddressBookRemoveEntry(name : string; position : integer);
var
        f       : file of AddressBookEntry;   { Файловая переменная }
        i,
        j       : integer;                    { Вспомогательныя переменные цикла }
        entry   : AddressBookEntry;           { Запись в адресной книге }
        fsize   : integer;                    { Размер файла }
begin
        assign(f, name);
        {$I-}
        reset(f);
        {$I+}

        if IOResult <> 0 then
                begin
                        AddressBookError := ADDRESS_BOOK_IO_ERROR;   { Сообщаем системе об ошибке }
                        exit;                                        { Выход из процедуры }
                end
        else
                begin
                        {
                                @todo:
                                        Прочитать из файла все.
                                        Записать только то, что нужно.
                        }
                        fsize := filesize(f);                     { Получаем размер файла }
                        setlength(AddressBookEntryList, fsize);   { Изменяем размер массива для хранения записей }

                        i := 0;
                        j := 0;
                        while not eof(f) do                { Считываем все записи из файла }
                        begin
                                read(f, entry);

                                if i <> position then
                                begin
                                        AddressBookEntryList[j] := entry;
                                        inc(j);
                                end;

                                inc(i);
                        end;

                        rewrite(f);          { Удаляем все содержимое файла }

                        for i := 0 to high(AddressBookEntryList) do
                        begin
                                writeln(i);
                                write(f, AddressBookEntryList[i]);
                        end;

                        close(f);                               { Закрываем файл }
                        AddressBookError := ADDRESS_BOOK_OK;    { Сообщаем системе, что ошибок нет }
                end;
end;

