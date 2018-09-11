use [labor_sql]
go
--1--
--БД «Комп. фірма». Вкажіть виробника для тих ПК, що мають 
--жорсткий диск об’ємом не більше 8 Гбайт. Вивести: maker, 
--type, speed, hd.-

select          pr.[maker],pr.[type],p.[speed],p.[hd]
from            [pc] p inner join [product] pr on p.[model] = pr.[model]
where           p.[hd] <= 8

--2--
--БД «Комп. фірма». Знайдіть виробників ПК з процесором не 
--менше 600 МГц. Вивести: maker.

select distinct m.[maker]
from            [pc] p inner join [product] m on p.[model] = m.[model]
where           p.[speed] >= 600

--3--
--БД «Комп. фірма». Знайдіть виробників ноутбуків з 
--процесором не вище 500 МГц. Вивести: maker. 

select distinct pr.[maker]
from            [laptop] l inner join [product] pr on l.[model] = pr.[model]
where           l.[speed] <= 500  

--4--
--БД «Комп. фірма». Знайдіть пари моделей ноутбуків, що 
--мають однакові об’єми жорстких дисків та RAM (таблиця 
--Laptop). У результаті кожна пара виводиться лише один раз. 
--Порядок виведення: модель з більшим номером, модель з 
--меншим номером, об’єм диску та RAM.

select          l.[model], r.[model], l.[hd], l.[ram]
from            [laptop] l inner join [laptop] r on l.[hd] = r.[hd] and l.[ram] = r.[ram]
where           l.[model] > r.[model] or l.[speed] > r.[speed] or l.[price] > r.[price]
  
--5--
--БД «Кораблі». Знайдіть країни, що мали класи як звичайних 
--бойових кораблів 'bb', так і класи крейсерів 'bc'. Вивести: 
--country, типи з класом 'bb', типи з класом 'bc'. 

select          l.[country], l.[type],r.[type]
from            [lasses] l inner join [lasses] r on l.[country] = r.[country]
where           l.[type] < r.[type]

--6--
--БД «Комп. фірма». Знайдіть номер моделі та виробника ПК, 
--яка має ціну менше за 600 дол. Вивести: model, maker.

select distinct [prc].[model], pr.[maker]
from            [prc] inner join [product] pr on [prc].[model] = pr.[model]
where           [prc].[price] < 600

--7--
--БД «Комп. фірма». Знайдіть номер моделі та виробника 
--прінтера, яка має ціну вищу за 300 дол. Вивести: model, maker. 

select distinct prt.[model], pr.[maker]
from            [printer] prt inner join [product] pr on prt.[model] = pr.[model]
where           prt.[price] > 300

--8--
--БД «Комп. фірма». Виведіть виробника, номер моделі та ціну 
--кожного комп’ютера, що є у БД. Вивести: maker, model, price. 

select          [pr].[maker],[pc].[model],[pc].[price]
from            [pc] inner join [product] pr on [pc].[model] = pr.[model]

--9--
--БД «Комп. фірма». Виведіть усі можливі моделі ПК, їх 
--виробників та ціну (якщо вона вказана). Вивести: maker, 
--model, price.

select distinct pr.[maker], pr.[model], [pc].[price]
from            [product] pr left outer join [pc] on pr.[model] = [pc].[model]
where           pr.[type] = 'PC' 
 
--10--
--БД «Комп. фірма». Виведіть виробника, тип, модель та частоту 
--процесора для ноутбуків, частота процесорів яких перевищує 
--600 МГц. Вивести: maker, type, model, speed. 

select distinct pr.[maker], pr.[type], l.[model], l.[speed]
from            [laptop] l inner join [product] pr on l.[model] = pr.[model]
where           l.[speed] > 600

--11--
--БД «Кораблі». Для кораблів таблиці Ships вивести їх 
--водотоннажність. 

select         s.[name],cl.[displacement]
from           [ships] s inner join [classes] cl on s.[class] = cl.[class]

--12--
--БД «Кораблі». Для кораблів, що вціліли у битвах, вивести 
--назви та дати битв, у яких вони брали участь.  

select         o.[ship],o.[battle],o.[result],b.[date]
from           [outcomes] o inner join [battles] b on o.[battle] = b.[name]
where          o.[result] not like 'sunk'

