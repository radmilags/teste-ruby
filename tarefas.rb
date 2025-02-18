class TodoList
  def initialize
    @tarefas = []
  end

  def adicionar_tarefa(tarefa)
    @tarefas << tarefa
    puts "Tarefa '#{tarefa}' adicionada!"
  end

  def listar_tarefas
    if @tarefas.empty?
      puts "Nenhuma tarefa na lista."
    else
      puts "Lista de Tarefas:"
      @tarefas.each_with_index do |tarefa, index|
        puts "#{index + 1}. #{tarefa}"
      end
    end
  end

  def remover_tarefa(indice)
    if indice.between?(1, @tarefas.length)
      tarefa_removida = @tarefas.delete_at(indice - 1)
      puts "Tarefa '#{tarefa_removida}' removida."
    else
      puts "Índice inválido."
    end
  end
end

lista = TodoList.new

lista.adicionar_tarefa("Estudar Ruby")
lista.adicionar_tarefa("Fazer compras")
lista.adicionar_tarefa("Ir ao médico")

lista.listar_tarefas

lista.remover_tarefa(2)

lista.listar_tarefas
