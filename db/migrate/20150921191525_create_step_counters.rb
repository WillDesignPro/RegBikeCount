class CreateStepCounters < ActiveRecord::Migration
  def change
    create_table :step_counters do |t|
      t.datetime :date
      t.integer :kind
      t.decimal :pressure

      t.timestamps null: false
    end
  end
end
