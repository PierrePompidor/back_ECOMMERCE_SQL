USE ECOMMERCE;

CREATE TABLE IF NOT EXISTS user (
  email varchar(100) PRIMARY KEY NOT NULL,
  password varchar(60) NOT NULL,
  nom varchar(100) NOT NULL,
  prénom varchar(100) NOT NULL,
  civilité ENUM('Madame', 'Monsieur', '') DEFAULT '',
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS article (
  ref int(11) PRIMARY KEY NOT NULL AUTO_INCREMENT,
  nom varchar(100) NOT NULL,
  marque varchar(100) NOT NULL,
  prix decimal(10,2) NOT NULL,
  descr varchar(255) NOT NULL,
  rayon varchar(30) NOT NULL,
  detail text,
  stock int(4)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS rayon (
  nom varchar(30) PRIMARY KEY NOT NULL,
  parent varchar(30) NOT NULL DEFAULT '/'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT IGNORE INTO rayon (nom, parent) VALUES
('/', '/'),
('Téléphonie', '/'),
('Informatique', '/'),
('Mobiles', 'Téléphonie'),
('PC portables', 'Informatique'),
('Tablettes', 'Informatique');

ALTER TABLE article ADD CONSTRAINT FK_rayon_dans_article FOREIGN KEY (rayon) REFERENCES rayon(nom);

ALTER TABLE rayon ADD CONSTRAINT FK_nom_dans_rayon FOREIGN KEY (parent) REFERENCES rayon(nom);

COMMIT;
