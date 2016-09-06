class Archivo < ApplicationRecord
belongs_to :concurso

	extend CarrierWave::Mount
	mount_uploader :video, VideoUploader

end
