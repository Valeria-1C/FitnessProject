﻿&НаСервере
Процедура ПриСозданииНаСервере(Отказ, СтандартнаяОбработка) 
	
	Если НЕ ЗначениеЗаполнено(Объект.Ответственный) Тогда
		Объект.Ответственный = ПараметрыСеанса.ТекущийПользователь;
	КонецЕсли;
	
КонецПроцедуры

&НаКлиенте
Процедура ПриОткрытии(Отказ)
	
	УстановитьДоступностьЭлементаФорм();
	
КонецПроцедуры

&НаКлиенте
Процедура УстановитьДоступностьЭлементаФорм()
	
	СтрокаТипПлательщик = "";
	
	Если Объект.ВидОперации = ПредопределенноеЗначение("Перечисление.ВидыОперацийПоступленияДенег.ВозвратОтПодотчётника") Тогда
		Элементы.Договор.Видимость = Ложь;
		СтрокаТипПлательщик = "СправочникСсылка.Сотрудники";
	Иначе
		СтрокаТипПлательщик = "СправочникСсылка.Контрагенты";
		Элементы.Договор.Видимость = Истина;
	КонецЕсли; 
	
	Если ЗначениеЗаполнено(СтрокаТипПлательщик) Тогда
		Массив = Новый Массив();
		Массив.Добавить(Тип(СтрокаТипПлательщик));
		ОписаниеТипаПлательщика = Новый ОписаниеТипов(Массив);
		Элементы.Плательщик.ОграничениеТипа = ОписаниеТипаПлательщика;
	КонецЕсли;
	
	Если Элементы.Договор.Видимость = Истина
		И ЗначениеЗаполнено(Объект.Плательщик) Тогда
		Элементы.Договор.Видимость = ПроверитьВидимостьДоговораВЗависимостиОтТипаКонтрагента(Объект.Плательщик);
	КонецЕсли;

	
КонецПроцедуры

&НаКлиенте
Процедура ВидОперацииПриИзменении(Элемент)
	
	 УстановитьДоступностьЭлементаФорм();
	
  КонецПроцедуры 
  
  &НаСервереБезКонтекста
Функция ПроверитьВидимостьДоговораВЗависимостиОтТипаКонтрагента(Плательщик)

	Запрос = Новый Запрос;
	Запрос.Текст =
	"ВЫБРАТЬ
	|	Контрагенты.ТипКонтрагента КАК ТипКонтрагента,
	|	Контрагенты.Ссылка КАК Контрагент
	|ИЗ
	|	Справочник.Контрагенты КАК Контрагенты
	|ГДЕ
	|	Контрагенты.Ссылка = &Плательщик";
	Запрос.УстановитьПараметр("Плательщик", Плательщик);
	Выборка = Запрос.Выполнить().Выбрать();
	Выборка.Следующий();
	
	Если Выборка.ТипКонтрагента = Перечисления.ТипыКонтрагентов.Клиент Тогда
		возврат Ложь;
	Иначе
		возврат Истина;
	КонецЕсли;
	
КонецФункции

&НаКлиенте
Процедура ПлательщикПриИзменении(Элемент)
	
	 УстановитьДоступностьЭлементаФорм();
	
КонецПроцедуры


	