--13--
--БД «Кораблі». Для кораблів таблиці Ships вивести країни, 
--яким вони належать. 

select         s.[name], s.[class],s.[launched],cl.[country]
from           [ships] s inner join [classes] cl on s.[class] = cl.[class]

--14--
--БД «Аеропорт». Для рейсових літаків 'Boeing' вказати назви 
--компаній, яким вони належать.

select distinct co.[name]
from            [trip] tr inner join [company] co on tr.[id_comp] = co.[id_comp]
where           tr.[plane] like 'Boeing'

--15--
--БД «Аеропорт». Для пасажирів таблиці Passenger вивести 
--дати, коли вони користувалися послугами авіаліній.

select          psg.[name],ptr.[date]
from            [passenger] psg inner join [pass_in_trip] ptr on psg.[id_psg] = ptr.[id_psg]

--16--
--БД «Комп. фірма». Знайти модель, частоту процесора та об’єм 
--жорсткого диску для тих комп’ютерів, що комплектуються 
--накопичувачами 10 або 20 Мб та випускаються виробником 
--'A'. Вивести: model, speed, hd. Вихідні дані впорядкувати за 
--зростанням за стовпцем speed. 

select          [pc].[model],[speed],[hd]
from            [pc] inner join [product] pr on [pc].[model] = pr.[model]
where           pr.[maker] like 'A' and ([hd] = 20 or [hd] = 10)
order by        [speed]

--17--
--Для кожного виробника з таблиці Product визначити число 
--моделей кожного типу продукції (PIVOT).

select[maker], isnull([pc],0) as pc, isnull([laptop],0) as laptop, isnull([printer],0) as printer
from (select pr.[maker] as [maker], pr.[type] as [type], 1 as [amount]
      from select [model]
           from   [laptop]
				   union 
				        select [model]
                        from   [pc]
				             union 
				                  select [model]
                                  from   [printer]) as sel inner join [product] pr on sel.[model]=pr.[model]) as [table]
pivot(SUM([amount])for [type] in ([pc],[laptop],[printer])) as [pivot] 

--18--
--Порахувати середню ціну на ноутбуки в залежності від 
--розміру екрана. (PIVOT) 

select * from(select [price],[screen] from   [laptop]) as [table] 
pivot  (AVG([price])for [screen] in ([11],[12],[14],[15])) as [pivot]
 
--19--
--Для кожного ноутбука додатково вивести ім'я виробника. 
--(CROSS APPLY)

select l.*, c.[maker]
from [laptop] l cross apply (select [maker] from [product] pr where  l.[model] = pr.[model]) c

--20--
--Для кожного ноутбука додатково вивести максимальну ціну 
--серед ноутбуків того ж виробника. (CROSS APPLY) 

select          sel1.[code],sel1.[model],sel1.[speed],sel1.[ram],sel1.[hd],sel1.[price],sel1.[screen],sel3.[max_price]
from 
(select l.*, pr.[maker] from [laptop] l inner join [product] pr on l.[model]  = pr.[model]) sel1 
cross apply 
(select  sel2.[max_price] from 
                      (select pr.[maker], MAX(l.[price]) as max_price
                       from   [laptop] l inner join [product] pr on l.model = pr.model
                       group by p.maker) sel2
				 where   sel1.[maker] = sel2.[maker]) sel3

--21--
--З'єднати кожен рядок з таблиці Laptop з наступним рядком в 
--порядку, заданому сортуванням (model, code). (CROSS 
--APPLY) 
select * from laptop order by  model,code
select * from [laptop] l cross apply (select * from   [laptop]
									  where  [code] > l.[code] ) r
order by l.[model],l.[code]

--22--
--З'єднати кожен рядок з таблиці Laptop з наступним рядком в 
--порядку, заданому сортуванням (model, code). (OUTER 
--APPLY) 

--23--
--Вивести з таблиці Product по три моделі з найменшими 
--номерами з кожної групи, яка характеризується типом 
--продукції. (CROOSS APPLY) 


--24--
--Для таблиці Laptop представити інформацію про продукти в 
--три стовпці: code, назва характеристики (speed, ram, hd або 
--screen), значення характеристики .. (CROOSS APPLY) 
