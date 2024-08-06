﻿&НаСервере
Процедура ПриСозданииНаСервере(Отказ, СтандартнаяОбработка)
	
	ПеременоватьНаименование();
	УстановитьДоступЭлементовФормы();
	
КонецПроцедуры

&НаСервере
Процедура ПеременоватьНаименование()
	
	Если Объект.ТипКонтрагента = ПредопределенноеЗначение("Перечисление.ТипыКонтрагентов.Клиент") Тогда
		Элементы.Наименование.Заголовок = "Ф.И.О";
	Иначе
		Элементы.Наименование.Заголовок = "Наименование";
	КонецЕсли;
	
КонецПроцедуры

&НаСервере
Процедура УстановитьДоступЭлементовФормы()
	
	Если Объект.ТипКонтрагента = ПредопределенноеЗначение("Перечисление.ТипыКонтрагентов.Клиент") Тогда
		Элементы.ДатаРожденияКлиента.Видимость = Истина;
		Элементы.Абонемент.Видимость = Истина;
		Элементы.ПолКлиента.Видимость = Истина;
	Иначе
		Элементы.ДатаРожденияКлиента.Видимость = Ложь;
		Элементы.Абонемент.Видимость = Ложь;
		Элементы.ПолКлиента.Видимость = Ложь;
	КонецЕсли;
	
КонецПроцедуры

&НаКлиенте
Процедура ТипКонтрагентаПриИзменении(Элемент)
	
	ПеременоватьНаименование();
	УстановитьДоступЭлементовФормы();	
	
КонецПроцедуры


		
