{
        Процедура вывода формы названия книги
}
procedure UI_ShowAddressBookNameForm;
var
        form : newtComponent;
begin
        newtOpenWindow(10, 5, 41, 7, 'Название адресной книги');

        form := newtForm(nil, nil, 0);
        newtFormAddComponents(
                form,
                newtLabel(1, 1, 'Название: '),
                newtEntry(11, 1, nil, 29, nil, 0),
                newtButton(10, 3, 'ОК'),
                newtButton(20, 3, 'Отмена'),
                nil
        );

        newtRunForm(form);
        newtFormDestroy(form);

        newtPopWindow;
end;

