CREATE DATABASE DeliveryDB;
USE DeliveryDB;

-- Tabela de Clientes
CREATE TABLE Clientes (
    id_cliente INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    telefone VARCHAR(15),
    endereco TEXT NOT NULL
);

-- Tabela de Restaurantes
CREATE TABLE Restaurantes (
    id_restaurante INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    categoria VARCHAR(50),
    taxa_entrega DECIMAL(5,2) DEFAULT 0.00
);

-- Tabela de Pratos
CREATE TABLE Pratos (
    id_prato INT AUTO_INCREMENT PRIMARY KEY,
    id_restaurante INT,
    nome VARCHAR(100) NOT NULL,
    descricao TEXT,
    preco DECIMAL(6,2) NOT NULL,
    FOREIGN KEY (id_restaurante) REFERENCES Restaurantes(id_restaurante)
);

-- Tabela de Pedidos
CREATE TABLE Pedidos (
    id_pedido INT AUTO_INCREMENT PRIMARY KEY,
    id_cliente INT,
    id_restaurante INT,
    data_pedido DATETIME DEFAULT CURRENT_TIMESTAMP,
    status ENUM('Pendente', 'Em preparo', 'A caminho', 'Entregue') DEFAULT 'Pendente',
    total DECIMAL(8,2),
    FOREIGN KEY (id_cliente) REFERENCES Clientes(id_cliente),
    FOREIGN KEY (id_restaurante) REFERENCES Restaurantes(id_restaurante)
);

-- Tabela de Itens do Pedido
CREATE TABLE ItensPedido (
    id_item INT AUTO_INCREMENT PRIMARY KEY,
    id_pedido INT,
    id_prato INT,
    quantidade INT NOT NULL,
    preco_unitario DECIMAL(6,2) NOT NULL,
    FOREIGN KEY (id_pedido) REFERENCES Pedidos(id_pedido),
    FOREIGN KEY (id_prato) REFERENCES Pratos(id_prato)
);

USE DeliveryDB;

-- Inserindo 20 clientes
INSERT INTO Clientes (nome, telefone, endereco) VALUES
('Ana Souza', '11987654321', 'Rua A, 123, São Paulo'),
('Carlos Mendes', '11976543210', 'Rua B, 456, São Paulo'),
('Mariana Silva', '11965432109', 'Rua C, 789, Rio de Janeiro'),
('João Pereira', '11954321098', 'Rua D, 101, Belo Horizonte'),
('Fernanda Lima', '11943210987', 'Rua E, 202, Salvador'),
('Lucas Santos', '11932109876', 'Rua F, 303, Curitiba'),
('Juliana Oliveira', '11921098765', 'Rua G, 404, Porto Alegre'),
('Pedro Henrique', '11910987654', 'Rua H, 505, Brasília'),
('Roberta Costa', '11909876543', 'Rua I, 606, Recife'),
('Gustavo Almeida', '11998765432', 'Rua J, 707, Fortaleza'),
('Bruna Ferreira', '11987654321', 'Rua K, 808, Manaus'),
('Eduardo Ramos', '11976543210', 'Rua L, 909, Goiânia'),
('Camila Martins', '11965432109', 'Rua M, 1010, Belém'),
('Rodrigo Nascimento', '11954321098', 'Rua N, 1111, Florianópolis'),
('Patrícia Gomes', '11943210987', 'Rua O, 1212, São Luís'),
('Leonardo Rocha', '11932109876', 'Rua P, 1313, Maceió'),
('Vanessa Dias', '11921098765', 'Rua Q, 1414, Natal'),
('Felipe Moura', '11910987654', 'Rua R, 1515, Teresina'),
('Tatiane Barbosa', '11909876543', 'Rua S, 1616, João Pessoa'),
('André Luiz', '11998765432', 'Rua T, 1717, Vitória');

