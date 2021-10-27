/*  Se uma string for concatenada com NULL, o resultado retornado será apenas NULL como no exemplo da consulta abaixo
 * Nesse caso , para evitar que o resulta venha NULL, usar as funções IFNULL e COALESCE*/
select concat('A quantidade adquirida é ', ' ', quantidade) as 'Quantidade Adquirida'
from teste_nulos 
where item = 'Teclado';

/*Usando IFNULL*/
select concat('A quantidade adquirida é ', ' ', ifnull(quantidade, 0))
from teste_nulos 
where item = 'Teclado';

/* Usando a Função COALESCE*/
select concat('A quantidade adquirida é', ' ',
coalesce(null, quantidade, null,0))
from teste_nulos 
where item = 'Teclado';