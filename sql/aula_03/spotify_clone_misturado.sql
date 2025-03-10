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
('Dua Lipa', 2017),
('O Embaixador', 2018),
('Dawn FM', 2022),
('Equals', 2021),
('4', 2011),
('Mercury – Act 1', 2021),
('Numanice', 2020),
('25', 2015),
('Álibi', 1978),
('19', 2008),
('Viva la Vida', 2008),
('Music of the Spheres', 2021),
('1989', 2014),
('Dangerously in Love', 2003),
('Divide', 2017),
('Plus', 2011),
('24K Magic', 2016),
('Reputation', 2017),
('Bang', 2021),
('Smoke + Mirrors', 2015),
('X&Y', 2005),
('Lemonade', 2016),
('Multiply', 2014),
('Evolve', 2017),
('Controversia', 2020),
('Nothing Was the Same', 2013),
('Future Nostalgia', 2020),
('B’Day', 2006),
('Take Care', 2011),
('After Hours', 2020),
('30', 2021),
('Parachutes', 2000),
('Doce 22', 2021),
('Esquece o Mundo Lá Fora', 2018),
('Fearless', 2008),
('Numanice 2', 2022),
('21', 2011),
('Views', 2016),
('Todos os Cantos', 2019),
('Imaterial', 2022),
('Scorpion', 2018),
('A Rush of Blood to the Head', 2002),
('Terra Sem CEP', 2018),
('Unorthodox Jukebox', 2012),
('Red', 2012),
('I Am... Sasha Fierce', 2008),
('Midnights', 2022),
('Night Visions', 2012),
('Doo-Wops & Hooligans', 2010);

