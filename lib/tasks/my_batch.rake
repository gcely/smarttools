namespace :my_batch do
  desc "Convertir videos a mp4."
  task convertir_video: :environment do
    puts "entro al batch..."
    scheduler = Rufus::Scheduler.new
    scheduler.every '30s', :allow_overlapping => false do
    	@videos = Video.where(estado: 0)
        for video in @videos
          puts "el video es #{video.id}"
          # direccion del video a convertir
          ruta_video_in = Rails.root.join("public", "uploads", "#{video.class.to_s.underscore}")
          FileUtils.mkdir_p(ruta_video_in) unless File.exists?(ruta_video_in)
          nombre_video = video.nombre_video.split('.')[0]
          puts "nombre video: #{nombre_video}"
          ruta_completa = Rails.root.join(ruta_video_in, nombre_video)
          
          open(ruta_completa, 'wb') do |file|
  					file << open(video.video.url).read
  				end
  				
          print "la ruta es #{ruta_completa}"
          
          movie = FFMPEG::Movie.new('/home/ubuntu/workspace/public/uploads/video/aaa8.mov')
          #archivo nuevo
          ruta_archivo_conv = Rails.root.join("public", "uploads", "#{video.class.to_s.underscore}", "conv_video", nombre_video)
          transcoded_movie = movie.transcode(ruta_archivo_conv, "-acodec aac -vcodec libx264 -profile:v high -strict -2")
  				
  				video.conv_video = ruta_archivo_conv
  				video.save(:validate => false)
				  print video
				end  
      end
    end
    scheduler.join
  end

end
