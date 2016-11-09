class ActionCorreoMailer < ApplicationMailer
    default from: "j.jaimes@uniandes.edu.co"

    def video_convertido_email(v)
  	    @video= v
		puts "entro a enviar el correo"
    mail(:to => @video.email, :subject => 'Video exitosamente convertido')
	puts "envio el correo a: " + @video.email
    end
end
