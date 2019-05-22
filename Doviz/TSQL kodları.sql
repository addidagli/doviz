create database Doviz
GO
Use Doviz 
GO
create table ParaBirimi
(
ID uniqueidentifier primary key, 
Code nvarchar (8),
Tanim nvarchar(70),
UyariLimit decimal, 
)

go 
insert into ParaBirimi(ID,Code,Tanim,UyariLimit) values (newid(), 'USD', 'Amerikan Doları',4.25)
insert into ParaBirimi(ID,Code,Tanim,UyariLimit) values (newid(), 'EUR', 'EURO',0)
insert into ParaBirimi(ID,Code,Tanim,UyariLimit) values (newid(), 'GBP', 'İngiliz Sterlini',0)


select * from ParaBirimi
go

create table Kur
(
ID uniqueidentifier primary key,
ParaBirimiID uniqueidentifier,
Alis decimal,
Satis decimal, 
Tarih datetime
)

Go

create table KurGecmis
(
ID uniqueidentifier primary key,
KurID uniqueidentifier,
ParaBirimiID uniqueidentifier,
Alis decimal,
Satis decimal, 
Tarih datetime
)

Go 


create proc KurKayitEkle 
(
@ID uniqueidentifier,
@ParaBirimiID uniqueidentifier,
@Alis decimal,
@Satis decimal, 
@Tarih datetime
)
as
begin 

if((select count(*) from Kur where ParaBirimiID = @ParaBirimiID)>0)
begin
insert into KurGecmis (ID,KurID,ParaBirimiID,Alis,Satis,Tarih) select newid(),ID,ParaBirimiID,Alis,Satis,Tarih from Kur where ParaBirimiID=@ParaBirimiID; 

update Kur set 
Alis=@Alis,
Satis=@Satis
where 
ParaBirimiID=@ParaBirimiID

end
else
begin
insert into Kur(ID,ParaBirimiID,Alis,Satis,Tarih) values (@ID,@ParaBirimiID,@Alis,@Satis,@Tarih)
end
	
end
