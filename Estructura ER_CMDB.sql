use cmdb;

create table if not exists empresa(
	id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    direccion VARCHAR(50),
    telefono VARCHAR(8) NOT NULL,
    correo VARCHAR(50)
);

create table if not exists tipo_recurso (
	id_tipo_recurso INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL
);

create table if not exists item (
	id_item INT AUTO_INCREMENT PRIMARY KEY,
    id_tipo_recurso INT NOT NULL,
    nombre VARCHAR(50) NOT NULL,
    FOREIGN KEY (id_tipo_recurso) REFERENCES tipo_recurso(id_tipo_recurso)
);

create table if not exists departamento(
	id_departamento INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL
);

create table if not exists usuario(
	id_usuario INT AUTO_INCREMENT PRIMARY KEY,
    id_departamento INT NOT NULL,
    nombre VARCHAR(50) NOT NULL,
    puesto VARCHAR(50) NOT NULL,
    FOREIGN KEY (id_departamento) REFERENCES departamento(id_departamento)
);

create table if not exists incidencia(
	id_incidencia INT AUTO_INCREMENT PRIMARY KEY,
    id_item INT NOT NULL,
    id_usuario INT NOT NULL,
    nombre VARCHAR(50) NOT NULL,
    fecha DATE NOT NULL,
    FOREIGN KEY (id_item) REFERENCES item(id_item),
    FOREIGN KEY (id_usuario) REFERENCES usuario(id_usuario)
);

create table if not exists peticion(
	id_peticion INT AUTO_INCREMENT PRIMARY KEY,
    id_item INT NOT NULL,
    id_usuario INT NOT NULL,
    descripcion VARCHAR(100) NOT NULL,
    motivo VARCHAR(50),
    fecha DATE,
    FOREIGN KEY (id_item) REFERENCES item(id_item),
    FOREIGN KEY (id_usuario) REFERENCES usuario(id_usuario)
);

create table if not exists catalogo(
	id_tipo_recurso INT NOT NULL,
    id_item INT NOT NULL,
    nombre VARCHAR(50) NOT NULL,
    PRIMARY KEY (id_tipo_recurso, id_item),
    FOREIGN KEY (id_tipo_recurso) REFERENCES tipo_recurso(id_tipo_recurso),
    FOREIGN KEY (id_item) REFERENCES item(id_item)
);

create table if not exists tipo_problema(
	id_tipo_problema INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL
);

create table if not exists problema(
	id_problema INT AUTO_INCREMENT PRIMARY KEY,
    id_tipo_problema INT NOT NULL,
    id_usuario INT NOT NULL,
    descripcion VARCHAR(100) NOT NULL,
    fecha DATE,
    FOREIGN KEY (id_tipo_problema) REFERENCES tipo_problema(id_tipo_problema),
    FOREIGN KEY (id_usuario) REFERENCES usuario(id_usuario)
);

create table if not exists entrega(
	id_entrega INT AUTO_INCREMENT PRIMARY KEY,
    id_item INT NOT NULL,
    id_usuario INT NOT NULL,
    descripcion VARCHAR(100) NOT NULL,
    fecha DATE,
    FOREIGN KEY (id_item) REFERENCES item(id_item),
    FOREIGN KEY (id_usuario) REFERENCES usuario(id_usuario)
);

create table if not exists solucion(
	id_problema INT NOT NULL,
    fecha_reporte DATE NOT NULL,
    fecha_solucion DATE NOT NULL,
    descripcion VARCHAR(100) NOT NULL,
    PRIMARY KEY(id_problema),
    FOREIGN KEY (id_problema) REFERENCES problema(id_problema)
);