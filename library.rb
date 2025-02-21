class Livro
  attr_accessor :titulo, :autor, :disponivel

  def initialize(titulo, autor)
    @titulo = titulo
    @autor = autor
    @disponivel = true
  end
end

class Usuario
  attr_accessor :nome, :livros_emprestados

  def initialize(nome)
    @nome = nome
    @livros_emprestados = []
  end

  def emprestar_livro(livro)
    if livro.disponivel
      @livros_emprestados << livro
      livro.disponivel = false
      puts "#{@nome} emprestou o livro '#{livro.titulo}'"
    else
      puts "O livro '#{livro.titulo}' não está disponível."
    end
  end

  def devolver_livro(livro)
    if @livros_emprestados.include?(livro)
      @livros_emprestados.delete(livro)
      livro.disponivel = true
      puts "#{@nome} devolveu o livro '#{livro.titulo}'"
    else
      puts "#{@nome} não possui o livro '#{livro.titulo}'"
    end
  end
end

class Biblioteca
  attr_accessor :livros, :usuarios

  def initialize
    @livros = []
    @usuarios = []
  end

  def adicionar_livro(livro)
    @livros << livro
    puts "Livro '#{livro.titulo}' adicionado à biblioteca."
  end

  def registrar_usuario(usuario)
    @usuarios << usuario
    puts "Usuário '#{usuario.nome}' registrado."
  end

  def listar_livros_disponiveis
    puts "Livros disponíveis:"
    @livros.each do |livro|
      puts "- #{livro.titulo} de #{livro.autor}" if livro.disponivel
    end
  end

  def listar_usuarios
    puts "Usuários cadastrados:"
    @usuarios.each { |usuario| puts "- #{usuario.nome}" }
  end
end

biblioteca = Biblioteca.new

livro1 = Livro.new("1984", "George Orwell")
livro2 = Livro.new("Dom Quixote", "Miguel de Cervantes")
livro3 = Livro.new("O Hobbit", "J.R.R. Tolkien")

biblioteca.adicionar_livro(livro1)
biblioteca.adicionar_livro(livro2)
biblioteca.adicionar_livro(livro3)

usuario1 = Usuario.new("Ana")
usuario2 = Usuario.new("Carlos")

biblioteca.registrar_usuario(usuario1)
biblioteca.registrar_usuario(usuario2)

usuario1.emprestar_livro(livro1)

biblioteca.listar_livros_disponiveis

usuario1.devolver_livro(livro1)

biblioteca.listar_livros_disponiveis
