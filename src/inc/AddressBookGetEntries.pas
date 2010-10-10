{

}
procedure AddressBookGetEntries(name : String);
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
                writeln('Error: IOResult <> 0');
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
