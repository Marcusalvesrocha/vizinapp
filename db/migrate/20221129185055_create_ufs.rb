class CreateUfs < ActiveRecord::Migration[7.0]
  def change
    create_table :ufs do |t|
      t.integer :id_uf
      t.string :sigla
      t.string :name

      t.timestamps
    end
  end
end