INSERT INTO Musicas (titulo, duracao, id_artista, id_album) VALUES
('Zé da Recaída', '03:10', 13, 2),
('Photograph', '04:18', 4, 23),
('Gorilla', '04:04', 9, 44),
('Samurai', '04:00', 20, 9),
('Shape of You', '03:53', 4, 15),
('Easy on Me', '03:44', 3, 31),
('I Bet My Life', '03:14', 8, 20),
('God Put a Smile upon Your Face', '04:57', 7, 42),
('Thinking Out Loud', '04:41', 4, 23),
('Controlla', '04:05', 6, 38),
('Make You Feel My Love', '03:32', 3, 10),
('Baby Boy', '04:05', 1, 14),
('Radioactive', '03:06', 8, 48),
('Beautiful Liar', '03:20', 1, 28),
('Marvins Room', '05:47', 6, 29),
('Pop Style', '03:32', 6, 38),
('penhasco.', '03:10', 17, 33),
('Shiver', '05:04', 7, 32),
('Gorgeous', '03:29', 5, 18),
('Worst Behavior', '04:30', 6, 26),
('Be the One', '03:25', 10, 1),
('Someone Like You', '04:45', 3, 37),
('Fuego', '03:25', 16, 25),
('Finesse', '03:11', 9, 17),
('Small Bump', '04:19', 4, 16),
('Gold', '03:36', 8, 20),
('That’s What I Like', '03:26', 9, 17),
('Lilás', '03:35', 20, 9),
('Propaganda', '03:15', 15, 43),
('The Motto', '03:01', 6, 29),
('Pra Te Machucar', '03:18', 12, 36),
('The Scientist', '05:09', 7, 42),
('Heartless', '03:18', 2, 30),
('When I Was Your Man', '03:33', 9, 44),
('Socadona', '03:12', 12, 36),
('Amor Difícil', '03:15', 12, 7),
('If I Were a Boy', '04:09', 1, 46),
('Crazy in Love', '03:56', 1, 14),
('Shivers', '03:27', 4, 4),
('Countdown', '03:33', 1, 5),
('Hotline Bling', '04:27', 6, 38),
('Show das Poderosas', '02:30', 11, 19),
('Bebida na Ferida', '03:10', 19, 34),
('Homem de Família', '03:30', 13, 2),
('Clocks', '05:07', 7, 42),
('Yellow', '04:29', 7, 32),
('Ocean', '03:40', 16, 25),
('22', '03:52', 5, 45),
('Best Thing I Never Had', '04:13', 1, 5),
('Friction', '03:21', 8, 20),
('Never Let Me Go', '03:30', 16, 25),
('Big Jet Plane', '03:15', 16, 25),
('Turning Tables', '04:10', 3, 37),
('INTERE$$EIRA', '02:50', 17, 33),
('Ciumeira', '03:20', 14, 39),
('Happier', '03:27', 4, 15),
('Amsterdam', '05:19', 7, 42),
('BRABA', '02:40', 17, 33),
('HYFR (Hell Ya Fucking Right)', '03:27', 6, 29),
('Marry You', '03:50', 9, 49),
('Rise Up', '03:51', 8, 24),
('Snow on the Beach', '04:16', 5, 47),
('Coloratura', '10:18', 7, 12),
('When We Were Young', '04:50', 3, 8),
('Green Light', '03:30', 1, 28),
('Anti-Hero', '03:21', 5, 47),
('Don’t Start Now', '03:03', 10, 27),
('Physical', '03:13', 10, 27),
('Too Much', '04:21', 6, 26),
('Fifteen', '04:54', 5, 35),
('Shots', '03:52', 8, 20),
('Shake It Off', '03:39', 5, 13),
('Delicate', '03:52', 5, 18),
('Déjà Vu', '04:00', 1, 28),
('Me, Myself and I', '05:01', 1, 14),
('Death and All His Friends', '06:18', 7, 11),
('You Belong with Me', '03:51', 5, 35),
('Chunky', '03:07', 9, 17),
('Rumour Has It', '03:32', 3, 37),
('Graveto', '03:40', 14, 39),
('Out of Time', '03:34', 2, 3),
('Sacrifice', '03:09', 2, 3),
('Take Care', '04:37', 6, 29),
('Can I Get It', '03:30', 3, 31),
('Castle on the Hill', '04:21', 4, 15),
('Levitating', '03:23', 10, 27),
('Cold Shoulder', '03:11', 3, 10),
('Violet Hill', '03:42', 7, 11),
('Polaroid', '03:51', 8, 20),
('Demons', '02:57', 8, 48),
('Monday', '03:08', 8, 6),
('Milu', '03:05', 13, 2),
('White Shadows', '05:28', 7, 21),
('Locked Out of Heaven', '03:53', 9, 44),
('Take My Breath', '03:40', 2, 3),
('Trouble', '04:30', 7, 32),
('Drunk', '03:20', 4, 16),
('Midnight Rain', '02:54', 5, 47),
('Viva la Vida', '04:02', 7, 11),
('End Game', '04:04', 5, 18),
('Visiting Hours', '03:35', 4, 4),
('Blow Your Mind (Mwah)', '02:58', 10, 1),
('Look What You Made Me Do', '03:31', 5, 18),
('Emotionless', '05:02', 6, 41),
('Apelido Carinhoso', '03:15', 13, 2),
('One Dance', '02:54', 6, 38),
('Thunder', '03:07', 8, 24),
('Save Your Tears', '03:35', 2, 30),
('Flor de Lis', '03:45', 20, 9),
('Versace on the Floor', '04:21', 9, 17),
('Hold On, We’re Going Home', '03:47', 6, 26),
('Whatever It Takes', '03:21', 8, 24),
('Corte Americano', '03:05', 18, 40),
('Lost!', '03:55', 7, 11),
('...Ready for It?', '03:28', 5, 18),
('Nice for What', '03:30', 6, 41),
('Sorry', '03:52', 1, 22),
('Largado às Traças', '03:00', 19, 34),
('Mulher Maravilha', '03:25', 19, 34),
('Lego House', '03:05', 4, 16),
('Fix You', '04:55', 7, 21),
('Strawberry Swing', '04:09', 7, 11),
('Trincadinho', '03:05', 15, 43),
('Galway Girl', '02:50', 4, 15),
('Started from the Bottom', '02:53', 6, 26),
('Walking the Wire', '03:52', 8, 24),
('Million Years Ago', '03:47', 3, 8),
('Give Me Love', '08:46', 4, 16),
('Oceano', '03:40', 20, 9),
('Begin Again', '03:58', 5, 45),
('Cravo e Canela', '03:08', 11, 19),
('Style', '03:51', 5, 13),
('Bad Blood', '03:31', 5, 13),
('Sing', '03:55', 4, 23),
('From Time', '05:22', 6, 26),
('IDGAF', '03:38', 10, 1),
('Maldivas', '02:58', 12, 36),
('Wrecked', '04:04', 8, 6),
('Halo', '04:21', 1, 46),
('Higher Power', '03:31', 7, 12),
('Break My Heart', '03:41', 10, 27),
('Speed of Sound', '04:48', 7, 21),
('Cutthroat', '02:49', 8, 6),
('Believer', '03:24', 8, 24),
('I Drink Wine', '06:16', 3, 31),
('Cemeteries of London', '03:21', 7, 11),
('Se...', '03:30', 20, 9),
('Gato Siamês', '03:22', 12, 36),
('Don’t Panic', '02:17', 7, 32),
('Rolling in the Deep', '03:49', 3, 37),
('Grenade', '03:42', 9, 49),
('My Universe', '03:46', 7, 12),
('Diva', '03:20', 1, 46),
('Todo Mundo Vai Sofrer', '03:10', 14, 39),
('Don\'t', '03:39', 4, 23),
('War', '03:15', 18, 40),
('Just the Way You Are', '03:40', 9, 49),
('Fearless', '04:01', 5, 35),
('Cheiro Bom do Seu Cabelo', '03:10', 12, 7),
('Bang', '02:50', 11, 19),
('Dangerously in Love 2', '04:53', 1, 14),
('Treasure', '02:58', 9, 44),
('Perfect', '04:23', 4, 15),
('Young Girls', '03:49', 9, 44),
('Terra Sem CEP', '03:25', 15, 43),
('Supera', '03:30', 14, 39),
('God’s Plan', '03:18', 6, 41),
('Hotter than Hell', '03:07', 10, 1),
('It\'s Time', '04:00', 8, 48),
('Hear Me Now', '03:12', 16, 25),
('On Top of the World', '03:12', 8, 48),
('Naughty Girl', '03:29', 1, 14),
('Headlines', '03:56', 6, 29),
('Lavender Haze', '03:22', 5, 47),
('Me Sinto Abençoado', '03:22', 18, 40),
('Cem Mil', '03:20', 13, 2),
('Oh My God', '03:45', 3, 31),
('Tides', '03:16', 4, 4),
('Essa Mina É Louca', '02:55', 11, 19),
('Hello', '04:55', 3, 8),
('Hometown Glory', '04:31', 3, 10),
('Set Fire to the Rain', '04:02', 3, 37),
('Hallucinate', '03:28', 10, 27),
('24K Magic', '03:45', 9, 17),
('Run the World (Girls)', '03:56', 1, 5),
('212', '03:05', 12, 36),
('Bad Habits', '03:50', 4, 4),
('Bloodstream', '05:00', 4, 23),
('Let Somebody Go', '04:01', 7, 12),
('Amor Difícil', '03:15', 12, 7),
('Não É Por Maldade', '03:25', 12, 7),
('Send My Love (To Your New Lover)', '03:43', 3, 8),
('Lonely', '02:32', 8, 6),
('Red', '03:43', 5, 45),
('Formation', '03:26', 1, 22),
('New Rules', '03:29', 10, 1),
('Amor Turista', '03:20', 15, 43),
('After Hours', '06:01', 2, 30),
('Sparks', '03:47', 7, 32),
('MODO TURBO', '03:20', 17, 33),
('Blinding Lights', '03:20', 2, 30),
('Love on Top', '04:27', 1, 5),
('Life in Technicolor', '02:29', 7, 11),
('The Lazy Song', '03:09', 9, 49),
('White Horse', '03:54', 5, 35),
('VIP *-*', '03:00', 17, 33),
('Follow You', '02:55', 8, 6),
('To Be Loved', '06:43', 3, 31),
('Overpass Graffiti', '03:56', 4, 4),
('42', '03:57', 7, 11),
('In Your Eyes', '03:57', 2, 30),
('Blank Space', '03:51', 5, 13),
('Sweet Dreams', '03:28', 1, 46),
('Talk', '05:11', 7, 21),
('Upgrade U', '04:33', 1, 28),
('Right as Rain', '03:17', 3, 10),
('Deixa Ele Sofrer', '02:45', 11, 19),
('Humankind', '04:26', 7, 12),
('Wildest Dreams', '03:40', 5, 13),
('Hold Up', '03:41', 1, 22),
('F*F*M*', '03:10', 18, 40),
('Too Good', '04:23', 6, 38),
('Ilusão', '03:30', 18, 40),
('Olhares Sinceros', '03:35', 15, 43),
('A Message', '04:45', 7, 21),
('Nonstop', '03:58', 6, 41),
('Maroon', '03:38', 5, 47),
('Amsterdam', '04:01', 8, 48),
('Lovers in Japan', '06:51', 7, 11),
('Single Ladies (Put a Ring on It)', '03:13', 1, 46),
('Freedom', '04:50', 1, 22),
('Te Amar Demais', '03:20', 12, 7),
('Chasing Pavements', '03:30', 3, 10),
('Irreplaceable', '03:47', 1, 28),
('In My Place', '03:48', 7, 42),
('Yes', '07:06', 7, 11),
('End of Time', '03:44', 1, 5),
('All Night', '05:22', 1, 22),
('Bebi Liguei', '03:15', 14, 39),
('The A Team', '04:18', 4, 16),
('We Are Never Ever Getting Back Together', '03:13', 5, 45),
('Water Under the Bridge', '04:00', 3, 8),
('In My Feelings', '03:37', 6, 41),
('Gasoline', '03:32', 2, 3),
('Count on Me', '03:17', 9, 49),
('I Knew You Were Trouble', '03:39', 5, 45),
('Love Story', '03:55', 5, 35),
('Notificação Preferida', '03:20', 19, 34),
('Status Que Eu Não Queria', '03:15', 19, 34),
('Is There Someone Else?', '03:19', 2, 3);

