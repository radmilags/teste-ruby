class ContaBancaria
  attr_accessor :titular, :numero_conta, :saldo

  def initialize(titular, numero_conta, saldo_inicial = 0)
    @titular = titular
    @numero_conta = numero_conta
    @saldo = saldo_inicial
  end

  def exibir_dados
    puts "Titular: #{@titular}"
    puts "Número da Conta: #{@numero_conta}"
    puts "Saldo: R$ #{@saldo}"
    puts "----------------------------"
  end

  def depositar(valor)
    if valor > 0
      @saldo += valor
      puts "Depósito de R$ #{valor} realizado com sucesso!"
    else
      puts "Valor inválido para depósito!"
    end
  end

  def sacar(valor)
    if valor > 0 && valor <= @saldo
      @saldo -= valor
      puts "Saque de R$ #{valor} realizado com sucesso!"
    else
      puts "Saldo insuficiente ou valor inválido!"
    end
  end

  def transferir(valor, conta_destino)
    if valor > 0 && valor <= @saldo
      sacar(valor)
      conta_destino.depositar(valor)
      puts "Transferência de R$ #{valor} para a conta #{conta_destino.numero_conta} realizada com sucesso!"
    else
      puts "Saldo insuficiente ou valor inválido para transferência!"
    end
  end
end

class Banco
  def initialize
    @contas = []
  end

  def criar_conta(titular, numero_conta, saldo_inicial = 0)
    if conta_existe?(numero_conta)
      puts "Erro: Conta com o número #{numero_conta} já existe!"
    else
      conta = ContaBancaria.new(titular, numero_conta, saldo_inicial)
      @contas << conta
      puts "Conta do titular #{titular} criada com sucesso!"
    end
  end

  def exibir_contas
    if @contas.empty?
      puts "Nenhuma conta registrada."
    else
      @contas.each do |conta|
        conta.exibir_dados
      end
    end
  end

  def buscar_conta(numero_conta)
    @contas.find { |conta| conta.numero_conta == numero_conta }
  end

  private

  def conta_existe?(numero_conta)
    @contas.any? { |conta| conta.numero_conta == numero_conta }
  end
end


banco = Banco.new

banco.criar_conta("João Silva", "12345", 500)
banco.criar_conta("Maria Oliveira", "67890", 1000)
banco.criar_conta("Carlos Souza", "11121", 1500)


banco.exibir_contas


joao = banco.buscar_conta("12345")
joao.depositar(200)

maria = banco.buscar_conta("67890")
maria.depositar(300)


joao.sacar(100)
maria.sacar(500)


carlos = banco.buscar_conta("11121")
maria.transferir(200, carlos)

banco.exibir_contas
