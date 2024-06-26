CREATE DATABASE TESTE_CONSTRAINT;

USE TESTE_CONSTRAINT;

--================================================================


CREATE TABLE TB_TIPO_PRODUTO
(	COD_TIPO INT IDENTITY NOT NULL,
	TIPO	VARCHAR(30) NOT NULL,

	CONSTRAINT PK_TB_TIPO_PRODUTO PRIMARY KEY(COD_TIPO),
	CONSTRAINT UQ_TB_TIPO_PRODUTO UNIQUE(TIPO)
);

INSERT TB_TIPO_PRODUTO VALUES ('MOUSE');
INSERT TB_TIPO_PRODUTO VALUES ('PEN-DRIVE');
INSERT TB_TIPO_PRODUTO VALUES ('HARD DISK');

INSERT TB_TIPO_PRODUTO VALUES ('HARD DISK');

--================================================================


SELECT * FROM TB_TIPO_PRODUTO;


--================================================================


CREATE TABLE TB_PRODUTO
(   ID_PRODUTO        INT IDENTITY NOT NULL,
	DESCRICAO         VARCHAR(50),    
	COD_TIPO          INT,    
	PRECO_CUSTO            NUMERIC(10,2),    
	PRECO_VENDA            NUMERIC(10,2),    
	QTD_REAL          NUMERIC(10,2),   
	QTD_MINIMA        NUMERIC(10,2),    
	DATA_CADASTRO    DATETIME DEFAULT GETDATE(),    
	SN_ATIVO          CHAR(1) DEFAULT 'S',    
	
	CONSTRAINT PK_TB_PRODUTO PRIMARY KEY( ID_PRODUTO ),    
	CONSTRAINT UQ_TB_PRODUTO_DESCRICAO UNIQUE( DESCRICAO ),
	
	CONSTRAINT CK_TB_PRODUTO_PRECOS                
			   CHECK( PRECO_VENDA >= PRECO_CUSTO ),    
	CONSTRAINT CK_TB_PRODUTO_DATA_CAD              
			   CHECK( DATA_CADASTRO <= GETDATE() ),    
	CONSTRAINT CK_TB_PRODUTO_SN_ATIVO               
			   CHECK( SN_ATIVO IN ('N','S') ),    
	
	-- Conven��o de nome: FK_TabelaDetalhe_TabelaMestre    
	CONSTRAINT FK_TB_PRODUTO_TIPO_PRODUTO               
			   FOREIGN KEY (COD_TIPO)               
			   REFERENCES TB_TIPO_PRODUTO (COD_TIPO)    );

--================================================================

