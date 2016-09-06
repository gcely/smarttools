class AddUserIdToConcursos < ActiveRecord::Migration[5.0]
  def change
    add_reference :concursos, :user, foreign_key: true
  end
end
