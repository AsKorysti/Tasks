﻿Процедура ПриДобавленииПодсистемы(Описание) Экспорт
    Описание.Имя = "УправлениеЗадачами";
    Описание.Версия = "1.0.1.013";
    // Требуется библиотека стандартных подсистем.
    Описание.ТребуемыеПодсистемы.Добавить("СтандартныеПодсистемы");
КонецПроцедуры
Процедура ПриДобавленииОбработчиковОбновления(Обработчики) Экспорт
	
	Обработчик = Обработчики.Добавить();
	Обработчик.Версия = "";
	Обработчик.НачальноеЗаполнение = Истина;
	Обработчик.Процедура = "узОбновлениеИнформационнойБазы.узНачальноеЗаполнение";
	Обработчик.ОбщиеДанные = Истина;
	Обработчик.Комментарий = "Выполняется начальное заполнение данных";
	
	Обработчик = Обработчики.Добавить();
	Обработчик.Версия = "1.0.1.008";
	Обработчик.НачальноеЗаполнение = Ложь;
	Обработчик.Процедура = "узОбновлениеИнформационнойБазы.ОбновлениеНаВерсию_1_0_1_008";
	Обработчик.ОбщиеДанные = Истина;
	Обработчик.Комментарий = "Обновление на версию 1.0.1.008";
	
	Обработчик = Обработчики.Добавить();
	Обработчик.Версия = "1.0.1.011";
	Обработчик.НачальноеЗаполнение = Ложь;
	Обработчик.Процедура = "узОбновлениеИнформационнойБазы.ОбновлениеНаВерсию_1_0_1_011";
	Обработчик.ОбщиеДанные = Истина;
	Обработчик.Комментарий = "Обновление на версию 1.0.1.011";
	
	Обработчик = Обработчики.Добавить();
	Обработчик.Версия = "1.0.1.012";
	Обработчик.НачальноеЗаполнение = Ложь;
	Обработчик.Процедура = "узОбновлениеИнформационнойБазы.ОбновлениеНаВерсию_1_0_1_012";
	Обработчик.ОбщиеДанные = Истина;
	Обработчик.Комментарий = "Обновление на версию 1.0.1.012";	
КонецПроцедуры
Процедура ПередОбновлениемИнформационнойБазы() Экспорт
КонецПроцедуры
Процедура ПослеОбновленияИнформационнойБазы(Знач ПредыдущаяВерсия, Знач ТекущаяВерсия,
        Знач ВыполненныеОбработчики, ВыводитьОписаниеОбновлений, МонопольныйРежим) Экспорт
КонецПроцедуры
Процедура ПриПодготовкеМакетаОписанияОбновлений(Знач Макет) Экспорт
КонецПроцедуры
Процедура ПриДобавленииОбработчиковПереходаСДругойПрограммы(Обработчики) Экспорт
КонецПроцедуры
Процедура ПриОпределенииРежимаОбновленияДанных(РежимОбновленияДанных, СтандартнаяОбработка) Экспорт
КонецПроцедуры 
Процедура ПриЗавершенииПереходаСДругойПрограммы(Знач ПредыдущееИмяКонфигурации, Знач ПредыдущаяВерсияКонфигурации, Параметры) Экспорт
КонецПроцедуры

Процедура ОбновлениеНаВерсию_1_0_1_008() Экспорт
	ДопПараметры = Новый Структура;
	ДопПараметры.Вставить("Используется", Истина);	
	УправлениеСвойствами.УстановитьПараметрыНабораСвойств("Справочник_узЗадачи", ДопПараметры);
КонецПроцедуры 