-- Inserindo 20 restaurantes
INSERT INTO Restaurantes (nome, categoria, taxa_entrega) VALUES
('Pizzaria Napoli', 'Pizza', 5.00),
('Hamburgueria Top', 'Hamburguer', 4.50),
('Sushi do Zé', 'Japonesa', 6.00),
('Churrasco Gaúcho', 'Churrasco', 7.00),
('Vegano Express', 'Vegano', 4.00),
('Pastelaria do João', 'Pastel', 3.50),
('Tio da Esfiha', 'Árabe', 5.50),
('Café Colonial', 'Café', 2.50),
('Cantina Italiana', 'Italiana', 6.50),
('Frango no Pote', 'Frango', 4.80),
('Doces da Vovó', 'Confeitaria', 3.20),
('Mexicano Picante', 'Mexicana', 5.70),
('Peixaria do Porto', 'Frutos do Mar', 6.80),
('Marmitas Fit', 'Saudável', 3.90),
('Massas Caseiras', 'Massas', 5.20),
('Açaí do Norte', 'Açaí', 2.90),
('Lanchonete da Praça', 'Lanches', 3.60),
('Culinária Tailandesa', 'Tailandesa', 7.50),
('Bistrô Parisiense', 'Francesa', 8.00),
('Comida Mineira', 'Mineira', 4.70);

-- Inserindo 20 pratos
INSERT INTO Pratos (id_restaurante, nome, descricao, preco) VALUES
(1, 'Pizza Margherita', 'Molho de tomate, mussarela, manjericão', 30.00),
(1, 'Pizza Pepperoni', 'Molho de tomate, mussarela, pepperoni', 35.00),
(2, 'Hambúrguer Clássico', 'Pão, carne, queijo, alface, tomate', 25.00),
(2, 'Cheeseburger Bacon', 'Pão, carne, queijo, bacon, molho especial', 28.00),
(3, 'Sushi Combinado', '10 peças variadas', 40.00),
(3, 'Temaki de Salmão', 'Cone de alga recheado com salmão e cream cheese', 22.00),
(4, 'Picanha na Brasa', 'Picanha grelhada com acompanhamentos', 55.00),
(4, 'Costela Assada', 'Costela bovina assada lentamente', 60.00),
(5, 'Salada de Quinoa', 'Quinoa, legumes, molho de limão', 20.00),
(5, 'Burger de Grão-de-Bico', 'Pão, burger de grão-de-bico, alface e tomate', 23.00),
(6, 'Pastel de Carne', 'Massa frita recheada com carne moída', 10.00),
(6, 'Pastel de Queijo', 'Massa frita recheada com queijo', 10.00),
(7, 'Esfiha Aberta', 'Esfiha tradicional de carne', 12.00),
(7, 'Esfiha de Frango', 'Esfiha fechada de frango com catupiry', 14.00),
(8, 'Café Expresso', 'Dose de café puro', 5.00),
(8, 'Cappuccino', 'Café, leite vaporizado e espuma de leite', 8.00),
(9, 'Lasanha Bolonhesa', 'Massa, molho bolonhesa, queijo', 38.00),
(9, 'Nhoque ao Sugo', 'Nhoque de batata com molho de tomate', 30.00),
(10, 'Frango Frito', 'Porção de frango frito crocante', 25.00),
(10, 'Batata Rústica', 'Batata temperada assada', 15.00);

-- Inserindo 20 pedidos
INSERT INTO Pedidos (id_cliente, id_restaurante, status, total) VALUES
(1, 1, 'Pendente', 35.00),
(2, 2, 'Entregue', 28.00),
(3, 3, 'A caminho', 40.00),
(4, 4, 'Em preparo', 55.00),
(5, 5, 'Pendente', 20.00),
(6, 6, 'Entregue', 10.00),
(7, 7, 'A caminho', 14.00),
(8, 8, 'Pendente', 8.00),
(9, 9, 'Entregue', 38.00),
(10, 10, 'Pendente', 25.00),
(11, 1, 'Em preparo', 30.00),
(12, 2, 'A caminho', 25.00),
(13, 3, 'Entregue', 22.00),
(14, 4, 'Pendente', 60.00),
(15, 5, 'Pendente', 23.00),
(16, 6, 'A caminho', 10.00),
(17, 7, 'Em preparo', 12.00),
(18, 8, 'Entregue', 5.00),
(19, 9, 'A caminho', 30.00),
(20, 10, 'Pendente', 15.00);

