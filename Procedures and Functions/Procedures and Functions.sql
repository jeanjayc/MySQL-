-- PROCEDIMENTO CRIADO PARA CHECAR O PREÇO DO LIVRO NA TABELA 
DELIMITER //
create procedure verPreco2(varLivro smallint)
begin
	select concat('O preço é ', tl.Preco) as "Preço"
	from tbl_livro tl 
	where ID_Livro  = varLivro;
end//
DELIMITER ;

-- PROCEDURE PARA CHECAGEM DE LIVROS COM PREÇO MENOR DO QUE O INFORMANDO NO PARAMETRO
CREATE PROCEDURE precoMenorQue(varPreco decimal)
SELECT concat('Os livros com preço menor que ', varPreco,' ', Nome_Livro,' ', Preco_Livro) as "Livros"
FROM tbl_Livro tl
Where tl.Preco_Livro < varPreco;

call precoMenorQue(60);

/*CRIANDO A FUNÇÃO PARA AUMENTO DE PREÇO DE ACORDO COM A TAXA*/
DELIMITER $$
CREATE FUNCTION aumenta_preco(preco decimal(10,2), taxa decimal(10,2))  RETURNS DECIMAL(10, 2)
BEGIN
	Return preco + (preco * taxa/100);
END$$
DELIMITER ;

/*INVOCANDO A FUNÇÂO PARA AUMENTAR PREÇO EM 10%*/
SELECT aumenta_preco(50,00, 10,00) AS RESULTADO;

-- FUNCAO CRIADA PARA REALIZAR O CALCULO DO VALOR QUE É DESCONTADO DO SALARIO REFERENTE AO FGTS
create function descontoFGTS(sal decimal(10,2), des decimal(10,2))
returns decimal
return sal * des;

select descontoFGTS(1600.00, 0.08) as "Desconto FGTS";

-- PROCEDURE QUE CALCULA O VALOR DO SALARIO APÓS O DESCONTO, AQUI É INVOCADO A FUNCAO descontaFGTS criada acima
create procedure salarioComDesconto(varSalario smallint)
select (t.Salario - (descontoFGTS(t.Salario, 0.08))) AS "Salario com Desconto"
from trabalho t
where t.chave_Trabalho = varSalario;

call salarioComDesconto(6);