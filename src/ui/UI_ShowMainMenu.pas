{
        Процедура вывода главного меню
}
procedure UI_ShowMainMenu;
var
        form,
        listBox : newtComponent;
        p       : ^pchar;
        i       : integer;
begin
        newtOpenWindow(10, 5, 41, 7, 'Главное меню');
        
        listBox := newtListbox(1, 1, 5, NEWT_FLAG_RETURNEXIT or NEWT_FLAG_SCROLL);
        newtListboxSetWidth(listBox, 39);
        
        for i := ACTION_CREATE to ACTION_EXIT do
                newtListBoxAppendEntry(listBox, choices[i], @choices[i]);
        
        form := newtForm(nil, nil, NEWT_FLAG_RETURNEXIT);
        newtFormAddComponent(form, listBox);

        newtRunForm(form);
        newtFormDestroy(form);
        
        p := newtListboxGetCurrent(listBox);

        { Какой пункт был выбран? }
        for i := ACTION_CREATE to ACTION_EXIT do
                if p^ = choices[i] then
                        break;

        choice := i;
        
        newtPopWindow;
end;

