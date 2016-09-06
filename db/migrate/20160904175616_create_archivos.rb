class CreateArchivos < ActiveRecord::Migration[5.0]
  def change
    create_table :archivos do |t|
      t.string :nombres
      t.string :email
      t.string :video
      t.string :mensaje
      t.string :fecha_creacion
      t.string :estado

      t.timestamps
    end
  end
end
