DROP DATABASE SpotifyClone;
CREATE DATABASE SpotifyClone;
USE SpotifyClone;
-- Tabela de Artistas
CREATE TABLE Artistas (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    genero VARCHAR(50)
);

-- Tabela de Álbuns
CREATE TABLE Albuns (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    ano_lancamento YEAR
);

-- Tabela de Músicas
CREATE TABLE Musicas (
    id INT PRIMARY KEY AUTO_INCREMENT,
    titulo VARCHAR(150) NOT NULL,
    duracao TIME,
    id_artista INT,
    id_album INT,
    FOREIGN KEY (id_artista) REFERENCES Artistas(id) ON DELETE CASCADE,
    FOREIGN KEY (id_album) REFERENCES Albuns(id) ON DELETE CASCADE
);

-- Tabela de Usuários
CREATE TABLE Usuarios (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    data_nascimento DATE,
    plano ENUM('Grátis', 'Premium') NOT NULL
);

-- Tabela de Playlists (Relacionamento 1:N entre Usuários e Playlists)
CREATE TABLE Playlists (
    id INT PRIMARY KEY AUTO_INCREMENT,
    id_usuario INT,
    nome VARCHAR(100),
    FOREIGN KEY (id_usuario) REFERENCES Usuarios(id) ON DELETE CASCADE
);

-- Tabela de relacionamento N:N entre Playlists e Musicas
CREATE TABLE Playlist_Musicas (
    id_playlist INT,
    id_musica INT,
    PRIMARY KEY (id_playlist, id_musica),
    FOREIGN KEY (id_playlist) REFERENCES Playlists(id) ON DELETE CASCADE,
    FOREIGN KEY (id_musica) REFERENCES Musicas(id) ON DELETE CASCADE
);


INSERT INTO Artistas (nome, genero) VALUES ('Beyoncé', 'Pop, R&B');
INSERT INTO Artistas (nome, genero) VALUES ('The Weeknd', 'R&B, Pop');
INSERT INTO Artistas (nome, genero) VALUES ('Adele', 'Pop, Soul');
INSERT INTO Artistas (nome, genero) VALUES ('Ed Sheeran', 'Pop, Folk');
INSERT INTO Artistas (nome, genero) VALUES ('Taylor Swift', 'Pop, Country');
INSERT INTO Artistas (nome, genero) VALUES ('Drake', 'Rap, Hip-Hop');
INSERT INTO Artistas (nome, genero) VALUES ('Coldplay', 'Rock Alternativo');
INSERT INTO Artistas (nome, genero) VALUES ('Imagine Dragons', 'Rock Alternativo');
INSERT INTO Artistas (nome, genero) VALUES ('Bruno Mars', 'Pop, R&B');
INSERT INTO Artistas (nome, genero) VALUES ('Dua Lipa', 'Pop, Disco');

INSERT INTO Artistas (nome, genero) VALUES ('Anitta', 'Pop, Funk');
INSERT INTO Artistas (nome, genero) VALUES ('Ludmilla', 'Funk, R&B');
INSERT INTO Artistas (nome, genero) VALUES ('Gusttavo Lima', 'Sertanejo');
INSERT INTO Artistas (nome, genero) VALUES ('Marília Mendonça', 'Sertanejo');
INSERT INTO Artistas (nome, genero) VALUES ('Jorge & Mateus', 'Sertanejo');
INSERT INTO Artistas (nome, genero) VALUES ('Alok', 'Eletrônica');
INSERT INTO Artistas (nome, genero) VALUES ('Luísa Sonza', 'Pop');
INSERT INTO Artistas (nome, genero) VALUES ('Felipe Ret', 'Rap, Trap');
INSERT INTO Artistas (nome, genero) VALUES ('Zé Neto & Cristiano', 'Sertanejo');
INSERT INTO Artistas (nome, genero) VALUES ('Djavan', 'MPB');


INSERT INTO Usuarios (nome, email, data_nascimento, plano) VALUES ('João Silva', 'joao.silva@email.com', '1995-04-10', 'Premium');
INSERT INTO Usuarios (nome, email, data_nascimento, plano) VALUES ('Maria Oliveira', 'maria.oliveira@email.com', '1998-07-22', 'Grátis');
INSERT INTO Usuarios (nome, email, data_nascimento, plano) VALUES ('Carlos Souza', 'carlos.souza@email.com', '1989-11-03', 'Premium');
INSERT INTO Usuarios (nome, email, data_nascimento, plano) VALUES ('Ana Pereira', 'ana.pereira@email.com', '2000-02-15', 'Grátis');
INSERT INTO Usuarios (nome, email, data_nascimento, plano) VALUES ('Pedro Lima', 'pedro.lima@email.com', '1992-09-05', 'Premium');
INSERT INTO Usuarios (nome, email, data_nascimento, plano) VALUES ('Fernanda Costa', 'fernanda.costa@email.com', '1997-12-30', 'Grátis');
INSERT INTO Usuarios (nome, email, data_nascimento, plano) VALUES ('Lucas Almeida', 'lucas.almeida@email.com', '2001-05-14', 'Premium');
INSERT INTO Usuarios (nome, email, data_nascimento, plano) VALUES ('Juliana Ramos', 'juliana.ramos@email.com', '1993-08-27', 'Grátis');
INSERT INTO Usuarios (nome, email, data_nascimento, plano) VALUES ('Ricardo Barbosa', 'ricardo.barbosa@email.com', '1987-03-21', 'Premium');
INSERT INTO Usuarios (nome, email, data_nascimento, plano) VALUES ('Patrícia Mendes', 'patricia.mendes@email.com', '1996-06-09', 'Grátis');

