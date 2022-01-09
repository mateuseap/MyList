class AddFinalizadaToTarefas < ActiveRecord::Migration[7.0]
  def change
    add_column :tarefas, :finalizada, :boolean
  end
end
