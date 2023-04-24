-- Ejercicio Grupal 5 --

-- Justificación de tipo de datos --
-- Varchar: Se utiliza en datos que no van a ser calculados matematicamente y  del tamaño preciso --
-- Numeric: Se utiliza en las claves primarias porque es más eficiente en el trabajo --
-- Char: Se utiliza para poner el género en un solo caracter y se ahorra memoria --
-- Date: Se utiliza porque así se puede registrar la fecha y hora actual --

create database usuarios_db;
use usuarios_db;
create user 'usuarios_admin' identified by 'password';
grant all privileges on usuarios_db to 'usuarios_admin';
create table usuario(
	id_usuario numeric(8),
    nombre varchar(30),
    apellido varchar(30),
    clave varchar(8),
    zona_horaria varchar(6) default 'UTC-3', 
    genero char(1),
    telefono varchar(9)
);
create table ingreso_usuario(
	id_ingreso numeric(8),
    id_usuario numeric(8),
    tiempo_ingreso datetime default now()
);

alter table usuario modify zona_horaria varchar(6) default 'UTC-2';

insert into usuario (id_usuario, nombre, apellido, clave, genero, telefono)
values (11111111, 'Juan', 'Gallardo', 'xxxxxxxx', 'M', '911111111'),
	   (22222222, 'Carlos', 'Caballero', 'zzzzzzzz', 'M', '922222222'),
       (33333333, 'Cristian', 'Contreras', 'aaaaaaaa', 'M', '933333333'),
       (44444444, 'Luis', 'Reyes', 'bbbbbbbb', 'M', '944444444'),
       (55555555, 'Maria', 'Aravena', 'yyyyyyyy', 'F', '955555555'),
       (66666666, 'Miriam', 'Vidal', 'pppppppp', 'F', '966666666'),
       (77777777, 'Andrea', 'Guerrero', 'nnnnnnnn', 'F', '77777777'),
       (88888888, 'Barbara', 'Perez', 'kkkkkkkk', 'F', '88888888')
;

insert into ingreso_usuario(id_ingreso,id_usuario)
values (1001, 11111111),
	   (1002, 22222222),
       (1003, 33333333),
       (1004, 44444444),
       (1005, 55555555),
       (1006, 66666666),
       (1007, 77777777),
       (1008, 88888888)
;

create table contacto(
	id_contacto numeric(8),
    id_usuario numeric(8),
    telefono varchar(9),
    correo_electronico varchar(50)
    );
    
alter table usuario add primary key (id_usuario);

alter table contacto 
add constraint fk_contacto_usuario
foreign key (id_usuario)
references usuario(id_usuario);

