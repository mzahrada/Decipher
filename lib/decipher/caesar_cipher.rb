module Decipher
  # Class that provides methods for Caesar's ciphering.
  class CaesarCipher
    # Error message raised key is not integer.
    NOT_INTEGER = "Cipher key must be integer."

    # Creates new CaesarCipher object and sets cipher's integer value of _key_.
    # ---
    # * Args::
    #   - _key_ cipher's key
    # * Raises::
    #   - _ArgumentError_ if key not integer
    def initialize(key)
      raise ArgumentError.new(NOT_INTEGER) if !key.is_a?(Integer)
      @key = key
    end

    # Encryptes given _char_. [zasifruje znak]
    # ---
    # * Args::
    #   - _char_ char to encrypt
    def encrypt_char(char)
      return char.ord + @key
    end

    # Decryptes given _char_. [desifruje znak]
    # ---
    # * Args::
    #   - _char_ char to decrypt
    def decrypt_char(char)
      return char.ord - @key
    end
  end
end