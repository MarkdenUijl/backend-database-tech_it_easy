-- 1. CREATING THE TABLES:
DROP TABLE IF EXISTS users;
DROP TABLE IF EXISTS cimodules CASCADE;
DROP TABLE IF EXISTS televisions CASCADE;
DROP TABLE IF EXISTS remotecontrollers;
DROP TABLE IF EXISTS wallbrackets CASCADE;
DROP TABLE IF EXISTS televisions_wallbrackets;

CREATE TABLE users (
	id INT GENERATED ALWAYS AS IDENTITY,
	username VARCHAR (255) NOT NULL UNIQUE,
	password VARCHAR (255) NOT NULL,
	PRIMARY KEY (id)
);

CREATE TABLE cimodules (
	id BIGINT GENERATED ALWAYS AS IDENTITY,
	name VARCHAR (255) NOT NULL UNIQUE,
	brand VARCHAR (255) NOT NULL,
	price FLOAT NOT NULL,
	current_stock INT,
	sold INT,
	PRIMARY KEY (id)
);

CREATE TABLE remotecontrollers (
	id BIGINT GENERATED ALWAYS AS IDENTITY,
	name VARCHAR (255) NOT NULL UNIQUE,
	brand VARCHAR (255) NOT NULL,
	price FLOAT NOT NULL,
	current_stock INT,
	sold INT,
	compatible_with VARCHAR,
	battery_type VARCHAR (255) NOT NULL,
	PRIMARY KEY (id)
);

CREATE TABLE televisions (
	id BIGINT GENERATED ALWAYS AS IDENTITY,
	name VARCHAR (255) NOT NULL UNIQUE,
	brand VARCHAR (255) NOT NULL,
	price FLOAT NOT NULL,
	current_stock INT,
	sold INT,
	type VARCHAR (255) NOT NULL,
	available FLOAT NOT NULL,
	refresh_rate FLOAT NOT NULL,
	screen_type VARCHAR (255) NOT NULL,
	compatible_remote BIGINT,
	compatible_cimodules BIGINT,
	PRIMARY KEY (id),
	CONSTRAINT fk_compatible_remote FOREIGN KEY (compatible_remote) REFERENCES remotecontrollers(id),
	CONSTRAINT fk_compatible_cimodules FOREIGN KEY (compatible_cimodules) REFERENCES cimodules(id)
);

CREATE TABLE wallbrackets (
	id BIGINT GENERATED ALWAYS AS IDENTITY,
	name VARCHAR (255) NOT NULL UNIQUE,
	brand VARCHAR (255) NOT NULL,
	price FLOAT NOT NULL,
	current_stock INT,
	sold INT,
	adjustable BOOL NOT NULL,
	PRIMARY KEY (id)
);

CREATE TABLE televisions_wallbrackets (
	television_id BIGINT,
	wallbracket_id BIGINT,
	CONSTRAINT fk_television FOREIGN KEY (television_id) REFERENCES televisions(id),
	CONSTRAINT fk_wallbracket FOREIGN KEY (wallbracket_id) REFERENCES wallbrackets(id)
);

-- 2. POPULATING THE TABLES WITH DATA:
INSERT INTO users (username, password)
VALUES 
	('Hella_Langevelden', 'ikBenHella123'),
	('Paulus_Langevelden', 'PaulusIsDeBeste!'),
	('Robin_Langevelden', 'Rob!nH00d');
			
INSERT INTO cimodules (name, brand, price, current_stock, sold)
VALUES 
  ('Module A', 'Brand X', 25.99, 100, 0),
  ('Module B', 'Brand Y', 30.50, 80, 10),
  ('Module C', 'Brand Z', 15.75, 120, 5),
  ('Module D', 'Brand X', 20.00, 90, 15),
  ('Module E', 'Brand Y', 18.99, 110, 3),
  ('Module F', 'Brand Z', 22.50, 70, 20),
  ('Module G', 'Brand X', 28.75, 95, 5),
  ('Module H', 'Brand Y', 35.00, 60, 25),
  ('Module I', 'Brand Z', 17.99, 105, 15),
  ('Module J', 'Brand X', 23.50, 75, 10);
  
