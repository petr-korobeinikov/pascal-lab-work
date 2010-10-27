{

}
procedure AddressBookRemoveEntry(name : string; position : integer);
var
        f : file of AddressBookEntry;
begin
{
        1. Open file
        2. Count entries
        3. Read all entries exclude of entry on position
        4. Rewrite file
        5. Write all entries into a file.
}
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
                // pointer logic goes here
                writeln(filesize(f) - 1); // One record will be deleted.
                while not eof(f) do
                begin
                        // if curpos <> position
                        //   read record
                end;

                // rewrite(f)

                // foreach record >> file

                close(f);
        end;
end;
