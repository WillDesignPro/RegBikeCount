class CreateRegistrosbikecounts < ActiveRecord::Migration
  def change
    create_table :registrosbikecounts do |t|
      t.date :dia
      t.string :hora
      t.integer :tipo
      t.decimal :velocidade
      t.decimal :pressao

      t.timestamps null: false
    end
  end
end