INSERT INTO Usuarios (nome, email, data_nascimento, plano) VALUES ('Gabriel Fernandes', 'gabriel.fernandes@email.com', '1999-01-18', 'Premium');
INSERT INTO Usuarios (nome, email, data_nascimento, plano) VALUES ('Beatriz Nogueira', 'beatriz.nogueira@email.com', '1994-10-12', 'Grátis');
INSERT INTO Usuarios (nome, email, data_nascimento, plano) VALUES ('Thiago Rocha', 'thiago.rocha@email.com', '2002-07-07', 'Premium');
INSERT INTO Usuarios (nome, email, data_nascimento, plano) VALUES ('Larissa Martins', 'larissa.martins@email.com', '1991-02-25', 'Grátis');
INSERT INTO Usuarios (nome, email, data_nascimento, plano) VALUES ('André Santos', 'andre.santos@email.com', '1985-09-29', 'Premium');
INSERT INTO Usuarios (nome, email, data_nascimento, plano) VALUES ('Sabrina Farias', 'sabrina.farias@email.com', '1998-05-20', 'Grátis');
INSERT INTO Usuarios (nome, email, data_nascimento, plano) VALUES ('Vinícius Moreira', 'vinicius.moreira@email.com', '2003-11-17', 'Premium');
INSERT INTO Usuarios (nome, email, data_nascimento, plano) VALUES ('Camila Xavier', 'camila.xavier@email.com', '1990-12-03', 'Grátis');
INSERT INTO Usuarios (nome, email, data_nascimento, plano) VALUES ('Felipe Araújo', 'felipe.araujo@email.com', '1997-08-15', 'Premium');
INSERT INTO Usuarios (nome, email, data_nascimento, plano) VALUES ('Carolina Lima', 'carolina.lima@email.com', '2001-06-23', 'Grátis');

INSERT INTO Usuarios (nome, email, data_nascimento, plano) VALUES ('Rafael Castro', 'rafael.castro@email.com', '1993-04-04', 'Premium');
INSERT INTO Usuarios (nome, email, data_nascimento, plano) VALUES ('Isabela Rezende', 'isabela.rezende@email.com', '1989-09-11', 'Grátis');
INSERT INTO Usuarios (nome, email, data_nascimento, plano) VALUES ('Otávio Mendes', 'otavio.mendes@email.com', '2000-01-30', 'Premium');
INSERT INTO Usuarios (nome, email, data_nascimento, plano) VALUES ('Letícia Barros', 'leticia.barros@email.com', '1995-07-14', 'Grátis');
INSERT INTO Usuarios (nome, email, data_nascimento, plano) VALUES ('Diego Guimarães', 'diego.guimaraes@email.com', '1988-10-08', 'Premium');
INSERT INTO Usuarios (nome, email, data_nascimento, plano) VALUES ('Natália Cardoso', 'natalia.cardoso@email.com', '2004-03-06', 'Grátis');
INSERT INTO Usuarios (nome, email, data_nascimento, plano) VALUES ('Fernando Lopes', 'fernando.lopes@email.com', '1992-12-19', 'Premium');
INSERT INTO Usuarios (nome, email, data_nascimento, plano) VALUES ('Tatiane Borges', 'tatiane.borges@email.com', '1996-05-27', 'Grátis');
INSERT INTO Usuarios (nome, email, data_nascimento, plano) VALUES ('Eduardo Vasconcelos', 'eduardo.vasconcelos@email.com', '1990-11-25', 'Premium');
INSERT INTO Usuarios (nome, email, data_nascimento, plano) VALUES ('Lorena Silveira', 'lorena.silveira@email.com', '2002-08-31', 'Grátis');

INSERT INTO Usuarios (nome, email, data_nascimento, plano) VALUES ('Marcelo Teixeira', 'marcelo.teixeira@email.com', '1986-06-14', 'Premium');
INSERT INTO Usuarios (nome, email, data_nascimento, plano) VALUES ('Daniele Brito', 'daniele.brito@email.com', '1999-02-09', 'Grátis');
INSERT INTO Usuarios (nome, email, data_nascimento, plano) VALUES ('Rodrigo Amaral', 'rodrigo.amaral@email.com', '1994-07-22', 'Premium');
INSERT INTO Usuarios (nome, email, data_nascimento, plano) VALUES ('Juliana Prado', 'juliana.prado@email.com', '1991-01-05', 'Grátis');
INSERT INTO Usuarios (nome, email, data_nascimento, plano) VALUES ('Alexandre Ribeiro', 'alexandre.ribeiro@email.com', '1987-04-28', 'Premium');
INSERT INTO Usuarios (nome, email, data_nascimento, plano) VALUES ('Cristina Medeiros', 'cristina.medeiros@email.com', '2003-10-17', 'Grátis');
INSERT INTO Usuarios (nome, email, data_nascimento, plano) VALUES ('Matheus Freitas', 'matheus.freitas@email.com', '2000-12-07', 'Premium');
INSERT INTO Usuarios (nome, email, data_nascimento, plano) VALUES ('Vanessa Costa', 'vanessa.costa@email.com', '1995-03-29', 'Grátis');
INSERT INTO Usuarios (nome, email, data_nascimento, plano) VALUES ('Leonardo Pacheco', 'leonardo.pacheco@email.com', '1989-05-25', 'Premium');
INSERT INTO Usuarios (nome, email, data_nascimento, plano) VALUES ('Monique Antunes', 'monique.antunes@email.com', '1998-09-13', 'Grátis');


