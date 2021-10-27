select tl.Nome_Livro as "Livros", tl.ID_Editora as "Código da Editora"
from tbl_livro tl 
where tl.ID_editora IN(
	select te.ID_Editora 
	from tbl_editoras te 
	where te.Nome_Editora = 'Wiley' or te.Nome_Editora = 'Microsoft Press'
);

Select tl.Nome_Livro 
from tbl_livro tl 
where tl.ID_Autor in (
	select ta.ID_Autor 
	from tbl_autores ta 
	where ta.Nome_Autor = 'Daniel'
);