-- Creamos la base de datos
CREATE DATABASE IF NOT EXISTS gestor_tasks;

-- Nos aseguramos de usar la base de datos que acabamos de crear
USE gestor_tasks;

-- Creamos la tabla de usuarios
CREATE TABLE IF NOT EXISTS usuarios (
 id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    fecha_creacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Creamos la tabla de roles
CREATE TABLE IF NOT EXISTS roles(
   user_id INT,
   rol VARCHAR(50) NOT NULL,
   FOREIGN KEY (user_id) REFERENCES usuarios(id)
);

-- Creamos la tabla de prioridades
CREATE TABLE IF NOT EXISTS prioridades (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    valor INT NOT NULL
);

-- Insertamos algunas prioridades
INSERT INTO prioridades (nombre, valor) VALUES 
('Baja', 1),
('Media', 2),
('Alta', 3);

-- Creamos la tabla de tareas
CREATE TABLE IF NOT EXISTS tareas (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    descripcion TEXT,
    estado ENUM('Pendiente', 'Completada') NOT NULL,
    fecha_creacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    fecha_vencimiento DATE,
    usuario_id INT NOT NULL,
    prioridad_id INT,  -- Añadimos una columna para la relación con la tabla de prioridades
    FOREIGN KEY (usuario_id) REFERENCES usuarios(id),
    FOREIGN KEY (prioridad_id) REFERENCES prioridades(id)  -- Establecemos la relación con la tabla de prioridades
);

-- Creamos la tabla de etiquetas
CREATE TABLE IF NOT EXISTS etiquetas (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL
);

-- Insertamos algunas etiquetas
INSERT INTO etiquetas (nombre) VALUES 
('Trabajo'),
('Personal'),
('Urgente');

-- Creamos la tabla de relación entre tareas y etiquetas
CREATE TABLE IF NOT EXISTS tarea_etiqueta (
    tarea_id INT,
    etiqueta_id INT,
    PRIMARY KEY (tarea_id, etiqueta_id),
    FOREIGN KEY (tarea_id) REFERENCES tareas(id),
    FOREIGN KEY (etiqueta_id) REFERENCES etiquetas(id)
);
