class Livro
  attr_accessor :titulo, :autor, :ano_publicacao, :isbn

  def initialize(titulo, autor, ano_publicacao, isbn)
    @titulo = titulo
    @autor = autor
    @ano_publicacao = ano_publicacao
    @isbn = isbn
  end

  def exibir_detalhes
    puts "Título: #{@titulo}"
    puts "Autor: #{@autor}"
    puts "Ano de Publicação: #{@ano_publicacao}"
    puts "ISBN: #{@isbn}"
    puts "--------------------------------"
  end
end

class Biblioteca
  def initialize
    @livros = []
  end

  def adicionar_livro(livro)
    @livros << livro
    puts "Livro '#{livro.titulo}' adicionado com sucesso!"
  end

  def listar_livros
    if @livros.empty?
      puts "Nenhum livro na biblioteca."
    else
      puts "Lista de Livros na Biblioteca:"
      @livros.each_with_index do |livro, index|
        puts "#{index + 1}. #{livro.titulo} - #{livro.autor} (#{livro.ano_publicacao})"
      end
      puts "--------------------------------"
    end
  end

  def buscar_por_titulo(titulo)
    livros_encontrados = @livros.select { |livro| livro.titulo.downcase.include?(titulo.downcase) }
    
    if livros_encontrados.empty?
      puts "Nenhum livro encontrado com o título '#{titulo}'."
    else
      livros_encontrados.each { |livro| livro.exibir_detalhes }
    end
  end

  def excluir_livro(isbn)
    livro_encontrado = @livros.find { |livro| livro.isbn == isbn }
    
    if livro_encontrado
      @livros.delete(livro_encontrado)
      puts "Livro '#{livro_encontrado.titulo}' removido da biblioteca."
    else
      puts "Livro com o ISBN '#{isbn}' não encontrado."
    end
  end

  def contar_livros
    puts "Número total de livros na biblioteca: #{@livros.length}"
  end
end


biblioteca = Biblioteca.new


livro1 = Livro.new("O Senhor dos Anéis", "J.R.R. Tolkien", 1954, "978-0261102385")
livro2 = Livro.new("1984", "George Orwell", 1949, "978-0451524935")
livro3 = Livro.new("Harry Potter e a Pedra Filosofal", "J.K. Rowling", 1997, "978-0747532699")
livro4 = Livro.new("A Revolução dos Bichos", "George Orwell", 1945, "978-0451526342")

biblioteca.adicionar_livro(livro1)
biblioteca.adicionar_livro(livro2)
biblioteca.adicionar_livro(livro3)
biblioteca.adicionar_livro(livro4)


biblioteca.listar_livros


puts "Buscando livros com o título '1984':"
biblioteca.buscar_por_titulo("1984")


puts "Excluindo livro com o ISBN 978-0451524935..."
biblioteca.excluir_livro("978-0451524935")


biblioteca.listar_livros


biblioteca.contar_livros
