{

}

{$I AddressBookEntry.pas}         { /*__*/ }

procedure AddressBookCreate(name : String);
var
        f : file of AddressBookEntry;

begin
        assign(f, concat('books/' + name));
        {$I-}
        rewrite(f);
        {$I+}

        if IOResult <> 0 then
        begin
                writeln('Error: IOResult <> 0');
        end;
end;
