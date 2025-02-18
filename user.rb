class Usuario
  attr_accessor :nome, :email, :senha

  def initialize(nome, email, senha)
    @nome = nome
    @email = email
    @senha = senha
  end

  def exibir_informacoes
    puts "Nome: #{@nome}"
    puts "Email: #{@email}"
  end
end

class SistemaDeAutenticacao
  def initialize
    @usuarios = []
    @usuario_logado = nil
  end

  def cadastrar_usuario(nome, email, senha)
    if usuario_existe?(email)
      puts "Erro: Já existe um usuário com o email '#{email}'."
    else
      usuario = Usuario.new(nome, email, senha)
      @usuarios << usuario
      puts "Usuário '#{nome}' cadastrado com sucesso!"
    end
  end

  def login(email, senha)
    usuario = encontrar_usuario(email)

    if usuario && usuario.senha == senha
      @usuario_logado = usuario
      puts "Login realizado com sucesso! Bem-vindo, #{usuario.nome}!"
    else
      puts "Falha no login: Email ou senha incorretos."
    end
  end

  def logout
    if @usuario_logado
      puts "Usuário #{@usuario_logado.nome} deslogado com sucesso."
      @usuario_logado = nil
    else
      puts "Nenhum usuário está logado."
    end
  end

  def exibir_usuario_logado
    if @usuario_logado
      puts "Usuário logado:"
      @usuario_logado.exibir_informacoes
    else
      puts "Nenhum usuário está logado."
    end
  end

  def listar_usuarios
    if @usuarios.empty?
      puts "Nenhum usuário cadastrado."
    else
      puts "Lista de Usuários Cadastrados:"
      @usuarios.each_with_index do |usuario, index|
        puts "#{index + 1}. #{usuario.nome} - #{usuario.email}"
      end
    end
  end

  private

  def usuario_existe?(email)
    @usuarios.any? { |usuario| usuario.email == email }
  end

  def encontrar_usuario(email)
    @usuarios.find { |usuario| usuario.email == email }
  end
end

# Simulando o funcionamento do sistema
sistema = SistemaDeAutenticacao.new

# Cadastrando usuários
sistema.cadastrar_usuario("João Silva", "joao@exemplo.com", "senha123")
sistema.cadastrar_usuario("Maria Oliveira", "maria@exemplo.com", "123senha")

# Tentando cadastrar com um email já existente
sistema.cadastrar_usuario("Carlos Souza", "joao@exemplo.com", "senha456")

# Listando usuários cadastrados
sistema.listar_usuarios

# Realizando login
sistema.login("joao@exemplo.com", "senha123")
sistema.exibir_usuario_logado

# Tentando fazer login com senha errada
sistema.login("joao@exemplo.com", "senhaErrada")

# Realizando logout
sistema.logout
sistema.exibir_usuario_logado

# Realizando login com sucesso
sistema.login("maria@exemplo.com", "123senha")
sistema.exibir_usuario_logado

# Tentando listar usuários novamente após login
sistema.listar_usuarios
