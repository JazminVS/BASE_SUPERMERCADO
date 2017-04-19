create database santamaria
use santamaria

create table empleados
(
id_e int not null,
nom_e varchar (25) not null,
ape_e varchar (25) not null,
edad_e int not null,
cargo_e varchar (25) not null,
dir_e varchar (25),
 PRIMARY KEY (id_e)

)

create table cliente 
(
id_c int not null,
nom_c varchar (25) not null,
ape_c varchar (25) not null,
dir_e varchar (25),
 PRIMARY KEY (id_c)

)

create table sucursal (
id_su int identity not null,
dir_su varchar (25) not null,
encargado_su varchar (25) not null,
id_efk int not null,
id_cfk int not null,

PRIMARY KEY (id_su),
FOREIGN KEY (id_efk) REFERENCES empleados(id_e),
FOREIGN KEY (id_cfk) REFERENCES cliente(id_c),

)

create table proveedores (
id_prove int  not null,
nom_prove varchar (25) not null,
telf_prove int not null,
PRIMARY KEY (id_prove),

)
create table productos (
id_prod int identity not null,
nom_prod varchar (25) not null,
stock_prod int not null,
precio_pro numeric (4,2) not null,
PRIMARY KEY (id_prod),

)

create table promociones (
id_promo int identity not null,
fecha_caducidad date not null,
tipo_promo varchar (25) not null,
descrip_promo varchar (25) not null,
precio_promo numeric (4,2) not null,
id_prodfk int not null,
PRIMARY KEY (id_promo),
FOREIGN KEY (id_prodfk ) REFERENCES productos(id_prod)
)


create table sucursal_proveedor (
id_su_pr int identity not null,
id_sufk int not null,
id_provefk int  not null,
id_prodfk int  not null,
PRIMARY KEY (id_su_pr),
FOREIGN KEY (id_sufk ) REFERENCES sucursal(id_su),
FOREIGN KEY (id_provefk) REFERENCES proveedores(id_prove),
FOREIGN KEY (id_prodfk) REFERENCES productos(id_prod)