INSERT INTO Albuns (nome, ano_lancamento) VALUES 
('Dangerously in Love', 2003),  
('B’Day', 2006),  
('I Am... Sasha Fierce', 2008),  
('4', 2011),  
('Lemonade', 2016),  

('After Hours', 2020),  
('Dawn FM', 2022),  

('19', 2008),  
('21', 2011),  
('25', 2015),  
('30', 2021),  

('Plus', 2011),  
('Multiply', 2014),  
('Divide', 2017),  
('Equals', 2021),  

('Fearless', 2008),  
('Red', 2012),  
('1989', 2014),  
('Reputation', 2017),  
('Midnights', 2022),  

('Take Care', 2011),  
('Nothing Was the Same', 2013),  
('Views', 2016),  
('Scorpion', 2018),  

('Parachutes', 2000),  
('A Rush of Blood to the Head', 2002),  
('X&Y', 2005),  
('Viva la Vida', 2008),  
('Music of the Spheres', 2021),  

('Night Visions', 2012),  
('Smoke + Mirrors', 2015),  
('Evolve', 2017),  
('Mercury – Act 1', 2021),  

('Doo-Wops & Hooligans', 2010),  
('Unorthodox Jukebox', 2012),  
('24K Magic', 2016),  

('Dua Lipa', 2017),  
('Future Nostalgia', 2020),  

('Bang', 2021),  

('Numanice', 2020),  
('Numanice 2', 2022),  

('O Embaixador', 2018),  

('Todos os Cantos', 2019),  

('Terra Sem CEP', 2018),  

('Controversia', 2020),  

('Doce 22', 2021),  

('Imaterial', 2022),  

('Esquece o Mundo Lá Fora', 2018),  

('Álibi', 1978);



-- Beyoncé - Dangerously in Love
INSERT INTO Musicas (titulo, duracao, id_artista, id_album) VALUES
('Crazy in Love', '03:56', 1, 1),
('Baby Boy', '04:05', 1, 1),
('Naughty Girl', '03:29', 1, 1),
('Me, Myself and I', '05:01', 1, 1),
('Dangerously in Love 2', '04:53', 1, 1);

-- Beyoncé - B’Day
INSERT INTO Musicas (titulo, duracao, id_artista, id_album) VALUES
('Déjà Vu', '04:00', 1, 2),
('Irreplaceable', '03:47', 1, 2),
('Beautiful Liar', '03:20', 1, 2),
('Green Light', '03:30', 1, 2),
('Upgrade U', '04:33', 1, 2);

-- Beyoncé - I Am... Sasha Fierce
INSERT INTO Musicas (titulo, duracao, id_artista, id_album) VALUES
('Single Ladies (Put a Ring on It)', '03:13', 1, 3),
('Halo', '04:21', 1, 3),
('If I Were a Boy', '04:09', 1, 3),
('Diva', '03:20', 1, 3),
('Sweet Dreams', '03:28', 1, 3);

-- Beyoncé - 4
INSERT INTO Musicas (titulo, duracao, id_artista, id_album) VALUES
('Run the World (Girls)', '03:56', 1, 4),
('Best Thing I Never Had', '04:13', 1, 4),
('Love on Top', '04:27', 1, 4),
('Countdown', '03:33', 1, 4),
('End of Time', '03:44', 1, 4);

-- Beyoncé - Lemonade
INSERT INTO Musicas (titulo, duracao, id_artista, id_album) VALUES
('Formation', '03:26', 1, 5),
('Sorry', '03:52', 1, 5),
('Hold Up', '03:41', 1, 5),
('Freedom', '04:50', 1, 5),
('All Night', '05:22', 1, 5);

-- The Weeknd - After Hours
INSERT INTO Musicas (titulo, duracao, id_artista, id_album) VALUES
('Blinding Lights', '03:20', 2, 6),
('Save Your Tears', '03:35', 2, 6),
('Heartless', '03:18', 2, 6),
('In Your Eyes', '03:57', 2, 6),
('After Hours', '06:01', 2, 6);

-- The Weeknd - Dawn FM
INSERT INTO Musicas (titulo, duracao, id_artista, id_album) VALUES
('Take My Breath', '03:40', 2, 7),
('Sacrifice', '03:09', 2, 7),
('Out of Time', '03:34', 2, 7),
('Gasoline', '03:32', 2, 7),
('Is There Someone Else?', '03:19', 2, 7);

-- Adele - 19
INSERT INTO Musicas (titulo, duracao, id_artista, id_album) VALUES
('Chasing Pavements', '03:30', 3, 8),
('Hometown Glory', '04:31', 3, 8),
('Cold Shoulder', '03:11', 3, 8),
('Make You Feel My Love', '03:32', 3, 8),
('Right as Rain', '03:17', 3, 8);

-- Adele - 21
INSERT INTO Musicas (titulo, duracao, id_artista, id_album) VALUES
('Rolling in the Deep', '03:49', 3, 9),
('Someone Like You', '04:45', 3, 9),
('Set Fire to the Rain', '04:02', 3, 9),
('Rumour Has It', '03:32', 3, 9),
('Turning Tables', '04:10', 3, 9);

