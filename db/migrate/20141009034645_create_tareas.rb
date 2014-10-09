class CreateTareas < ActiveRecord::Migration
  def change
    create_table :tareas do |t|
      t.string :nombre
      t.date :vencimiento
      t.boolean :completo

      t.timestamps
    end
  end
end