-- Inserindo 20 itens de pedidos
INSERT INTO ItensPedido (id_pedido, id_prato, quantidade, preco_unitario) VALUES
(1, 2, 1, 35.00),
(2, 4, 1, 28.00),
(3, 5, 1, 40.00),
(4, 7, 1, 55.00),
(5, 9, 1, 20.00),
(6, 11, 1, 10.00),
(7, 13, 1, 14.00),
(8, 15, 1, 8.00),
(9, 17, 1, 38.00),
(10, 19, 1, 25.00),
(11, 1, 1, 30.00),
(12, 3, 1, 25.00),
(13, 6, 1, 22.00),
(14, 8, 1, 60.00),
(15, 10, 1, 23.00);

INSERT INTO Pratos (id_restaurante, nome, descricao, preco) VALUES
(1, 'Pizza Quatro Queijos', 'Molho de tomate, mussarela, parmesão, gorgonzola, provolone', 38.00),
(1, 'Pizza Portuguesa', 'Molho de tomate, mussarela, presunto, ovos, cebola, azeitona', 37.00),
(1, 'Pizza Calabresa', 'Molho de tomate, mussarela, calabresa, cebola', 35.00),
(2, 'X-Bacon', 'Pão, carne, queijo, bacon, maionese', 30.00),
(2, 'Hambúrguer Vegano', 'Pão integral, burger de soja, alface, tomate, molho especial', 27.00),
(2, 'Double Smash', 'Dois burgers, queijo duplo, cebola caramelizada', 32.00),
(3, 'Hot Roll', 'Sushi empanado recheado com salmão e cream cheese', 22.00),
(3, 'Sashimi de Salmão', 'Fatias finas de salmão fresco', 45.00),
(3, 'Ceviche de Tilápia', 'Peixe marinado com limão e especiarias', 35.00),
(4, 'Picanha na Pedra', 'Picanha servida com acompanhamentos', 65.00),
(4, 'Costelão 12h', 'Costela bovina assada lentamente por 12 horas', 75.00),
(4, 'Espetinho Misto', 'Espetinhos de carne, frango e linguiça', 28.00),
(5, 'Risoto de Cogumelos', 'Arroz cremoso com cogumelos frescos', 30.00),
(5, 'Tofu Grelhado', 'Tofu temperado e grelhado', 25.00),
(5, 'Wrap de Vegetais', 'Wrap recheado com legumes frescos e molho especial', 22.00),
(6, 'Pastel de Palmito', 'Pastel recheado com palmito cremoso', 12.00),
(6, 'Pastel de Chocolate', 'Massa frita recheada com chocolate derretido', 14.00),
(6, 'Pastel de Camarão', 'Pastel recheado com camarão ao molho branco', 18.00),
(7, 'Esfiha de Calabresa', 'Esfiha recheada com calabresa moída', 13.00),
(7, 'Esfiha de Queijo', 'Esfiha recheada com queijo minas', 12.00),
(7, 'Combo de Esfihas', '6 unidades sortidas', 35.00),
(8, 'Pão de Queijo', 'Pão de queijo caseiro', 8.00),
(8, 'Torta de Frango', 'Torta recheada com frango e requeijão', 15.00),
(8, 'Brownie com Sorvete', 'Brownie de chocolate com sorvete de creme', 20.00),
(9, 'Ravioli de Ricota', 'Massa recheada com ricota e espinafre ao molho branco', 42.00),
(9, 'Carbonara', 'Massa italiana com molho de ovos, queijo e bacon', 39.00),
(9, 'Risoto de Camarão', 'Risoto cremoso com camarão', 48.00),
(10, 'Frango Xadrez', 'Frango refogado com pimentões e molho agridoce', 33.00),
(10, 'Iscas de Frango', 'Frango empanado e crocante', 20.00),
(10, 'Frango com Quiabo', 'Frango cozido com quiabo e arroz', 35.00),
(11, 'Bolo de Cenoura', 'Bolo de cenoura com cobertura de chocolate', 18.00),
(11, 'Torta de Limão', 'Torta recheada com creme de limão e merengue', 22.00),
(11, 'Brigadeirão', 'Pudim de chocolate cremoso', 20.00),
(12, 'Nachos com Guacamole', 'Tortilhas crocantes com guacamole', 28.00),
(12, 'Burrito de Carne', 'Tortilha recheada com carne e queijo', 32.00),
(12, 'Taco de Frango', 'Taco recheado com frango e molho picante', 30.00),
(13, 'Camarão na Moranga', 'Camarão cremoso servido dentro de uma moranga', 55.00),
(13, 'Moqueca Baiana', 'Peixe ensopado com leite de coco e dendê', 50.00),
(13, 'Tilápia Grelhada', 'Filé de tilápia grelhado com legumes', 38.00),
(14, 'Salada Caesar', 'Alface, frango grelhado, croutons e molho caesar', 28.00),
(14, 'Omelete Proteico', 'Omelete de claras com peito de peru', 20.00),
(14, 'Filé de Peixe Grelhado', 'Peixe grelhado com purê de batata-doce', 35.00),
(15, 'Espaguete ao Pesto', 'Massa ao molho pesto de manjericão', 30.00),
(15, 'Fettuccine Alfredo', 'Massa com molho branco e parmesão', 35.00),
(15, 'Penne com Tomate Seco', 'Massa com tomate seco e rúcula', 32.00);

