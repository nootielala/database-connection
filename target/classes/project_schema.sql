DROP TABLE IF EXISTS project_category;
DROP TABLE IF EXISTS category;
DROP TABLE IF EXISTS step;
DROP TABLE IF EXISTS material;
DROP TABLE IF EXISTS project;

CREATE TABLE project (
project_id int AUTO_INCREMENT NOT NULL,
project_name varchar(128) NOT NULL,
estimated_hours decimal(7,2),
actual_hours decimal(7,2),
difficulty int,
notes TEXT,
primary key (project_id)
);



CREATE TABLE material (
material_id int auto_increment NOT NULL,
project_id int NOT NULL,
material_name varchar(128) NOT NULL,
num_required int,
cost decimal(7, 2),
foreign key(project_id) references project(project_id) on delete cascade,
primary key(material_id)
);




CREATE TABLE step (
step_id int auto_increment NOT NULL,
project_id int NOT NULL,
step_text TEXT NOT NULL,
step_order int NOT NULL,
foreign key(project_id) references project(project_id) on delete cascade,
primary key(step_id)
);


CREATE TABLE category (
category_id int AUTO_INCREMENT NOT NULL,
category_name varchar(128) NOT NULL,
primary key (category_id) 
);


CREATE TABLE project_category (
project_id int NOT NULL,
category_id int NOT NULL,
foreign key(project_id) references project(project_id) on delete cascade,
foreign key(category_id) references category(category_id) on delete cascade,
unique key(project_id, category_id)
);
