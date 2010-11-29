{
        Структура данных "Запись адресной книги".
        Поля записи:
                Name           - Имя
                Phone          - Телефон
                CelluarPhone   - Сотовый телефон
                BirthDate      - Дата рождения
                Email          - Адрес электронной почты
                ICQ            - Номер ICQ
}
type AddressBookEntry = record
        Name          : String[80];  { Имя }
        Phone         : String[80];  { Телефон }
        CelluarPhone  : String[80];  { Сотовый телефон }
        BirthDate     : TDateTime;   { Дата рождения }
        Email         : String[80];  { Адрес электронной почты }
        ICQ           : Integer;     { Номер ICQ }
end;