INSERT INTO Pedidos (id_cliente, id_restaurante, id_prato, quantidade, status, data_pedido) VALUES
(3, 1, 5, 2, 'Entregue', '2025-02-10 12:15:00'),
(8, 2, 12, 1, 'Pendente', '2025-02-11 19:40:00'),
(6, 5, 21, 3, 'Entregue', '2025-02-08 14:05:00'),
(10, 4, 14, 1, 'Cancelado', '2025-02-12 20:00:00'),
(2, 3, 9, 2, 'Em andamento', '2025-02-11 18:30:00'),
(7, 6, 18, 1, 'Entregue', '2025-02-09 12:00:00'),
(5, 7, 23, 2, 'Entregue', '2025-02-10 13:50:00'),
(4, 9, 28, 1, 'Pendente', '2025-02-12 21:15:00'),
(9, 11, 34, 3, 'Em andamento', '2025-02-10 17:10:00'),
(1, 12, 38, 1, 'Entregue', '2025-02-08 11:20:00'),
(3, 15, 49, 2, 'Pendente', '2025-02-12 19:25:00'),
(6, 14, 45, 1, 'Entregue', '2025-02-11 13:45:00'),
(8, 13, 42, 3, 'Em andamento', '2025-02-09 15:35:00'),
(2, 10, 30, 2, 'Cancelado', '2025-02-07 18:20:00'),
(5, 8, 26, 1, 'Pendente', '2025-02-11 12:40:00'),
(7, 3, 7, 2, 'Entregue', '2025-02-08 20:30:00'),
(4, 2, 11, 1, 'Em andamento', '2025-02-10 14:10:00'),
(9, 6, 19, 3, 'Entregue', '2025-02-12 16:00:00'),
(1, 5, 17, 1, 'Pendente', '2025-02-11 21:50:00'),
(3, 7, 22, 2, 'Entregue', '2025-02-09 18:45:00'),
(10, 9, 29, 1, 'Cancelado', '2025-02-07 12:10:00'),
(2, 11, 33, 2, 'Em andamento', '2025-02-10 20:00:00'),
(6, 12, 39, 1, 'Entregue', '2025-02-08 17:55:00'),
(8, 15, 50, 3, 'Pendente', '2025-02-12 13:25:00'),
(5, 14, 44, 1, 'Entregue', '2025-02-11 10:10:00'),
(7, 13, 41, 2, 'Em andamento', '2025-02-09 19:30:00'),
(4, 10, 31, 1, 'Pendente', '2025-02-08 21:15:00'),
(9, 8, 27, 3, 'Entregue', '2025-02-12 16:30:00'),
(1, 6, 20, 1, 'Cancelado', '2025-02-07 22:05:00'),
(3, 4, 15, 2, 'Em andamento', '2025-02-11 14:40:00'),
(10, 2, 13, 1, 'Entregue', '2025-02-09 20:20:00'),
(2, 1, 6, 2, 'Pendente', '2025-02-12 19:10:00'),
(6, 3, 8, 3, 'Entregue', '2025-02-10 18:25:00'),
(8, 5, 16, 1, 'Em andamento', '2025-02-07 17:45:00'),
(5, 7, 24, 2, 'Cancelado', '2025-02-08 12:30:00'),
(7, 9, 32, 1, 'Pendente', '2025-02-11 15:55:00'),
(4, 11, 35, 3, 'Entregue', '2025-02-09 23:00:00'),
(9, 12, 37, 1, 'Em andamento', '2025-02-10 13:20:00'),
(1, 15, 48, 2, 'Pendente', '2025-02-12 18:40:00');
