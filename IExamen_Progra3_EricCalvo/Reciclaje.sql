CREATE DATABASE Reciclaje;

USE Reciclaje;

-- Crear tablas
CREATE TABLE usuarios (
    id INT not null identity(1,1),
    cedula VARCHAR(20) PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL
);

CREATE TABLE reciclaje (
    id INT not null identity(1,1) PRIMARY KEY,
    usuario_cedula VARCHAR(20),
    tipo VARCHAR(50),
    cantidad DECIMAL(10, 2),
    puntos DECIMAL(10, 2),
    FOREIGN KEY (usuario_cedula) REFERENCES usuarios(cedula)
);

-- Insertar usuarios
INSERT INTO usuarios (cedula, nombre) VALUES ('123', 'Eric Calvo');
INSERT INTO usuarios (cedula, nombre) VALUES ('456', 'Alex B');
INSERT INTO usuarios (cedula, nombre) VALUES ('789', 'Juan');

-- Insertar datos de reciclaje
INSERT INTO reciclaje (usuario_cedula, tipo, cantidad, puntos) 
VALUES ('123', 'plastico', 5, 50);

INSERT INTO reciclaje (usuario_cedula, tipo, cantidad, puntos) 
VALUES ('123', 'papel', 3, 15);

INSERT INTO reciclaje (usuario_cedula, tipo, cantidad, puntos) 
VALUES ('456', 'vidrio', 4, 32);

INSERT INTO reciclaje (usuario_cedula, tipo, cantidad, puntos) 
VALUES ('789', 'metal', 2, 24);

INSERT INTO reciclaje (usuario_cedula, tipo, cantidad, puntos) 
VALUES ('789', 'plastico', 1, 10);

-- Consulta con INNER JOIN
SELECT usuarios.cedula, usuarios.nombre, reciclaje.tipo, reciclaje.cantidad, reciclaje.puntos
FROM usuarios
INNER JOIN reciclaje ON usuarios.cedula = reciclaje.usuario_cedula;