class Cifrador

  def initialize(clave)
    @clave = clave
    @cipher = OpenSSL::Cipher::Cipher.new('aes-256-cbc')
  end

  def desencriptar(un_objeto)
    desencriptador = @cipher.decrypt
    desencriptador.key = Digest::SHA256.digest(@clave)
    desencriptador.update(Base64.decode64(un_objeto.to_s)) + desencriptador.final
  end

  def encriptar(un_objeto)
    encriptador = @cipher.encrypt
    encriptador.key = Digest::SHA256.digest(@clave)
    Base64.encode64(encriptador.update(un_objeto.to_s) + encriptador.final)
  end
end