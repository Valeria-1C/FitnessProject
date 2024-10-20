﻿&НаСервере
Процедура ПриСозданииНаСервере(Отказ, СтандартнаяОбработка)
	
	ДоступностьЭлементовФормы();
	УстановитьСчетБухгалтерскогоУчета()
	
КонецПроцедуры

&НаСервере
Процедура ДоступностьЭлементовФормы()
	
	Если Объект.ТипНоменклатуры = ПредопределенноеЗначение("Перечисление.ТипыНоменклатуры.Услуга") Тогда
		Элементы.ДлительностьУслуги.Видимость = Истина;
	Иначе
		Элементы.ДлительностьУслуги.Видимость = Ложь;
	КонецЕсли;
	
	Если Объект.ТипНоменклатуры = ПредопределенноеЗначение("Перечисление.ТипыНоменклатуры.Абонемент") Тогда
		Элементы.СрокДействияАбонемента.Видимость = Истина;
		Элементы.ДнейЗаморозки.Видимость = Истина;
	Иначе
		Элементы.СрокДействияАбонемента.Видимость = Ложь;
		Элементы.ДнейЗаморозки.Видимость = Ложь;
	КонецЕсли;
	
КонецПроцедуры

&НаКлиенте
Процедура ТипНоменклатурыПриИзменении(Элемент)
	
	ДоступностьЭлементовФормы();
	УстановитьСчетБухгалтерскогоУчета();
	
КонецПроцедуры

&НаКлиенте
Процедура СчётБухгалтерскогоУчётаНачалоВыбора(Элемент, ДанныеВыбора, ВыборДобавлением, СтандартнаяОбработка)
	
	СтандартнаяОбработка = Ложь;
	
	СписокДопустимыхЗначений = Новый СписокЗначений;
	Если Объект.ТипНоменклатуры = ПредопределенноеЗначение("Перечисление.ТипыНоменклатуры.Товар") ИЛИ Объект.ТипНоменклатуры = ПредопределенноеЗначение("Перечисление.ТипыНоменклатуры.Материал") Тогда
		СписокДопустимыхЗначений.Добавить(ПредопределенноеЗначение("ПланСчетов.Хозрасчетный.Товары"));
		СписокДопустимыхЗначений.Добавить(ПредопределенноеЗначение("ПланСчетов.Хозрасчетный.Материалы"));
	ИначеЕсли Объект.ТипНоменклатуры = ПредопределенноеЗначение("Перечисление.ТипыНоменклатуры.Услуга")ИЛИ Объект.ТипНоменклатуры = ПредопределенноеЗначение("Перечисление.ТипыНоменклатуры.Абонемент") Тогда
		СписокДопустимыхЗначений.Добавить(ПредопределенноеЗначение("ПланСчетов.Хозрасчетный.РасходыНаПродажу"));
		СписокДопустимыхЗначений.Добавить(ПредопределенноеЗначение("ПланСчетов.Хозрасчетный.ПрочиеДоходыИРасходы"));
	Иначе
		СписокДопустимыхЗначений.Добавить(ПредопределенноеЗначение("ПланСчетов.Хозрасчетный.ПустаяСсылка"));
	КонецЕсли;
	
	ДанныеВыбора = СписокДопустимыхЗначений;
	
КонецПроцедуры

&НаСервере
Процедура УстановитьСчетБухгалтерскогоУчета()
	
	Если Объект.ТипНоменклатуры = ПредопределенноеЗначение("Перечисление.ТипыНоменклатуры.Материал") Тогда
		Объект.СчетБухгалтерскогоУчета = ПредопределенноеЗначение("ПланСчетов.Хозрасчетный.Материалы");
	ИначеЕсли Объект.ТипНоменклатуры = ПредопределенноеЗначение("Перечисление.ТипыНоменклатуры.Товар") Тогда
		Объект.СчетБухгалтерскогоУчета = ПредопределенноеЗначение("ПланСчетов.Хозрасчетный.Товары");
	ИначеЕсли Объект.ТипНоменклатуры = ПредопределенноеЗначение("Перечисление.ТипыНоменклатуры.Услуга") Тогда
		Объект.СчетБухгалтерскогоУчета = ПредопределенноеЗначение("ПланСчетов.Хозрасчетный.РасходыНаПродажу");
	ИначеЕсли Объект.ТипНоменклатуры = ПредопределенноеЗначение("Перечисление.ТипыНоменклатуры.Абонемент") Тогда
		Объект.СчетБухгалтерскогоУчета = ПредопределенноеЗначение("ПланСчетов.Хозрасчетный.РасходыНаПродажу");
	КонецЕсли;
	
КонецПроцедуры
