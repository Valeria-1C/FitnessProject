﻿Функция ПолучитьЦенуНаДату(Номенклатура, ВидЦены = Неопределено, ДатаЦены = Неопределено) Экспорт
	
	Запрос = Новый Запрос;
	Запрос.Текст =
	"ВЫБРАТЬ
	|	ЦеныНоменклатурыСрезПоследних.Номенклатура КАК Номенклатура,
	|	ЦеныНоменклатурыСрезПоследних.Сумма КАК Цена
	|ИЗ
	|	РегистрСведений.ЦеныНоменклатуры.СрезПоследних(&Период, Номенклатура = &Номенклатура) КАК ЦеныНоменклатурыСрезПоследних";
	Запрос.УстановитьПараметр("Номенклатура", Номенклатура);
	Запрос.УстановитьПараметр("Период", ДатаЦены);
	
	РезультатЗапроса = Запрос.Выполнить();
	
	Если РезультатЗапроса.Пустой() Тогда
		Сообщить("Не найдено цены на данную номенклатуру!");
		Возврат 0;
	КонецЕсли;
	
	Выборка = РезультатЗапроса.Выбрать();
	Выборка.Следующий();
	Возврат Выборка.Цена;
	
КонецФункции
