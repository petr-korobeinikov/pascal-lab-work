{
        Процедура вывода формы названия книги
}
procedure UI_ShowAddressBookNameForm;
var
        m             : string;
        p             : pchar;
        
        buttonCancel,
        nameEntry,
        form          : newtComponent;
begin
        p := addr(m[1]);

        newtOpenWindow(10, 5, 41, 7, 'Название адресной книги');
        
        buttonCancel := newtButton(20, 3, 'Отмена');
        nameEntry    := newtEntry(11, 1, nil, 29, @p, NEWT_FLAG_SCROLL or NEWT_FLAG_RETURNEXIT);

        form := newtForm(nil, nil, 0);
        newtFormAddComponents(
                form,
                newtLabel(1, 1, 'Название: '),
                nameEntry,
                newtButton(10, 3, 'ОК'),
                buttonCancel,
                nil
        );
        
        newtRunForm(form);

        { Если была нажата кнопка "Отмена" }
        if buttonCancel = newtFormGetCurrent(form) then
                AddressBookError := ADDRESS_BOOK_CANCEL_OPERATION
        else
                begin
                        { Если введено пустое значение, произойдет ошибка при обращении к указателю. }
                        if p = '' then
                                AddressBookCurrent := ''
                        else
                                AddressBookCurrent := strnew(p);
                end;
        
        newtFormDestroy(form);

        newtPopWindow;
end;

