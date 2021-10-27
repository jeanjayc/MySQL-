DELIMITER //
create function calcula_desconto(livro INT, desconto DECIMAL(10,2))
returns DECIMAL(10,2)
begin
	declare preco DECIMAL(10,2);
	select tl.Preco_Livro from tbl_livro tl 
	where tl.ID_Livro  = livro into preco;
	return preco - desconto;
end //
DELIMITER ;

SELECT * FROM tbl_livro WHERE ID_Livro = 4;
SELECT calcula_desconto(4, 10.00) as "Preço com desconto";