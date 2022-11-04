DROP TABLE IF EXISTS materials;
DROP TABLE IF EXISTS weapon_materials;
DROP TABLE IF EXISTS armour_materials;
DROP TABLE IF EXISTS weapon_type;
DROP TABLE IF EXISTS armour_type;
DROP TABLE IF EXISTS item_type;
DROP TABLE IF EXISTS items;


CREATE TABLE weapon_type (
	id_weapon_type INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
	type VARCHAR(24),
    description TEXT,
    icon VARCHAR(16)
);


INSERT INTO weapon_type (type, description, icon)
VALUES ("Melee", "Cuerpo a cuerpo", "melee.png"), 
("Range", "Disparo a distancia", "range.png");


CREATE TABLE armour_type (
	id_armour_type INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
	type VARCHAR(24),
    description TEXT,
    icon VARCHAR(16)
);

INSERT INTO armour_type (type, description, icon)
VALUES ("Peto", "peto", "peto.png"), 
("Traje", "UN bonito traje", "traje.png"), 
("Casco", "Un casco que proteje xd", "casco.png");



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





CREATE TABLE weapon_materials (
	id_weapon_materials INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
	id_weapon INT UNSIGNED,
    id_material INT UNSIGNED
);





CREATE TABLE armour_materials (
	id_armour_materials INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
	id_armour INT UNSIGNED,
    id_material INT UNSIGNED
);




DROP TABLE IF EXISTS item;
DROP TABLE IF EXISTS item_type;


CREATE TABLE item_type (
	id_item_type INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
	type VARCHAR(24),
    description TEXT,
    icon VARCHAR(16)
);
INSERT INTO item_type (type, description, icon)
VALUES ("Pocion", "Hacen cosas", "pocion.png"), 
("comida", "Se puede consumir", "comida.png"), 
("Tesoro", "tesoros en general", "tesoro.png");



CREATE TABLE item (
    id_item INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
    item VARCHAR(24),
    consumible BOOLEAN,
    cost FLOAT,
    `key` BOOLEAN,
    rarity INT,
    weight FLOAT,
    `usage` INT,
    fusionable BOOLEAN,
    width FLOAT,
    height FLOAT,
    durability INT,
    description TEXT,
    dissasamble BOOLEAN,
    id_item_type INT UNSIGNED,
    FOREIGN KEY (id_item_type) REFERENCES item_type (id_item_type)
);

INSERT INTO item ( item, consumible, cost, 
                   `key`, rarity, weight, 
                   `usage`, fusionable, width, 
                   height, durability,
                   description, dissasamble, id_item_type)
VALUES 
("Queso",1, 50,
 0 ,100, 2.5, 
 1, 1, 0.1, 
 0.1, 3, 
 "Queso que sabe a beso", 0, 1),
("Carne de zombie",1, 20, 
 0 , 2, 0.3, 
 1, 1, 0.3, 
 0.3, 1, 
 "Huele muy mal" , 0, 1),
("Fragmento Escarlata",1, 500,
 0 , 10000, 45,
 1 , 1, 0.5,
 0.25, -1,
 "Piedra rara de un volcan" , 0, 2
);



DROP TABLE IF EXISTS characters_weapons
CREATE TABLE characters_weapons (

id_character_weapon INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
id_character INT UNSIGNED,

id_weapon INT UNSIGNED,

FOREIGN KEY (id_character) REFERENCES characters (id_character),

FOREIGN KEY (id_weapon) REFERENCES weapons (id_weapon)

i

INSERT INTO characters_weapons (id_character, id_weapon)
VALUES (1, 1), (4, 3), (4, 1),


DROP TABLE IF EXISTS weapons;
DROP TABLE IF EXISTS weapons_types;

CREATE TABLE weapons_types (
    id_weapons_type INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
    type VARCHAR(24),
    description TEXT,
    icon VARCHAR(16)
);
INSERT INTO weapons_types ( type, description, icon) 
VALUES 
("Melee","Cuerpo a cuerpo", "melee.png"),
("Ranged","A distancia", "distancia.png"
);

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



DROP TABLE IF EXISTS weapon_materials;
DROP TABLE IF EXISTS armour_materials;



CREATE TABLE weapons_materials (
id_weapon_material INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
id_weapon INT UNSIGNED,
id_material INT UNSIGNED,
FOREIGN KEY (id_weapon) REFERENCES weapons (id_weapon),
FOREIGN KEY (id_material) REFERENCES materials (id_material)
    );


CREATE TABLE armours_materials (
id_armour_material INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
id_armour INT UNSIGNED,
id_material INT UNSIGNED,
FOREIGN KEY (id_armour) REFERENCES armours (id_armour),
FOREIGN KEY (id_material) REFERENCES materials (id_material)
    );