-- Adele - 25
INSERT INTO Musicas (titulo, duracao, id_artista, id_album) VALUES
('Hello', '04:55', 3, 10),
('Send My Love (To Your New Lover)', '03:43', 3, 10),
('When We Were Young', '04:50', 3, 10),
('Water Under the Bridge', '04:00', 3, 10),
('Million Years Ago', '03:47', 3, 10);

-- Adele - 30
INSERT INTO Musicas (titulo, duracao, id_artista, id_album) VALUES
('Easy on Me', '03:44', 3, 11),
('Oh My God', '03:45', 3, 11),
('I Drink Wine', '06:16', 3, 11),
('Can I Get It', '03:30', 3, 11),
('To Be Loved', '06:43', 3, 11);

-- Ed Sheeran - +
INSERT INTO Musicas (titulo, duracao, id_artista, id_album) VALUES
('The A Team', '04:18', 4, 12),
('Lego House', '03:05', 4, 12),
('Drunk', '03:20', 4, 12),
('Small Bump', '04:19', 4, 12),
('Give Me Love', '08:46', 4, 12);

-- Ed Sheeran - x
INSERT INTO Musicas (titulo, duracao, id_artista, id_album) VALUES
('Sing', '03:55', 4, 13),
('Don\'t', '03:39', 4, 13),
('Thinking Out Loud', '04:41', 4, 13),
('Photograph', '04:18', 4, 13),
('Bloodstream', '05:00', 4, 13);

-- Ed Sheeran - ÷
INSERT INTO Musicas (titulo, duracao, id_artista, id_album) VALUES
('Shape of You', '03:53', 4, 14),
('Castle on the Hill', '04:21', 4, 14),
('Galway Girl', '02:50', 4, 14),
('Perfect', '04:23', 4, 14),
('Happier', '03:27', 4, 14);

-- Ed Sheeran - Equals (=)
INSERT INTO Musicas (titulo, duracao, id_artista, id_album) VALUES
('Bad Habits', '03:50', 4, 15),
('Shivers', '03:27', 4, 15),
('Overpass Graffiti', '03:56', 4, 15),
('Visiting Hours', '03:35', 4, 15),
('Tides', '03:16', 4, 15);

-- Taylor Swift - Fearless
INSERT INTO Musicas (titulo, duracao, id_artista, id_album) VALUES
('Love Story', '03:55', 5, 16),
('You Belong with Me', '03:51', 5, 16),
('Fifteen', '04:54', 5, 16),
('White Horse', '03:54', 5, 16),
('Fearless', '04:01', 5, 16);

-- Taylor Swift - Red
INSERT INTO Musicas (titulo, duracao, id_artista, id_album) VALUES
('Red', '03:43', 5, 17),
('I Knew You Were Trouble', '03:39', 5, 17),
('We Are Never Ever Getting Back Together', '03:13', 5, 17),
('22', '03:52', 5, 17),
('Begin Again', '03:58', 5, 17);

-- Taylor Swift - 1989
INSERT INTO Musicas (titulo, duracao, id_artista, id_album) VALUES
('Shake It Off', '03:39', 5, 18),
('Blank Space', '03:51', 5, 18),
('Style', '03:51', 5, 18),
('Bad Blood', '03:31', 5, 18),
('Wildest Dreams', '03:40', 5, 18);

-- Taylor Swift - Reputation
INSERT INTO Musicas (titulo, duracao, id_artista, id_album) VALUES
('Look What You Made Me Do', '03:31', 5, 19),
('...Ready for It?', '03:28', 5, 19),
('Delicate', '03:52', 5, 19),
('Gorgeous', '03:29', 5, 19),
('End Game', '04:04', 5, 19);

-- Taylor Swift - Midnights
INSERT INTO Musicas (titulo, duracao, id_artista, id_album) VALUES
('Anti-Hero', '03:21', 5, 20),
('Lavender Haze', '03:22', 5, 20),
('Maroon', '03:38', 5, 20),
('Snow on the Beach', '04:16', 5, 20),
('Midnight Rain', '02:54', 5, 20);

-- Drake - Take Care
INSERT INTO Musicas (titulo, duracao, id_artista, id_album) VALUES
('Headlines', '03:56', 6, 21),
('Take Care', '04:37', 6, 21),
('Marvins Room', '05:47', 6, 21),
('The Motto', '03:01', 6, 21),
('HYFR (Hell Ya Fucking Right)', '03:27', 6, 21);

-- Drake - Nothing Was the Same
INSERT INTO Musicas (titulo, duracao, id_artista, id_album) VALUES
('Started from the Bottom', '02:53', 6, 22),
('Hold On, We’re Going Home', '03:47', 6, 22),
('Worst Behavior', '04:30', 6, 22),
('From Time', '05:22', 6, 22),
('Too Much', '04:21', 6, 22);

-- Drake - Views
INSERT INTO Musicas (titulo, duracao, id_artista, id_album) VALUES
('Hotline Bling', '04:27', 6, 23),
('One Dance', '02:54', 6, 23),
('Controlla', '04:05', 6, 23),
('Too Good', '04:23', 6, 23),
('Pop Style', '03:32', 6, 23);

-- Drake - Scorpion
INSERT INTO Musicas (titulo, duracao, id_artista, id_album) VALUES
('God’s Plan', '03:18', 6, 24),
('In My Feelings', '03:37', 6, 24),
('Nice for What', '03:30', 6, 24),
('Nonstop', '03:58', 6, 24),
('Emotionless', '05:02', 6, 24);

