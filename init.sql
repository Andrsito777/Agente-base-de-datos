CREATE DATABASE IF NOT EXISTS cultivos;
USE cultivos;

CREATE TABLE lotes (
  id INT AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(50) NOT NULL,
  tipo_cultivo VARCHAR(50) NOT NULL,
  area DECIMAL(10,2) NOT NULL
);

CREATE TABLE sensores (
  id INT AUTO_INCREMENT PRIMARY KEY,
  lote_id INT NOT NULL,
  ph DECIMAL(4,2) NOT NULL,
  ec DECIMAL(6,2) NOT NULL,
  temperatura DECIMAL(5,2) NOT NULL,
  humedad DECIMAL(5,2) NOT NULL,
  fecha DATETIME NOT NULL,
  FOREIGN KEY (lote_id) REFERENCES lotes(id)
);

CREATE TABLE riego (
  id INT AUTO_INCREMENT PRIMARY KEY,
  lote_id INT NOT NULL,
  litros DECIMAL(10,2) NOT NULL,
  fecha DATETIME NOT NULL,
  FOREIGN KEY (lote_id) REFERENCES lotes(id)
);

INSERT INTO lotes (nombre, tipo_cultivo, area) VALUES
('Lote A', 'Lechuga', 25.50),
('Lote B', 'Tomate', 30.00),
('Lote C', 'Fresa', 18.75);

INSERT INTO sensores (lote_id, ph, ec, temperatura, humedad, fecha) VALUES
(1, 6.10, 1.80, 24.5, 70.0, NOW() - INTERVAL 1 DAY),
(1, 6.20, 1.75, 25.0, 68.0, NOW() - INTERVAL 2 DAY),
(2, 5.90, 2.10, 26.2, 65.5, NOW() - INTERVAL 1 DAY),
(3, 6.00, 1.95, 23.8, 72.1, NOW() - INTERVAL 1 DAY);

INSERT INTO riego (lote_id, litros, fecha) VALUES
(1, 120.5, NOW() - INTERVAL 1 DAY),
(2, 150.0, NOW() - INTERVAL 1 DAY),
(3, 98.3, NOW() - INTERVAL 1 DAY),
(1, 115.0, NOW() - INTERVAL 2 DAY);