class Produto
  attr_accessor :nome, :preco, :quantidade

  def initialize(nome, preco, quantidade)
    @nome = nome
    @preco = preco
    @quantidade = quantidade
  end

  def exibir_detalhes
    puts "Produto: #{@nome}"
    puts "Preço: R$ #{@preco}"
    puts "Quantidade em estoque: #{@quantidade}"
    puts "-----------------------------------"
  end

  def atualizar_quantidade(nova_quantidade)
    @quantidade = nova_quantidade
  end

  def aplicar_desconto(percentual)
    if percentual > 0 && percentual <= 100
      desconto = (@preco * percentual) / 100
      @preco -= desconto
      puts "Desconto de #{percentual}% aplicado no produto '#{@nome}'. Novo preço: R$ #{@preco.round(2)}"
    else
      puts "Percentual de desconto inválido!"
    end
  end
end

class Loja
  def initialize
    @estoque = []
    @vendas_realizadas = 0
    @total_vendas = 0.0
  end

  def adicionar_produto(produto)
    @estoque << produto
    puts "Produto '#{produto.nome}' adicionado ao estoque com sucesso!"
  end

  def listar_produtos
    if @estoque.empty?
      puts "Nenhum produto disponível no estoque."
    else
      puts "Lista de Produtos em Estoque:"
      @estoque.each do |produto|
        produto.exibir_detalhes
      end
    end
  end

  def vender_produto(nome_produto, quantidade)
    produto = @estoque.find { |p| p.nome.downcase == nome_produto.downcase }

    if produto && produto.quantidade >= quantidade
      produto.atualizar_quantidade(produto.quantidade - quantidade)
      total_venda = produto.preco * quantidade
      @vendas_realizadas += 1
      @total_vendas += total_venda
      puts "Venda realizada: #{quantidade}x '#{produto.nome}' por R$ #{total_venda.round(2)}"
    else
      puts "Produto não encontrado ou quantidade insuficiente em estoque."
    end
  end

  def total_vendas
    puts "Total de vendas realizadas: #{@vendas_realizadas}"
    puts "Total em vendas: R$ #{@total_vendas.round(2)}"
  end

  def aplicar_desconto_geral(percentual)
    puts "Aplicando desconto de #{percentual}% em todos os produtos..."
    @estoque.each do |produto|
      produto.aplicar_desconto(percentual)
    end
  end
end

# Simulando a loja
loja = Loja.new

# Adicionando produtos ao estoque
produto1 = Produto.new("Camiseta", 50.0, 100)
produto2 = Produto.new("Calça Jeans", 120.0, 50)
produto3 = Produto.new("Tênis Esportivo", 200.0, 30)

loja.adicionar_produto(produto1)
loja.adicionar_produto(produto2)
loja.adicionar_produto(produto3)

# Listando os produtos disponíveis
loja.listar_produtos

# Realizando algumas vendas
loja.vender_produto("Camiseta", 2)
loja.vender_produto("Calça Jeans", 1)

# Aplicando um desconto geral
loja.aplicar_desconto_geral(10)

# Listando os produtos após o desconto
loja.listar_produtos

# Realizando mais algumas vendas após o desconto
loja.vender_produto("Tênis Esportivo", 1)

# Exibindo o total de vendas
loja.total_vendas
