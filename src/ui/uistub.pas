program newtstub;
uses
        sysutils,
        newt;

{
        Процедура вывода заставки программы
}
procedure UI_ShowSplashScreen;
var
        form : newtComponent;
begin
        newtOpenWindow(10, 5, 41, 10, 'Контрольная работа');

        form := newtForm(nil, nil, 0);
        newtFormAddComponents(
                form,
                newtLabel(1, 1, 'Дисциплина: Информатика (часть 3)'),
                newtLabel(1, 2, 'Студент:    Коробейников П.А.'),
                newtLabel(1, 3, 'Группа:     ВАИ-1-09'),
                newtLabel(1, 4, 'Тема:       Создание БД Записная книжка'),
                newtButton(12, 6, 'Начать работу'),
                nil
        );

        newtRunForm(form);
        newtFormDestroy(form);

        newtPopWindow;
end;


{
        Процедура вывода главного меню
}
procedure UI_ShowMainMenu;
const
        ACTION_CREATE = 0;
        ACTION_CHOOSE = 1;
        ACTION_WORK   = 2;
        ACTION_SEARCH = 3;
        ACTION_EXIT   = 4;
var
        form,
        listBox : newtComponent;
        p       : ^pchar;
        s       : pchar;
        i       : integer;
        choices : array[ACTION_CREATE..ACTION_EXIT] of pchar;
begin
        choices[ACTION_CREATE] := 'Создать записную книжку';
        choices[ACTION_CHOOSE] := 'Выбрать текущую записную книжку';
        choices[ACTION_WORK]   := 'Работа с записной книжкой';
        choices[ACTION_SEARCH] := 'Поиск по запросу';
        choices[ACTION_EXIT]   := 'Выход';

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
                
        newtFinished;
        
        writeln(p^);
        s:=p^;
        
        for i := ACTION_CREATE to ACTION_EXIT do
                if p^ = choices[i] then
                        break;

        case i of
        ACTION_CREATE: writeln('0');
        ACTION_WORK:   writeln('2');
        end;
        
        
        halt;

        newtPopWindow;
end;


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


{
        Процедура вывода формы записи адресной книги
}
procedure UI_ShowAddressBookEntryForm;
var
        form : newtComponent;
begin
        newtOpenWindow(10, 5, 60, 12, 'Внести запись в книжку');

        form := newtForm(nil, nil, 0);
        newtFormAddComponents(
                form,
                newtLabel(1, 1, 'Имя: '),               newtEntry(18, 1, nil, 41, nil, 0),
                newtLabel(1, 2, 'Телефон: '),           newtEntry(18, 2, nil, 41, nil, 0),
                newtLabel(1, 3, 'Сотовый телефон: '),   newtEntry(18, 3, nil, 41, nil, 0),
                newtLabel(1, 4, 'Дата рождения: '),     newtEntry(18, 4, nil, 41, nil, 0),
                newtLabel(1, 5, 'Email: '),             newtEntry(18, 5, nil, 41, nil, 0),
                newtLabel(1, 6, 'ICQ: '),               newtEntry(18, 6, nil, 41, nil, 0),
                
                newtButton(19, 8, 'ОК'),
                newtButton(29, 8, 'Отмена'),
                nil
        );

        newtRunForm(form);
        newtFormDestroy(form);

        newtPopWindow;
end;


{
        Процедура вывода списка записей адресной книги
}
procedure UI_ShowAddressBookListForm;
var
        form : newtComponent;
begin
        { Implement me }
end;


{
        Процедура вывода окна сообщения
}
procedure UI_ShowMessageBox(title, message : pChar);
var
        form : newtComponent;
begin
        newtOpenWindow(10, 5, 40, 7, title);

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


begin
        newtInit;
        newtCls;

        UI_ShowSplashScreen;
        
        UI_ShowMainMenu;
        
        UI_ShowAddressBookNameForm;

        UI_ShowAddressBookEntryForm;
        
        UI_ShowMessageBox('MessageBox Title', 'MessageBox Message!');
        
        { Too long strings are hiccups:
        UI_ShowMessageBox('MessageBox Title', 'This message is too long! This message is too long! This message is too long! This message is too long! This message is too long! This message is too long!');
        }

        newtFinished;
end.

