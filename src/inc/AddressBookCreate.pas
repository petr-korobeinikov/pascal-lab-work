{

}

procedure AddressBookCreate(name : String);
var
        f : file of AddressBookEntry;

begin
        assign(f, name);
        {$I-}
        rewrite(f);
        {$I+}

        if IOResult <> 0 then
        begin
                AddressBookError := ADDRESS_BOOK_IO_ERROR;
                exit;
        end else
        begin
                AddressBookError := ADDRESS_BOOK_OK;
                close(f);
        end;
end;