INSERT INTO Playlists (id_usuario, nome) VALUES (3, 'Som do Vento');
INSERT INTO Playlists (id_usuario, nome) VALUES (7, 'Cores da Alma');
INSERT INTO Playlists (id_usuario, nome) VALUES (15, 'Amor Infinito');
INSERT INTO Playlists (id_usuario, nome) VALUES (9, 'Tarde de Sol');
INSERT INTO Playlists (id_usuario, nome) VALUES (21, 'Caminho da Liberdade');
INSERT INTO Playlists (id_usuario, nome) VALUES (33, 'Vibe Misturada');
INSERT INTO Playlists (id_usuario, nome) VALUES (18, 'Noites de Chuva');
INSERT INTO Playlists (id_usuario, nome) VALUES (26, 'Reflexões e Sons');
INSERT INTO Playlists (id_usuario, nome) VALUES (5, 'Vibe do Amanhã');
INSERT INTO Playlists (id_usuario, nome) VALUES (10, 'Chill e Conforto');
INSERT INTO Playlists (id_usuario, nome) VALUES (12, 'Sons da Terra');
INSERT INTO Playlists (id_usuario, nome) VALUES (4, 'Momento de Paz');
INSERT INTO Playlists (id_usuario, nome) VALUES (8, 'Perdido nas Estrelas');
INSERT INTO Playlists (id_usuario, nome) VALUES (11, 'Noite Caótica');
INSERT INTO Playlists (id_usuario, nome) VALUES (22, 'Caminhos da Vida');
INSERT INTO Playlists (id_usuario, nome) VALUES (14, 'Gira o Mundo');
INSERT INTO Playlists (id_usuario, nome) VALUES (17, 'Doce Melodia');
INSERT INTO Playlists (id_usuario, nome) VALUES (19, 'Toque da Magia');
INSERT INTO Playlists (id_usuario, nome) VALUES (30, 'Vibe Contagiante');
INSERT INTO Playlists (id_usuario, nome) VALUES (35, 'Fim de Tarde');
INSERT INTO Playlists (id_usuario, nome) VALUES (40, 'Ondas do Mar');
INSERT INTO Playlists (id_usuario, nome) VALUES (16, 'Luz da Lua');
INSERT INTO Playlists (id_usuario, nome) VALUES (20, 'No Limite');
INSERT INTO Playlists (id_usuario, nome) VALUES (25, 'Mundo Paralelo');
INSERT INTO Playlists (id_usuario, nome) VALUES (32, 'Baila Comigo');
INSERT INTO Playlists (id_usuario, nome) VALUES (29, 'Faz o Som');
INSERT INTO Playlists (id_usuario, nome) VALUES (28, 'Sons e Emoções');
INSERT INTO Playlists (id_usuario, nome) VALUES (36, 'Explosão de Sentimentos');
INSERT INTO Playlists (id_usuario, nome) VALUES (38, 'Raízes e Ritmos');
INSERT INTO Playlists (id_usuario, nome) VALUES (1, 'Desafios da Vida');
INSERT INTO Playlists (id_usuario, nome) VALUES (6, 'No Ritmo da Vida');
INSERT INTO Playlists (id_usuario, nome) VALUES (2, 'Sons do Universo');
INSERT INTO Playlists (id_usuario, nome) VALUES (13, 'Aventura Sonora');