-- Coldplay - Parachutes
INSERT INTO Musicas (titulo, duracao, id_artista, id_album) VALUES
('Yellow', '04:29', 7, 25),
('Shiver', '05:04', 7, 25),
('Trouble', '04:30', 7, 25),
('Don’t Panic', '02:17', 7, 25),
('Sparks', '03:47', 7, 25);

-- Coldplay - A Rush of Blood to the Head
INSERT INTO Musicas (titulo, duracao, id_artista, id_album) VALUES
('Clocks', '05:07', 7, 26),
('The Scientist', '05:09', 7, 26),
('In My Place', '03:48', 7, 26),
('God Put a Smile upon Your Face', '04:57', 7, 26),
('Amsterdam', '05:19', 7, 26);

-- Coldplay - X&Y
INSERT INTO Musicas (titulo, duracao, id_artista, id_album) VALUES
('Fix You', '04:55', 7, 27),
('Talk', '05:11', 7, 27),
('Speed of Sound', '04:48', 7, 27),
('White Shadows', '05:28', 7, 27),
('A Message', '04:45', 7, 27);

-- Coldplay - Viva la Vida or Death and All His Friends
INSERT INTO Musicas (titulo, duracao, id_artista, id_album) VALUES
('Viva la Vida', '04:02', 7, 28),
('Lost!', '03:55', 7, 28),
('Lovers in Japan', '06:51', 7, 28),
('42', '03:57', 7, 28),
('Strawberry Swing', '04:09', 7, 28),
('Life in Technicolor', '02:29', 7, 28),
('Cemeteries of London', '03:21', 7, 28),
('Yes', '07:06', 7, 28),
('Violet Hill', '03:42', 7, 28),
('Death and All His Friends', '06:18', 7, 28);

-- Coldplay - Music of the Spheres
INSERT INTO Musicas (titulo, duracao, id_artista, id_album) VALUES
('Higher Power', '03:31', 7, 29),
('Humankind', '04:26', 7, 29),
('Let Somebody Go', '04:01', 7, 29),
('My Universe', '03:46', 7, 29),
('Coloratura', '10:18', 7, 29);

-- Imagine Dragons - Night Visions
INSERT INTO Musicas (titulo, duracao, id_artista, id_album) VALUES
('Radioactive', '03:06', 8, 30),
('Demons', '02:57', 8, 30),
('It\'s Time', '04:00', 8, 30),
('On Top of the World', '03:12', 8, 30),
('Amsterdam', '04:01', 8, 30);

-- Imagine Dragons - Smoke + Mirrors
INSERT INTO Musicas (titulo, duracao, id_artista, id_album) VALUES
('Shots', '03:52', 8, 31),
('Gold', '03:36', 8, 31),
('I Bet My Life', '03:14', 8, 31),
('Polaroid', '03:51', 8, 31),
('Friction', '03:21', 8, 31);

-- Imagine Dragons - Evolve
INSERT INTO Musicas (titulo, duracao, id_artista, id_album) VALUES
('Believer', '03:24', 8, 32),
('Thunder', '03:07', 8, 32),
('Whatever It Takes', '03:21', 8, 32),
('Walking the Wire', '03:52', 8, 32),
('Rise Up', '03:51', 8, 32);

-- Imagine Dragons - Mercury – Act 1
INSERT INTO Musicas (titulo, duracao, id_artista, id_album) VALUES
('Wrecked', '04:04', 8, 33),
('Follow You', '02:55', 8, 33),
('Cutthroat', '02:49', 8, 33),
('Lonely', '02:32', 8, 33),
('Monday', '03:08', 8, 33);

-- Bruno Mars - Doo-Wops & Hooligans
INSERT INTO Musicas (titulo, duracao, id_artista, id_album) VALUES
('Just the Way You Are', '03:40', 9, 34),
('Grenade', '03:42', 9, 34),
('The Lazy Song', '03:09', 9, 34),
('Marry You', '03:50', 9, 34),
('Count on Me', '03:17', 9, 34);

-- Bruno Mars - Unorthodox Jukebox
INSERT INTO Musicas (titulo, duracao, id_artista, id_album) VALUES
('Locked Out of Heaven', '03:53', 9, 35),
('When I Was Your Man', '03:33', 9, 35),
('Treasure', '02:58', 9, 35),
('Gorilla', '04:04', 9, 35),
('Young Girls', '03:49', 9, 35);

-- Bruno Mars - 24K Magic
INSERT INTO Musicas (titulo, duracao, id_artista, id_album) VALUES
('24K Magic', '03:45', 9, 36),
('That’s What I Like', '03:26', 9, 36),
('Versace on the Floor', '04:21', 9, 36),
('Finesse', '03:11', 9, 36),
('Chunky', '03:07', 9, 36);

-- Dua Lipa - Dua Lipa
INSERT INTO Musicas (titulo, duracao, id_artista, id_album) VALUES
('New Rules', '03:29', 10, 37),
('IDGAF', '03:38', 10, 37),
('Be the One', '03:25', 10, 37),
('Hotter than Hell', '03:07', 10, 37),
('Blow Your Mind (Mwah)', '02:58', 10, 37);

-- Dua Lipa - Future Nostalgia
INSERT INTO Musicas (titulo, duracao, id_artista, id_album) VALUES
('Don’t Start Now', '03:03', 10, 38),
('Levitating', '03:23', 10, 38),
('Physical', '03:13', 10, 38),
('Break My Heart', '03:41', 10, 38),
('Hallucinate', '03:28', 10, 38);

