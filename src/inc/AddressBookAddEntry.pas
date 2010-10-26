{

}
procedure AddressBookAddEntry(name : string; entry : AddressBookEntry);
var
        f : file of AddressBookEntry;
begin
        assign(f, name);
        {$I-}
        reset(f);
        {$I+}

        if IOResult <> 0 then
        begin
                AddressBookError := ADDRESS_BOOK_IO_ERROR;   {  }
                exit;                                        {  }
        end else
        begin
                seek(f, filesize(f)); {  }
                write(f, entry);      {  }
                close(f);             {  }
        end;
end;
