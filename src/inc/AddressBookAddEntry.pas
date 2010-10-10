{

}
procedure AddressBookAddEntry(name : String; entry : AddressBookEntry);
var
        f : file of AddressBookEntry;
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
                seek(f, filesize(f));
                write(f, entry);
                close(f);
        end;
end;
