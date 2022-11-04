DROP TABLE IF EXISTS weapon_materials;

DROP TABLE IF EXISTS weapons;
DROP TABLE IF EXISTS materials;

DROP TABLE IF EXISTS weapons_types;


CREATE TABLE weapons_types (
    id_weapons_type INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
    type VARCHAR(24),
    description TEXT,
    icon VARCHAR(16)
);
INSERT INTO weapons_types (type, description, icon)
VALUES ("Melee", "Cuerpo a cuerpo", "melee.png"), 
("Range", "Disparo a distancia", "range.png");


CREATE TABLE materials (
	id_material INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
	material VARCHAR(16),
    color CHAR(6),
    cost FLOAT
);

INSERT INTO materials (material, color, cost) VALUES 
("Obsidiana","000000", 40), 
("Madera", "ddeeaa", 10), 
("Carne", "ffff00", 5), 
("Pana", "ffdddd", 50), 
("Goma sagrada", "ffffff", 1000), 
("Piedra", "cccccc", 1), 
("Cuero", "ddddaa", 20), 
("Bandera ESPAÑA", "ESPAÑA", 2030), 
("Plumas de angel", "ffffff", 10000), 
("Materia oscura", "000000", 10000), 
("Hueso", "dddddd", 10), 
("Agua", "0000ff", 1), 
("Lava", "ff0000", 500);

CREATE TABLE weapons (
    id_weapons INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
    weapon VARCHAR(24),
    grip INT,
    durability INT,
    distance FLOAT,
    quality INT,
    physic_attack FLOAT,
    physic_defense FLOAT,
    magic_attack FLOAT,
    magic_defense FLOAT,
    description TEXT,
    level INT,
    level_min INT,
    id_weapon_type INT UNSIGNED,
    FOREIGN KEY (id_weapon_type) REFERENCES weapons_types (id_weapons_type)
);


INSERT INTO weapons ( weapon, grip, durability, 
                   distance, quality, physic_attack, 
                   physic_defense, magic_attack, magic_defense, 
                   description, level,
                   level_min, id_weapon_type) 
VALUES 
("Brazo de bebes",1, 100,
 0.5 ,0, 0, 
 0, 0, 0,
 "Arrancaste un brazo de un bebe", 0,
 0, 1), 
 
("Estelada",1, 1714,
 3 ,100, 1, 
 1, 1, 1,
 "Una bandera con una estrella", 101,
 100, 1),
 
 ("Astrape",1, -1,
 1000 ,100, 100, 
 10, 100, 30,
 "El rayo de zeus", 100,
 100, 1),
 
 ("Espada de Yerba",1, 900,
 3 ,100, 1, 
 1, 1, 1,
 "La mítica espada de YERBA todo el mundo la conoce", 100,
 100, 1
 );


CREATE TABLE weapon_materials (
	id_weapon_materials INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
	id_weapon INT UNSIGNED,
    id_material INT UNSIGNED
);