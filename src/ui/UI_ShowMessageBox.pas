{
        Процедура вывода окна сообщения
}
procedure UI_ShowMessageBox(title, message : pChar);
var
        form : newtComponent;
begin
        newtOpenWindow(10, 5, 41, 7, title);

        form := newtForm(nil, nil, 0);
        
        newtFormAddComponents(
                form,
                newtLabel(1, 1, message),
                newtButton(18, 3, 'ОК'),
                nil
        );

        newtRunForm(form);
        newtFormDestroy(form);

        newtPopWindow;
end;

