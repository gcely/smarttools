class AddConcursoIdToArchivos < ActiveRecord::Migration[5.0]
  def change
    add_reference :archivos, :concurso, foreign_key: true
  end
end
