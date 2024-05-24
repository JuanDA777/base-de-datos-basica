DROP DATABASE IF EXISTS Farmacia;
CREATE DATABASE Farmacia;
USE Farmacia;

CREATE TABLE Categorias (
    ID_Categoria INT AUTO_INCREMENT PRIMARY KEY,
    Nombre_Categoria VARCHAR(100) NOT NULL
);

CREATE TABLE Medicamentos (
    ID_Medicamento INT AUTO_INCREMENT PRIMARY KEY,
    Nombre VARCHAR(100) NOT NULL,
    Precio DECIMAL(10, 2) NOT NULL,
    Compuestos VARCHAR(255),
    Fecha_Vencimiento DATE,
    Cantidad_Stock INT,
    ID_Categoria INT,
    FOREIGN KEY (ID_Categoria) REFERENCES Categorias(ID_Categoria) ON UPDATE CASCADE ON DELETE CASCADE
);

INSERT INTO Categorias (Nombre_Categoria) VALUES 
('Analgésicos'),
('Antibióticos'),
('Antihistamínicos'),
('Antiinflamatorios'),
('Antisépticos'),
('Antivirales'),
('Antifúngicos');

