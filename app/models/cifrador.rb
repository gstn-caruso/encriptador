class Cifrador

  def initialize(clave)
    @clave = clave
  end

  def cipher
    OpenSSL::Cipher::Cipher.new('aes-256-cbc')
  end

  def decrypt(value)
    c = cipher.decrypt
    c.key = Digest::SHA256.digest(@clave)
    c.update(Base64.decode64(value.to_s)) + c.final
  end

  def encrypt(value)
    c = cipher.encrypt
    c.key = Digest::SHA256.digest(@clave)
    Base64.encode64(c.update(value.to_s) + c.final)
  end
end