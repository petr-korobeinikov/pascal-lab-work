{

}
procedure AddressBookRemoveEntry(name : string; position : integer);
var
        f       : file of AddressBookEntry;
        i,
        j       : integer;
        entry   : AddressBookEntry;
        fsize   : integer;
begin
        assign(f, name);
        {$I-}
        reset(f);
        {$I+}

        if IOResult <> 0 then
                begin
                        AddressBookError := ADDRESS_BOOK_IO_ERROR;
                        exit;
                end
        else
                begin
                        fsize := filesize(f);
                        setlength(AddressBookEntryList, fsize);

                        i := 0;
                        j := 0;
                        while not eof(f) do
                        begin
                                read(f, entry);

                                if i <> position then
                                begin
                                        AddressBookEntryList[j] := entry;
                                        inc(j);
                                end;

                                inc(i);
                        end;

                        rewrite(f);

                        for i := 0 to sizeof(AddressBookEntryList) - 1 do
                        begin
                                writeln(i);
                                write(f, AddressBookEntryList[i]);
                        end;

                        close(f);
                        AddressBookError := ADDRESS_BOOK_OK;
                end;
end;
