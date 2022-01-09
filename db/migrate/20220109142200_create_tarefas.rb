class CreateTarefas < ActiveRecord::Migration[7.0]
  def change
    create_table :tarefas do |t|
      t.string :nome
      t.string :descricao
      t.boolean :finalizada
      t.references :usuario, null: false, foreign_key: true

      t.timestamps
    end
  end
end