-- Anitta - Bang
INSERT INTO Musicas (titulo, duracao, id_artista, id_album) VALUES
('Bang', '02:50', 11, 39),
('Essa Mina É Louca', '02:55', 11, 39),
('Cravo e Canela', '03:08', 11, 39),
('Deixa Ele Sofrer', '02:45', 11, 39),
('Show das Poderosas', '02:30', 11, 39);

-- Ludmilla - Numanice
INSERT INTO Musicas (titulo, duracao, id_artista, id_album) VALUES
('Amor Difícil', '03:15', 12, 40),
('Te Amar Demais', '03:20', 12, 40),
('Não É Por Maldade', '03:25', 12, 40),
('Cheiro Bom do Seu Cabelo', '03:10', 12, 40),
('Amor Difícil', '03:15', 12, 40);

-- Ludmilla - Numanice 2
INSERT INTO Musicas (titulo, duracao, id_artista, id_album) VALUES
('Maldivas', '02:58', 12, 41),
('212', '03:05', 12, 41),
('Socadona', '03:12', 12, 41),
('Pra Te Machucar', '03:18', 12, 41),
('Gato Siamês', '03:22', 12, 41);

-- Gusttavo Lima - O Embaixador
-- Zé da Recaída - Marília Mendonça
INSERT INTO Musicas (titulo, duracao, id_artista, id_album) VALUES
('Zé da Recaída', '03:10', 13, 42),
('Cem Mil', '03:20', 13, 42),
('Milu', '03:05', 13, 42),
('Apelido Carinhoso', '03:15', 13, 42),
('Homem de Família', '03:30', 13, 42);

-- Marília Mendonça - Todos os Cantos
INSERT INTO Musicas (titulo, duracao, id_artista, id_album) VALUES
('Ciumeira', '03:20', 14, 43),
('Todo Mundo Vai Sofrer', '03:10', 14, 43),
('Supera', '03:30', 14, 43),
('Graveto', '03:40', 14, 43),
('Bebi Liguei', '03:15', 14, 43);

-- Jorge & Mateus - Terra Sem CEP
INSERT INTO Musicas (titulo, duracao, id_artista, id_album) VALUES
('Propaganda', '03:15', 15, 44),
('Terra Sem CEP', '03:25', 15, 44),
('Trincadinho', '03:05', 15, 44),
('Olhares Sinceros', '03:35', 15, 44),
('Amor Turista', '03:20', 15, 44);

-- Alok - Controversia
INSERT INTO Musicas (titulo, duracao, id_artista, id_album) VALUES
('Hear Me Now', '03:12', 16, 45),
('Never Let Me Go', '03:30', 16, 45),
('Big Jet Plane', '03:15', 16, 45),
('Fuego', '03:25', 16, 45),
('Ocean', '03:40', 16, 45);

-- Luísa Sonza - Doce 22
INSERT INTO Musicas (titulo, duracao, id_artista, id_album) VALUES
('BRABA', '02:40', 17, 46),
('VIP *-*', '03:00', 17, 46),
('INTERE$$EIRA', '02:50', 17, 46),
('penhasco.', '03:10', 17, 46),
('MODO TURBO', '03:20', 17, 46);

-- Felipe Ret - Imaterial
INSERT INTO Musicas (titulo, duracao, id_artista, id_album) VALUES
('Corte Americano', '03:05', 18, 47),
('War', '03:15', 18, 47),
('Me Sinto Abençoado', '03:22', 18, 47),
('Ilusão', '03:30', 18, 47),
('F*F*M*', '03:10', 18, 47);

-- Zé Neto & Cristiano - Esquece o Mundo Lá Fora
INSERT INTO Musicas (titulo, duracao, id_artista, id_album) VALUES
('Largado às Traças', '03:00', 19, 48),
('Notificação Preferida', '03:20', 19, 48),
('Bebida na Ferida', '03:10', 19, 48),
('Status Que Eu Não Queria', '03:15', 19, 48),
('Mulher Maravilha', '03:25', 19, 48);

-- Djavan - Álibi
INSERT INTO Musicas (titulo, duracao, id_artista, id_album) VALUES
('Oceano', '03:40', 20, 49),
('Se...', '03:30', 20, 49),
('Flor de Lis', '03:45', 20, 49),
('Samurai', '04:00', 20, 49),
('Lilás', '03:35', 20, 49);


-- 3 Playlists com 2 músicas:
-- Playlist 1: "Som do Vento" - Usuário 3 (2 músicas)
INSERT INTO Playlists (id_usuario, nome) VALUES (3, 'Som do Vento');
INSERT INTO Playlist_Musicas (id_playlist, id_musica) VALUES (1, 1), (1, 2);

-- Playlist 2: "Cores da Alma" - Usuário 7 (2 músicas)
INSERT INTO Playlists (id_usuario, nome) VALUES (7, 'Cores da Alma');
INSERT INTO Playlist_Musicas (id_playlist, id_musica) VALUES (2, 4), (2, 5);

-- Playlist 3: "Amor Infinito" - Usuário 15 (2 músicas)
INSERT INTO Playlists (id_usuario, nome) VALUES (15, 'Amor Infinito');
INSERT INTO Playlist_Musicas (id_playlist, id_musica) VALUES (3, 3), (3, 6);

-- 5 Playlists com 3 músicas:
-- Playlist 4: "Tarde de Sol" - Usuário 9 (3 músicas)
INSERT INTO Playlists (id_usuario, nome) VALUES (9, 'Tarde de Sol');
INSERT INTO Playlist_Musicas (id_playlist, id_musica) VALUES (4, 7), (4, 8), (4, 9);

