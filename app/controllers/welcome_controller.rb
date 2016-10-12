class WelcomeController < ApplicationController
  def index
  end

  def desencriptar
  end

  def encriptar_datos
    cifrador = Cifrador.new(clave)
    archivo_encriptado = cifrador.encriptar(archivo_a_encriptar)

    send_data(archivo_encriptado, :filename => "encriptado" )
  end

  def desencriptar_datos
    cifrador = Cifrador.new(clave)
    archivo_desencriptado = cifrador.desencriptar(archivo_a_desencriptar)

    send_data(archivo_desencriptado, :filename => "desencriptado" )
  end


  private

  def archivo_a_encriptar
    params[:archivo_a_encriptar].read
  end

  def archivo_a_desencriptar
    params[:archivo_a_desencriptar].read
  end

  def clave
    params[:clave]
  end

end
