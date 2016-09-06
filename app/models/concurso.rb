class Concurso < ApplicationRecord
belongs_to :user
	self.primary_key = "url"	
	def to_param
    url.parameterize
  end
has_many :archivos
end
