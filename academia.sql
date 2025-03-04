create schema if not exists franciscomoma;

set schema 'franciscomoma';


create table persona(
	id serial primary key,
	dni varchar(10) not null,
	nombre varchar(50) not null,
	apellido_1 varchar(50) not null,
	apellido_2 varchar(50)
);

create table contacto(
	id serial primary key,
	id_persona integer not null,
	telefono varchar(10) not null,
	email varchar(50) not null,
	calle varchar(80) not null,
	numero varchar(10) not null,
	direccion varchar(30) not null,
	constraint contacto_persona_fk foreign key (id_persona) references persona(id)  
);


create table poblacion(
	id serial primary key,
	poblacion varchar(50) not null,
	id_provincia integer not null
);


create table provincia(
	id serial primary key,
	provincia varchar(30) not null
);


alter table poblacion 
add constraint poblacion_provincia_fk
foreign key (id_provincia)
references provincia(id);


create schema if not exists franciscomoma;

set schema 'franciscomoma';


create table persona(
	id serial primary key,
	dni varchar(10) not null,
	nombre varchar(50) not null,
	apellido_1 varchar(50) not null,
	apellido_2 varchar(50)
);

create table contacto(
	id serial primary key,
	id_persona integer not null,
	telefono varchar(10) not null,
	email varchar(50) not null,
	calle varchar(80) not null,
	numero varchar(10) not null,
	direccion varchar(30) not null,
	constraint contacto_persona_fk foreign key (id_persona) references persona(id)  
);


create table poblacion(
	id serial primary key,
	poblacion varchar(50) not null,
	id_provincia integer not null
);


create table provincia(
	id serial primary key,
	provincia varchar(30) not null
);


create table curso(
	id serial primary key,
	nombre varchar(80) not null
);


create table edicion(
	id serial primary key,
	id_curso integer not null,
	nombre varchar(80) not null
);


create table matrícula(
	id serial primary key,
	id_alumno integer not null,
	id_edicion integer not null,
	fecha date not null
);


alter table edicion 
add constraint edicion_curso_fk
foreign key (id_curso)
references curso(id);


alter table matrícula 
add constraint matricula_edicion_fk
foreign key (id_edicion)
references edicion(id);


alter table matrícula 
add constraint matricula_persona_fk
foreign key (id_alumno)
references persona(id);



insert into provincia (provincia) values ('ALMERIA');


alter table provincia 
add constraint unique_provincia
unique (provincia);


create unique index unique_provincia_index on provincia (lower(provincia));

create unique index unique_poblacion_index on poblacion (lower(poblacion), id_provincia);


insert into poblacion (id_provincia, poblacion) values (6, 'Albacete'), (11, 'Albacete');



alter table provincia drop constraint unique_provincia;


select id, initcap(substring(provincia from 2 for 3)) as "Resultado de la funcion" from provincia;

delete from provincia where id = 2;



select * from provincia;

update provincia set provincia = initcap(provincia);


alter table contacto
add constraint solo_emails_validos
check (email like '%@%');



insert into persona (dni, nombre, apellido_1) values ('777771Z', 'Oscar', 'Cañas');

select * from persona;

insert into contacto (id_persona, telefono, email, calle , numero, direccion) 
values (1, '88888888', 'hola@mundo', 'Goya', '4', '');





