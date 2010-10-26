{

}
procedure AddressBookGetEntries(name : string);
var
        f     : file of AddressBookEntry;
        entry : AddressBookEntry;
begin
        assign(f, name);
        {$I-}
        reset(f);
        {$I+}

        if IOResult <> 0 then
        begin
                AddressBookError := ADDRESS_BOOK_IO_ERROR;
                exit;
        end else
        begin
                while not eof(f) do
                begin
                        read(f, entry);
                        writeln(entry.Name, ' ', entry.Phone, ' ', entry.BirthDate);
                end;

                close(f);
        end;
end;
