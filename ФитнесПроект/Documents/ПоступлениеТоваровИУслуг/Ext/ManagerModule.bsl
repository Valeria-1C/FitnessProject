﻿//Функция СтатьяЗатратПоУслуге(Услуга) Экспорт
//	
//	Запрос = Новый Запрос;
//	Запрос.Текст =
//	"ВЫБРАТЬ
//	|	Номенклатура.СтатьяЗатрат КАК СтатьяЗатрат
//	|ИЗ
//	|	Справочник.Номенклатура КАК Номенклатура
//	|ГДЕ
//	|	Номенклатура.Наименование = &Наименование";
//	Запрос.УстановитьПараметр("Наименование" , Услуга);
//	Выборка = Запрос.Выполнить().Выбрать();
//	Возврат Выборка.СтатьяЗатрат;
//	
//КонецФункции