-- Playlist 5: "Caminho da Liberdade" - Usuário 21 (3 músicas)
INSERT INTO Playlists (id_usuario, nome) VALUES (21, 'Caminho da Liberdade');
INSERT INTO Playlist_Musicas (id_playlist, id_musica) VALUES (5, 10), (5, 11), (5, 12);

-- Playlist 6: "Vibe Misturada" - Usuário 33 (3 músicas)
INSERT INTO Playlists (id_usuario, nome) VALUES (33, 'Vibe Misturada');
INSERT INTO Playlist_Musicas (id_playlist, id_musica) VALUES (6, 13), (6, 14), (6, 15);

-- Playlist 7: "Noites de Chuva" - Usuário 18 (3 músicas)
INSERT INTO Playlists (id_usuario, nome) VALUES (18, 'Noites de Chuva');
INSERT INTO Playlist_Musicas (id_playlist, id_musica) VALUES (7, 16), (7, 17), (7, 18);

-- Playlist 8: "Reflexões e Sons" - Usuário 26 (3 músicas)
INSERT INTO Playlists (id_usuario, nome) VALUES (26, 'Reflexões e Sons');
INSERT INTO Playlist_Musicas (id_playlist, id_musica) VALUES (8, 19), (8, 20), (8, 21);

-- 8 Playlists com 4 músicas:
-- Playlist 9: "Vibe do Amanhã" - Usuário 5 (4 músicas)
INSERT INTO Playlists (id_usuario, nome) VALUES (5, 'Vibe do Amanhã');
INSERT INTO Playlist_Musicas (id_playlist, id_musica) VALUES (9, 22), (9, 23), (9, 24), (9, 25);

-- Playlist 10: "Chill e Conforto" - Usuário 10 (4 músicas)
INSERT INTO Playlists (id_usuario, nome) VALUES (10, 'Chill e Conforto');
INSERT INTO Playlist_Musicas (id_playlist, id_musica) VALUES (10, 26), (10, 27), (10, 28), (10, 29);

-- Playlist 11: "Sons da Terra" - Usuário 12 (4 músicas)
INSERT INTO Playlists (id_usuario, nome) VALUES (12, 'Sons da Terra');
INSERT INTO Playlist_Musicas (id_playlist, id_musica) VALUES (11, 30), (11, 31), (11, 32), (11, 33);

-- Playlist 12: "Momento de Paz" - Usuário 4 (4 músicas)
INSERT INTO Playlists (id_usuario, nome) VALUES (4, 'Momento de Paz');
INSERT INTO Playlist_Musicas (id_playlist, id_musica) VALUES (12, 34), (12, 35), (12, 36), (12, 37);

-- Playlist 13: "Perdido nas Estrelas" - Usuário 8 (4 músicas)
INSERT INTO Playlists (id_usuario, nome) VALUES (8, 'Perdido nas Estrelas');
INSERT INTO Playlist_Musicas (id_playlist, id_musica) VALUES (13, 38), (13, 39), (13, 40), (13, 41);

-- Playlist 14: "Noite Caótica" - Usuário 11 (4 músicas)
INSERT INTO Playlists (id_usuario, nome) VALUES (11, 'Noite Caótica');
INSERT INTO Playlist_Musicas (id_playlist, id_musica) VALUES (14, 42), (14, 43), (14, 44), (14, 45);

-- Playlist 15: "Caminhos da Vida" - Usuário 22 (4 músicas)
INSERT INTO Playlists (id_usuario, nome) VALUES (22, 'Caminhos da Vida');
INSERT INTO Playlist_Musicas (id_playlist, id_musica) VALUES (15, 46), (15, 47), (15, 48), (15, 49);

-- Playlist 16: "Gira o Mundo" - Usuário 14 (4 músicas)
INSERT INTO Playlists (id_usuario, nome) VALUES (14, 'Gira o Mundo');
INSERT INTO Playlist_Musicas (id_playlist, id_musica) VALUES (16, 50), (16, 51), (16, 52), (16, 53);

-- 2 Playlists com 5 músicas:
-- Playlist 17: "Doce Melodia" - Usuário 17 (5 músicas)
INSERT INTO Playlists (id_usuario, nome) VALUES (17, 'Doce Melodia');
INSERT INTO Playlist_Musicas (id_playlist, id_musica) VALUES (17, 54), (17, 55), (17, 56), (17, 57), (17, 58);

-- Playlist 18: "Toque da Magia" - Usuário 19 (5 músicas)
INSERT INTO Playlists (id_usuario, nome) VALUES (19, 'Toque da Magia');
INSERT INTO Playlist_Musicas (id_playlist, id_musica) VALUES (18, 59), (18, 60), (18, 61), (18, 62), (18, 63);

-- 1 Playlist com 6 músicas:
-- Playlist 19: "Vibe Contagiante" - Usuário 30 (6 músicas)
INSERT INTO Playlists (id_usuario, nome) VALUES (30, 'Vibe Contagiante');
INSERT INTO Playlist_Musicas (id_playlist, id_musica) VALUES (19, 64), (19, 65), (19, 66), (19, 67), (19, 68), (19, 69);

-- 2 Playlists com 7 músicas:
-- Playlist 20: "Fim de Tarde" - Usuário 35 (7 músicas)
INSERT INTO Playlists (id_usuario, nome) VALUES (35, 'Fim de Tarde');
INSERT INTO Playlist_Musicas (id_playlist, id_musica) VALUES (20, 70), (20, 71), (20, 72), (20, 73), (20, 74), (20, 75), (20, 76);