INSERT INTO Playlist_Musicas (id_playlist, id_musica) VALUES
(28, 136),
(22, 90),
(26, 118),
(12, 35),
(30, 150),
(18, 62),
(6, 15),
(21, 83),
(33, 178),
(29, 145),
(23, 93),
(25, 108),
(21, 79),
(1, 1),
(7, 17),
(25, 111),
(24, 103),
(33, 185),
(14, 42),
(20, 70),
(26, 119),
(20, 75),
(31, 158),
(24, 101),
(28, 132),
(18, 61),
(24, 102),
(33, 186),
(23, 97),
(3, 3),
(4, 8),
(22, 84),
(29, 146),
(9, 24),
(7, 16),
(7, 18),
(15, 48),
(24, 105),
(28, 138),
(33, 181),
(14, 45),
(27, 128),
(15, 46),
(10, 28),
(17, 58),
(10, 26),
(14, 44),
(33, 184),
(24, 104),
(12, 36),
(12, 37),
(5, 12),
(27, 131),
(23, 94),
(32, 173),
(14, 43),
(11, 32),
(33, 182),
(21, 81),
(27, 125),
(17, 57),
(31, 164),
(3, 6),
(19, 69),
(13, 39),
(30, 154),
(31, 165),
(13, 40),
(17, 54),
(2, 4),
(25, 114),
(23, 99),
(31, 157),
(13, 38),
(30, 152),
(29, 143),
(33, 183),
(31, 159),
(17, 55),
(27, 126),
(9, 22),
(27, 129),
(26, 117),
(26, 123),
(11, 30),
(22, 85),
(16, 53),
(28, 137),
(5, 11),
(30, 156),
(26, 120),
(32, 175),
(19, 67),
(31, 160),
(20, 74),
(29, 140),
(21, 80),
(16, 51),
(32, 171),
(21, 77),
(25, 112),
(20, 71),
(22, 88),
(1, 2),
(25, 113),
(23, 96),
(27, 130),
(4, 9),
(30, 155),
(24, 100),
(33, 179),
(31, 166),
(21, 78),
(26, 122),
(32, 169),
(16, 52),
(28, 133),
(20, 73),
(18, 59),
(18, 60),
(29, 142),
(25, 115),
(15, 49),
(21, 82),
(32, 174),
(19, 64),
(9, 25),
(9, 23),
(31, 162),
(8, 19),
(31, 163),
(33, 180),
(20, 72),
(25, 109),
(31, 161),
(15, 47),
(25, 110),
(22, 91),
(19, 66),
(28, 135),
(27, 127),
(8, 21),
(32, 170),
(16, 50),
(23, 92),
(32, 176),
(10, 27),
(24, 107),
(22, 87),
(23, 98),
(30, 151),
(29, 141),
(19, 65),
(13, 41),
(12, 34),
(24, 106),
(10, 29),
(29, 147),
(11, 33),
(22, 89),
(5, 10),
(26, 116),
(19, 68),
(22, 86),
(11, 31),
(8, 20),
(6, 13),
(32, 167),
(32, 172),
(28, 139),
(23, 95),
(30, 148),
(6, 14),
(32, 168),
(17, 56),
(30, 153),
(27, 124),
(33, 177),
(4, 7),
(2, 5),
(30, 149),
(28, 134),
(20, 76),
(18, 63),
(26, 121),
(29, 144);