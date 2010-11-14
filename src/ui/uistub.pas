program newtstub;
uses
        newt;


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


procedure UI_ShowMainMenu;
var
        form,
        listBox : newtComponent;
begin
        newtOpenWindow(10, 5, 41, 7, 'Главное меню');
        
        listBox := newtListbox(1, 1, 5, NEWT_FLAG_RETURNEXIT);
        newtListBoxAppendEntry(listBox, 'Создать записную книжку', nil);
        newtListBoxAppendEntry(listBox, 'Выбрать текущую записную книжку', nil);
        newtListBoxAppendEntry(listBox, 'Работа с записной книжкой', nil);
        newtListBoxAppendEntry(listBox, 'Поиск по запросу', nil);
        newtListBoxAppendEntry(listBox, 'Выход', nil);
        
        form := newtForm(nil, nil, NEWT_FLAG_RETURNEXIT);
        newtFormAddComponents(
                form,
                listBox,
                nil
        );

        newtRunForm(form);
        newtFormDestroy(form);

        newtPopWindow;
end;


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


procedure UI_ShowAddressBookListForm;
var
        form : newtComponent;
begin
        { Implement me }
end;

begin
        newtInit;
        newtCls;

        UI_ShowSplashScreen;
        {newtWaitForKey;}
        
        UI_ShowMainMenu;
        
        UI_ShowAddressBookNameForm;

        UI_ShowAddressBookEntryForm;

        newtFinished;
end.