Процедура ОбновлениеНаВерсию_1_0_1_011() Экспорт
	СтатусыЗадачи_ЗапросНаДобавление = Справочники.узСтатусыЗадачи.ЗапросНаДобавление;
	СтатусыЗадачи_КПереносуВРабочую = Справочники.узСтатусыЗадачи.КПереносуВРабочую;
	
	СпрОбъект = СтатусыЗадачи_ЗапросНаДобавление.ПолучитьОбъект();
	СпрОбъект.Записать();
	
	СпрОбъект = СтатусыЗадачи_КПереносуВРабочую.ПолучитьОбъект();
	СпрОбъект.Записать();	
	
	ТЗНастройки = Новый ТаблицаЗначений();
	ТЗНастройки.Колонки.Добавить("СтатусЗадачи");
	ТЗНастройки.Колонки.Добавить("ВидСтатуса");
	ТЗНастройки.Колонки.Добавить("ВидимостьПоУмолчанию");

	ВидСтатуса_Backlog = Справочники.узВидыСтатусов.Backlog;
	ВидСтатуса_ВРаботе = Справочники.узВидыСтатусов.ВРаботе;
	ВидСтатуса_Готово = Справочники.узВидыСтатусов.Готово;
	
	узДобавитьВТЗНастройки(СтатусыЗадачи_ЗапросНаДобавление,ВидСтатуса_ВРаботе,Ложь,ТЗНастройки);
	узДобавитьВТЗНастройки(СтатусыЗадачи_КПереносуВРабочую,ВидСтатуса_ВРаботе,Ложь,ТЗНастройки);
	
	Для каждого СтрокаТЗНастройки из ТЗНастройки цикл
		СпрОбъект = СтрокаТЗНастройки.СтатусЗадачи.ПолучитьОбъект();
		СпрОбъект.ВидСтатуса = СтрокаТЗНастройки.ВидСтатуса;
		СпрОбъект.ВидимостьПоУмолчанию = СтрокаТЗНастройки.ВидимостьПоУмолчанию;
		СпрОбъект.Записать();
	Конеццикла;	
КонецПроцедуры 

Процедура ОбновлениеНаВерсию_1_0_1_012() Экспорт
	Запрос = Новый Запрос;
	Запрос.Текст = 
	"ВЫБРАТЬ
	|	узЗадачи.Ссылка
	|ИЗ
	|	Справочник.узЗадачи КАК узЗадачи
	|ГДЕ
	|	НЕ узЗадачи.ЕстьПодчиненныеЗадачи";
	
	РезультатЗапроса = Запрос.Выполнить();
	
	Выборка = РезультатЗапроса.Выбрать();
	
	Пока Выборка.Следующий() Цикл
		СпрОбъект = Выборка.Ссылка.ПолучитьОбъект();
		#Если Тромбон тогда
			СпрОбъект = Справочники.узЗадачи.СоздатьЭлемент();
		#Конецесли
		СпрОбъект.ПоказыватьВОтчетахИКанбанДоске = Истина;
		СпрОбъект.ДополнительныеСвойства.Вставить("узЭтоОбработка",Истина);
		СпрОбъект.Записать();
	КонецЦикла;
КонецПроцедуры 


Процедура узНачальноеЗаполнение() Экспорт
	узДобавитьАдминистраторИБ();
	узОбработатьСправочники("узВидыСтатусов");
	узОбработатьСправочники("узВариантыВажностиЗадачи");
	узОбработатьСправочники("узСтатусыЗадачи");
	узПроставитьВидСтатусаВСтатусахЗадачи();
	Константы.ЗаголовокСистемы.Установить("Управление задачами");
	Константы.ИспользоватьНапоминанияПользователя.Установить(Истина);
	Сообщить("После первоначального заполнения, необходимо перезапустить программу");
КонецПроцедуры 

Процедура узДобавитьАдминистраторИБ()
	ИмяПользователя = "Администратор";
	Если ПользователиИнформационнойБазы.НайтиПоИмени(ИмяПользователя)<>Неопределено Тогда
		Возврат;
	КонецЕсли;
	ПользовательИБ = ПользователиИнформационнойБазы.СоздатьПользователя();
	ПользовательИБ.Имя = ИмяПользователя;
	ПользовательИБ.ПоказыватьВСпискеВыбора = Истина;
	ПользовательИБ.ПолноеИмя = ИмяПользователя;
	ПользовательИБ.АутентификацияСтандартная = Истина;
	ПользовательИБ.Роли.Добавить(Метаданные.Роли.АдминистраторСистемы);
	ПользовательИБ.Роли.Добавить(Метаданные.Роли.ПолныеПрава);
	ПользовательИБ.Роли.Добавить(Метаданные.Роли.ИнтерактивноеОткрытиеВнешнихОтчетовИОбработок);
	ПользовательИБ.Язык = Метаданные.Языки.Русский;
	ПользовательИБ.Записать();
