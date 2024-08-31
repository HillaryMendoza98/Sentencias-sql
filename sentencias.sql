--SENTENCIAS DE ACTUALIZACION
--insertar valores, registros en una tabla que estan en otra tabla distinta
--insert into tabla
--select * from otratabla


--- SELECCIONAMOS LA TABLA ORIGEN
select * from person.person

--- CREAMOS LA TABLA DESTINO
create table personejemplo(
firtname varchar (50),
lastname varchar (50)
)


select * from personejemplo

-- en select se le tiene que poner explicitamente los campos 
insert into personejemplo
select firstname, lastname from person.person

--ya obtenemos todos los registros de nuestra tabla origen person.person


--SENTENCIA UPDATE INNER JOIN ***

-- la tabla person.person tiene como campo primary key BusinessEntityhID la cual tambien esta en otras 
--tablas y se puede relacionar como por ejemplo en HummanResources.Employee

select * from person.person 

-- verificamos la tabla a relacionar

select * from humanResources.Employee -- si tiene BusinessEntityhID y jobTitle 

-- se le da un alias a person.person =p y HumanResources.Employee = e

select * from person.person p inner join HumanResources.Employee e
on e.BusinessEntityID = p.BusinessEntityID

-- Ahora vamos a filtrar por campo JobTitle, relaciona las tablas y filtra con where para que 
-- solo muestre los que tienen el pusto sales representative 

select * from person.person p inner join HumanResources.Employee e 
on e.BusinessEntityID= p.BusinessEntityID
where e.JobTitle= 'sales representative'

---jobtitle esta en humanresource.employe e.jobtitle

--Actualizar el campo Suffix con el campo NationalIDNumber 

UPDATE person.person   ---se coloca la que quieremos actualizar
set suffix = e.NationalIDNumber     -- se indica que en suffix se va a agregar lo de national 
from person.person p inner join HumanResources.Employee e
on e.BusinessEntityID=p.BusinessEntityID
where e.JobTitle='sales representative'

-- nationalidnumber esta en la tabla humanresources.employee e.NarionalIDNumber 

-- verificar que se haya actualizado los datos 

select p.suffix, e.NationalIDNumber 
from person. person p inner join HumanResources.Employee e
on e.BusinessEntityID=p.BusinessEntityID
where e.JobTitle='sales representative'

-- forma de realizar un update from y poder actualizar valores de una tabla en relacion a los 
--valores que tenemos en otra tabla, en relacion al where que tenemos en otra tabla 


---SENTENCIA DELETE INNER JOIN ***

--eliminar registros de una tabla en funcion de un inner join para eliminar los registros que coinciden
--con la condicion que se esta buscando 

select * from person.EmailAddress
select * from person.BusinessEntity  -- en esta tabla se tienen todas las entidades

select * from person.EmailAddress e
inner join person.BusinessEntity b
on b.BusinessEntityID= e.BusinessEntityID   -- unir las dos tablas por el campo primary key 

--unir con tabla HumanResources.Employee 

select * from person.EmailAddress e
inner join person.BusinessEntity b
on b.BusinessEntityID= e.BusinessEntityID  
inner join HumanResources.Employee h 
on h.BusinessEntityID= b.BusinessEntityID

-- se coloca el where y vamos a buscar por el campo jobtitle y vamos a buscar Tool Designer 

select * from person.EmailAddress e
inner join person.BusinessEntity b
on b.BusinessEntityID= e.BusinessEntityID  
inner join HumanResources.Employee h 
on h.BusinessEntityID= b.BusinessEntityID
where h.JobTitle ='Tool Designer' --- jobtitle esta en la tabla HumanResources.Employee =h.JobTitle 

-- se van a  borrar los registros que tengan el trabajo tool designer 

Delete e                              --- se le agrega el alias de la tabla 
from person.EmailAddress e
inner join person.BusinessEntity b
on b.BusinessEntityID= e.BusinessEntityID  
inner join HumanResources.Employee h 
on h.BusinessEntityID= b.BusinessEntityID
where h.JobTitle ='Tool Designer'


---- SENTENCIAS SELECT INTO **
--- crear una tabla con la misma estructura determinada pero sin obtener registros, se creo la tabla emailbackup
-- con la misma estrucutura de person.EmailAddress 

select * from person.EmailAddress 

select*into emailBackup
from person.EmailAddress
where 1=0

select * from emailBackup

---SELECT INTO (para copiar estructura y datos) tener en cuenta que no copia PK ni indices 

Select * into person.personCopia
from person.Person

select * from person.personCopia


--SELECT INTO ( PARA COPIAR TABLA EN OTRA BASE DE DATOS )
--- Se crea otra base de datos Aventurbak 

select * into AventureBak ..personAddr 
from person.Address

select * from AventureBak .. personAddr

-- se le colocan 2 puntos cuando estamos trabajando en la otra base de datos, cuando queremos acceder a 
-- una base de datos diferente 