-- Playlist 21: "Ondas do Mar" - Usuário 40 (7 músicas)
INSERT INTO Playlists (id_usuario, nome) VALUES (40, 'Ondas do Mar');
INSERT INTO Playlist_Musicas (id_playlist, id_musica) VALUES (21, 77), (21, 78), (21, 79), (21, 80), (21, 81), (21, 82), (21, 83);

-- 8 Playlists com 8 músicas:
-- Playlist 22: "Luz da Lua" - Usuário 16 (8 músicas)
INSERT INTO Playlists (id_usuario, nome) VALUES (16, 'Luz da Lua');
INSERT INTO Playlist_Musicas (id_playlist, id_musica) VALUES (22, 84), (22, 85), (22, 86), (22, 87), (22, 88), (22, 89), (22, 90), (22, 91);

-- Playlist 23: "No Limite" - Usuário 20 (8 músicas)
INSERT INTO Playlists (id_usuario, nome) VALUES (20, 'No Limite');
INSERT INTO Playlist_Musicas (id_playlist, id_musica) VALUES (23, 92), (23, 93), (23, 94), (23, 95), (23, 96), (23, 97), (23, 98), (23, 99);

-- Playlist 24: "Mundo Paralelo" - Usuário 25 (8 músicas)
INSERT INTO Playlists (id_usuario, nome) VALUES (25, 'Mundo Paralelo');
INSERT INTO Playlist_Musicas (id_playlist, id_musica) VALUES (24, 100), (24, 101), (24, 102), (24, 103), (24, 104), (24, 105), (24, 106), (24, 107);

-- Playlist 25: "Baila Comigo" - Usuário 32 (8 músicas)
INSERT INTO Playlists (id_usuario, nome) VALUES (32, 'Baila Comigo');
INSERT INTO Playlist_Musicas (id_playlist, id_musica) VALUES (25, 108), (25, 109), (25, 110), (25, 111), (25, 112), (25, 113), (25, 114), (25, 115);

-- Playlist 26: "Faz o Som" - Usuário 29 (8 músicas)
INSERT INTO Playlists (id_usuario, nome) VALUES (29, 'Faz o Som');
INSERT INTO Playlist_Musicas (id_playlist, id_musica) VALUES (26, 116), (26, 117), (26, 118), (26, 119), (26, 120), (26, 121), (26, 122), (26, 123);

-- Playlist 27: "Sons e Emoções" - Usuário 28 (8 músicas)
INSERT INTO Playlists (id_usuario, nome) VALUES (28, 'Sons e Emoções');
INSERT INTO Playlist_Musicas (id_playlist, id_musica) VALUES (27, 124), (27, 125), (27, 126), (27, 127), (27, 128), (27, 129), (27, 130), (27, 131);

-- Playlist 28: "Explosão de Sentimentos" - Usuário 36 (8 músicas)
INSERT INTO Playlists (id_usuario, nome) VALUES (36, 'Explosão de Sentimentos');
INSERT INTO Playlist_Musicas (id_playlist, id_musica) VALUES (28, 132), (28, 133), (28, 134), (28, 135), (28, 136), (28, 137), (28, 138), (28, 139);

-- Playlist 29: "Raízes e Ritmos" - Usuário 38 (8 músicas)
INSERT INTO Playlists (id_usuario, nome) VALUES (38, 'Raízes e Ritmos');
INSERT INTO Playlist_Musicas (id_playlist, id_musica) VALUES (29, 140), (29, 141), (29, 142), (29, 143), (29, 144), (29, 145), (29, 146), (29, 147);

-- 1 Playlist com 9 músicas:
-- Playlist 30: "Desafios da Vida" - Usuário 1 (9 músicas)
INSERT INTO Playlists (id_usuario, nome) VALUES (1, 'Desafios da Vida');
INSERT INTO Playlist_Musicas (id_playlist, id_musica) VALUES (30, 148), (30, 149), (30, 150), (30, 151), (30, 152), (30, 153), (30, 154), (30, 155), (30, 156);

-- 3 Playlists com 10 músicas:
-- Playlist 31: "No Ritmo da Vida" - Usuário 6 (10 músicas)
INSERT INTO Playlists (id_usuario, nome) VALUES (6, 'No Ritmo da Vida');
INSERT INTO Playlist_Musicas (id_playlist, id_musica) VALUES (31, 157), (31, 158), (31, 159), (31, 160), (31, 161), (31, 162), (31, 163), (31, 164), (31, 165), (31, 166);

-- Playlist 32: "Sons do Universo" - Usuário 2 (10 músicas)
INSERT INTO Playlists (id_usuario, nome) VALUES (2, 'Sons do Universo');
INSERT INTO Playlist_Musicas (id_playlist, id_musica) VALUES (32, 167), (32, 168), (32, 169), (32, 170), (32, 171), (32, 172), (32, 173), (32, 174), (32, 175), (32, 176);

-- Playlist 33: "Aventura Sonora" - Usuário 49 (10 músicas)
INSERT INTO Playlists (id_usuario, nome) VALUES (13, 'Aventura Sonora');
INSERT INTO Playlist_Musicas (id_playlist, id_musica) VALUES (33, 177), (33, 178), (33, 179), (33, 180), (33, 181), (33, 182), (33, 183), (33, 184), (33, 185), (33, 186);