КонецПроцедуры 

Процедура узПроставитьВидСтатусаВСтатусахЗадачи()
	ТЗНастройки = Новый ТаблицаЗначений();
	ТЗНастройки.Колонки.Добавить("СтатусЗадачи");
	ТЗНастройки.Колонки.Добавить("ВидСтатуса");
	ТЗНастройки.Колонки.Добавить("ВидимостьПоУмолчанию");

	ВидСтатуса_Backlog = Справочники.узВидыСтатусов.Backlog;
	ВидСтатуса_ВРаботе = Справочники.узВидыСтатусов.ВРаботе;
	ВидСтатуса_Готово = Справочники.узВидыСтатусов.Готово;
	
	узДобавитьВТЗНастройки(Справочники.узСтатусыЗадачи.Отменена,ВидСтатуса_Backlog,Ложь,ТЗНастройки);
	узДобавитьВТЗНастройки(Справочники.узСтатусыЗадачи.Backlog,ВидСтатуса_Backlog,Истина,ТЗНастройки);
	узДобавитьВТЗНастройки(Справочники.узСтатусыЗадачи.Отложена,ВидСтатуса_Backlog,Ложь,ТЗНастройки);
	узДобавитьВТЗНастройки(Справочники.узСтатусыЗадачи.Зарегистрирована,ВидСтатуса_Backlog,Истина,ТЗНастройки);
	
	узДобавитьВТЗНастройки(Справочники.узСтатусыЗадачи.ОжидаетОтвета,ВидСтатуса_ВРаботе,Истина,ТЗНастройки);
	узДобавитьВТЗНастройки(Справочники.узСтатусыЗадачи.ВПроцессеВыполнения,ВидСтатуса_ВРаботе,Истина,ТЗНастройки);
	узДобавитьВТЗНастройки(Справочники.узСтатусыЗадачи.НаТестированииПоказПользователям,ВидСтатуса_ВРаботе,Истина,ТЗНастройки);
	
	узДобавитьВТЗНастройки(Справочники.узСтатусыЗадачи.Готово,ВидСтатуса_Готово,Истина,ТЗНастройки);
	узДобавитьВТЗНастройки(Справочники.узСтатусыЗадачи.Архив,ВидСтатуса_Готово,Ложь,ТЗНастройки);
	
	Для каждого СтрокаТЗНастройки из ТЗНастройки цикл
		СпрОбъект = СтрокаТЗНастройки.СтатусЗадачи.ПолучитьОбъект();
		СпрОбъект.ВидСтатуса = СтрокаТЗНастройки.ВидСтатуса;
		СпрОбъект.ВидимостьПоУмолчанию = СтрокаТЗНастройки.ВидимостьПоУмолчанию;
		СпрОбъект.Записать();
	Конеццикла;
КонецПроцедуры 

Процедура узДобавитьВТЗНастройки(СтатусЗадачи,ВидСтатуса,ВидимостьПоУмолчанию,ТЗНастройки)
	СтрокаТЗНастройки = ТЗНастройки.Добавить();
	СтрокаТЗНастройки.СтатусЗадачи = СтатусЗадачи; 
	СтрокаТЗНастройки.ВидСтатуса = ВидСтатуса;
	СтрокаТЗНастройки.ВидимостьПоУмолчанию = ВидимостьПоУмолчанию;
КонецПроцедуры 

Процедура узОбработатьСправочники(ИмяСправочника)
	Запрос = Новый Запрос;
	Запрос.Текст = 
	"ВЫБРАТЬ
	|	ВТСправочник.Ссылка,
	|	ВТСправочник.Код КАК Код
	|ИЗ
	|	Справочник."+ИмяСправочника+" КАК ВТСправочник
	|
	|УПОРЯДОЧИТЬ ПО
	|	Код";
	
	РезультатЗапроса = Запрос.Выполнить();
	
	Выборка = РезультатЗапроса.Выбрать();
	
	Пока Выборка.Следующий() Цикл
		СпрОбъект = Выборка.Ссылка.ПолучитьОбъект();
		СпрОбъект.Записать();
	КонецЦикла;
КонецПроцедуры 