﻿Процедура ОбработкаЗаполнения(ДанныеЗаполнения, СтандартнаяОбработка)
	
	Если ТипЗнч(ДанныеЗаполнения) = Тип("ДокументСсылка.Реализация") Тогда
		ВидОперации = Перечисления.ВидыОперацийПоступленияДенег.ОплатаОтПокупателя;
		Договор = ДанныеЗаполнения.Договор;
		Плательщик = ДанныеЗаполнения.Контрагент;
		ДокументОснование = ДанныеЗаполнения.Ссылка;
		СуммаДокумента = ДанныеЗаполнения.СуммаДокумента;
	ИначеЕсли ТипЗнч(ДанныеЗаполнения) = Тип("ДокументСсылка.ПоступлениеТоваровИУслуг") Тогда
		ВидОперации = Перечисления.ВидыОперацийПоступленияДенег.ВозвратОтПоставщика;
		Договор = ДанныеЗаполнения.Договор;
		Плательщик = ДанныеЗаполнения.Контрагент;
		ДокументОснование = ДанныеЗаполнения.Ссылка;
		СуммаДокумента = ДанныеЗаполнения.СуммаДокумента;
	КонецЕсли;
	
КонецПроцедуры

Процедура ОбработкаПроведения(Отказ, Режим)
	
	Движения.ДенежныеСредства.Записывать = Истина;
	Движение = Движения.ДенежныеСредства.Добавить();
	Движение.ВидДвижения = ВидДвиженияНакопления.Приход;
	Движение.Период = Дата;
	Движение.Касса = Касса;
	Движение.Сумма = СуммаДокумента;
	
	АналитикаПроводки = ПолучитьАналитикуПроводки();
	
	Движения.Хозрасчетный.Записывать = Истина;
	Движение = Движения.Хозрасчетный.Добавить();
	Движение.СчетКт = АналитикаПроводки.СчетКредита;
	Движение.СчетДт = АналитикаПроводки.СчетДебета;
	Движение.Период = Дата;
	Движение.Сумма = СуммаДокумента;
	Движение.Содержание = АналитикаПроводки.СодержаниеОперации;
	БухгалтерскийУчетСервер.ЗаполнитьСубконтоПоСчету(Движение.СчетДт, Движение.СубконтоДт, АналитикаПроводки.СубконтоДебет);
	БухгалтерскийУчетСервер.ЗаполнитьСубконтоПоСчету(Движение.СчетКт, Движение.СубконтоКт, АналитикаПроводки.СубконтоКредит);
	
КонецПроцедуры

Функция ПолучитьАналитикуПроводки()
	
	ОплатаОтПокупателя = Перечисления.ВидыОперацийПоступленияДенег.ОплатаОтПокупателя;
	ВозвратОтПоставщика = Перечисления.ВидыОперацийПоступленияДенег.ВозвратОтПоставщика;
	ВозвратОтПодотчетника = Перечисления.ВидыОперацийПоступленияДенег.ВозвратОтПодотчётника;
	
	СтруктураАналитики = Новый Структура;
	СтруктураАналитики.Вставить("СчетДебета", ПланыСчетов.Хозрасчетный.Касса);
	СтруктураАналитики.Вставить("СубконтоДебет", Касса);
	Если ВидОперации = ОплатаОтПокупателя Тогда
		СтруктураАналитики.Вставить("СодержаниеОперации", "Оплата от покупателя наличными в кассу");
		СтруктураАналитики.Вставить("СчетКредита", ПланыСчетов.Хозрасчетный.РасчетыСПокупателями);
		СтруктураАналитики.Вставить("СубконтоКредит", Плательщик);
	ИначеЕсли ВидОперации = ВозвратОтПоставщика Тогда
		СтруктураАналитики.Вставить("СодержаниеОперации", "Возврат от поставщика наличными в кассу");
		СтруктураАналитики.Вставить("СчетКредита", ПланыСчетов.Хозрасчетный.РасчетыСПоставщиками);
		СтруктураАналитики.Вставить("СубконтоКредит", Плательщик);
	ИначеЕсли ВидОперации = ВозвратОтПодотчетника Тогда
		СтруктураАналитики.Вставить("СодержаниеОперации", "Возврат подотчетных средств");
		СтруктураАналитики.Вставить("СчетКредита", ПланыСчетов.Хозрасчетный.РасчетыСПодотчетнымиЛицами);
		СтруктураАналитики.Вставить("СубконтоКредит", Плательщик);
	КонецЕсли;
	
	Возврат СтруктураАналитики;
	
КонецФункции
