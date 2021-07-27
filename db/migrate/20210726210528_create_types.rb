class CreateTypes < ActiveRecord::Migration[6.0]
  def change
    create_table :types do |t|
      t.string :name
      t.integer :slot
      t.belongs_to :pokemon

      t.timestamps
    end
  end
end