INSERT INTO remotecontrollers (name, brand, price, current_stock, sold, compatible_with, battery_type)
VALUES 
  ('Sony Universal Remote', 'Sony', 29.99, 50, 0, 'Sony', 'AAA'),
  ('Samsung Smart TV Remote', 'Samsung', 39.99, 60, 10, 'Samsung', 'AA'),
  ('LG Basic Remote', 'LG', 19.99, 40, 5, 'LG', 'AAA'),
  ('TCL Voice Control Remote', 'TCL', 49.99, 70, 15, 'TCL', 'AA'),
  ('Sony Advanced Universal Remote', 'Sony', 29.99, 30, 3, 'Sony', 'AAA'),
  ('Samsung Universal Smart TV Remote', 'Samsung', 39.99, 80, 20, 'Samsung', 'AA'),
  ('LG Smart TV Remote', 'LG', 19.99, 90, 5, 'LG', 'AAA'),
  ('TCL Voice Activated Remote', 'TCL', 49.99, 100, 25, 'TCL', 'AA'),
  ('Sony Premium Universal Remote', 'Sony', 29.99, 110, 15, 'Sony', 'AAA'),
  ('Samsung Premium Smart TV Remote', 'Samsung', 39.99, 120, 10, 'Samsung', 'AA');
  
INSERT INTO televisions (name, brand, price, current_stock, sold, type, available, refresh_rate, screen_type, compatible_remote, compatible_cimodules)
VALUES 
  ('Sony 55 Inch 4K LED TV', 'Sony', 899.99, 50, 0, 'LED', 55.0, 120.0, 'LCD', 1, 1),
  ('Samsung 65 Inch 4K OLED TV', 'Samsung', 799.99, 60, 10, 'OLED', 65.0, 144.0, 'QLED', 2, 2),
  ('LG 50 Inch 4K LED TV', 'LG', 999.99, 40, 5, 'LED', 50.0, 120.0, 'OLED', 3, 3),
  ('TCL 45 Inch Full HD LCD TV', 'TCL', 699.99, 70, 15, 'LCD', 45.0, 60.0, 'LED', 4, 4),
  ('Sony 60 Inch 4K OLED TV', 'Sony', 1099.99, 30, 3, 'OLED', 60.0, 120.0, 'QLED', 5, 5),
  ('Samsung 55 Inch 4K LED TV', 'Samsung', 849.99, 80, 20, 'LED', 55.0, 144.0, 'OLED', 6, 6),
  ('LG 65 Inch 4K OLED TV', 'LG', 799.99, 90, 5, 'OLED', 65.0, 120.0, 'LED', 7, 7),
  ('TCL 70 Inch 4K QLED TV', 'TCL', 749.99, 100, 25, 'QLED', 70.0, 60.0, 'LCD', 8, 8),
  ('Sony 50 Inch 4K LED TV', 'Sony', 999.99, 110, 15, 'LED', 50.0, 120.0, 'OLED', 9, 9),
  ('Samsung 60 Inch 4K OLED TV', 'Samsung', 899.99, 120, 10, 'OLED', 60.0, 144.0, 'QLED', 10, 10);

INSERT INTO wallbrackets (name, brand, price, current_stock, sold, adjustable)
VALUES 
  ('UltraSlim Wall Mount', 'MountIt', 19.99, 50, 0, false),
  ('Elegant Tilted Wall Mount', 'Sanus', 29.99, 60, 10, true),
  ('Artistic Articulating Wall Mount', 'Echogear', 39.99, 40, 5, true),
  ('Stealth Fixed Wall Mount', 'MountIt', 19.99, 70, 15, false),
  ('Premium Tilted Wall Mount', 'Sanus', 29.99, 30, 3, true),
  ('Flexible Articulating Wall Mount', 'Echogear', 39.99, 80, 20, true),
  ('Sleek Fixed Wall Mount', 'MountIt', 19.99, 90, 5, false),
  ('Elite Tilted Wall Mount', 'Sanus', 29.99, 100, 25, true),
  ('Pro Articulating Wall Mount', 'Echogear', 39.99, 110, 15, true),
  ('Compact Fixed Wall Mount', 'MountIt', 19.99, 120, 10, false);

INSERT INTO televisions_wallbrackets (television_id, wallbracket_id)
SELECT t.id, w.id
FROM televisions t
CROSS JOIN wallbrackets w
WHERE t.brand = 'Sony' OR t.brand = 'TCL' AND w.brand = 'MountIt';

INSERT INTO televisions_wallbrackets (television_id, wallbracket_id)
SELECT t.id, w.id
FROM televisions t
CROSS JOIN wallbrackets w
WHERE t.brand = 'Samsung' OR t.brand = 'LG' AND w.brand = 'Sanus';

INSERT INTO televisions_wallbrackets (television_id, wallbracket_id)
SELECT t.id, w.id
FROM televisions t
CROSS JOIN wallbrackets w
WHERE t.brand = 'Sony' OR t.brand = 'Samsung' AND w.brand = 'EchoGear';

-- 3. SELECT STATEMENTS:
SELECT televisions.name, wallbrackets.name
FROM televisions
JOIN televisions_wallbrackets ON televisions_wallbrackets.television_id = televisions.id
JOIN wallbrackets ON wallbrackets.id = televisions_wallbrackets.wallbracket_id
WHERE televisions.brand = 'Sony';