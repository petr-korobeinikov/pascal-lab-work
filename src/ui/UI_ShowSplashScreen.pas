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
                newtLabel(  1, 1, 'Дисциплина: Информатика (часть 3)'),
                newtLabel(  1, 2, 'Студент:    Коробейников П.А.'),
                newtLabel(  1, 3, 'Группа:     ВАИ-1-09'),
                newtLabel(  1, 4, 'Тема:       Создание БД Записная книжка'),
                newtButton(12, 6, 'Начать работу'),
                nil
        );

        newtRunForm(form);
        newtFormDestroy(form);

        newtPopWindow;
end;

