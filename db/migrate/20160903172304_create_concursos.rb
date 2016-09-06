class CreateConcursos < ActiveRecord::Migration[5.0]
  
self.primary_key :url

  def change
    create_table :concursos, {:id => false} do |t|
      
      t.string :namec
      t.string :banner
      t.string :url, primary: true, limit: 10, null: false  
      t.date :fecha_inicio
      t.date :fecha_fin
      t.text :premio
      t.timestamps
    end
  end

  def to_param
  url.parameterize
  
end

end
