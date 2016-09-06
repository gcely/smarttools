class RemoveIdFromConcurso < ActiveRecord::Migration[5.0]
  def change
    remove_column :concursos, :id, :integer
  end
end
