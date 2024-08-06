﻿&НаКлиенте
Процедура ПриОткрытии(Отказ)
	
	УстановитьДоступностьЭлемнтов();
	
	Если НЕ ЗначениеЗаполнено(Объект.Наименование)	Тогда
		СформироватьНаименованиеДоговора();
	КонецЕсли;
	
КонецПроцедуры

&НаКлиенте
Процедура УстановитьДоступностьЭлемнтов() 
	
	Если Объект.Бессрочный Тогда
		Элементы.ДатаОкончания.Видимость = Ложь;
		Если ЗначениеЗаполнено(Объект.ДатаОкончания) Тогда
			Объект.ДатаОкончания = '0001,01,01';
		КонецЕсли;
	Иначе
		Элементы.ДатаОкончания.Видимость = Истина;
	КонецЕсли;
	
КонецПроцедуры

&НаКлиенте
Процедура СформироватьНаименованиеДоговора()
	
	Если ЗначениеЗаполнено(Объект.Номер) И ЗначениеЗаполнено(Объект.ДатаНачала) Тогда
		Объект.Наименование = "№" + Объект.Номер + " от " + Формат(Объект.ДатаНачала, "ДЛФ=Д") + " г";
	ИначеЕсли ЗначениеЗаполнено(Объект.Номер) И НЕ ЗначениеЗаполнено(Объект.ДатаНачала) Тогда
		Объект.Наименование = "№" + Объект.Номер + " от " + "г";
	Иначе
		Объект.Наименование = "№" + " от " + Формат(Объект.ДатаНачала, "ДЛФ=Д") + " г";
	КонецЕсли;
	
КонецПроцедуры


&НаКлиенте
Процедура БессрочныйПриИзменении(Элемент)
	
	УстановитьДоступностьЭлемнтов();
	
КонецПроцедуры


&НаКлиенте
Процедура НомерПриИзменении(Элемент)
	
	СформироватьНаименованиеДоговора();
	
КонецПроцедуры


&НаКлиенте
Процедура ДатаНачалаПриИзменении(Элемент) 
	
	СформироватьНаименованиеДоговора();
	
КонецПроцедуры

