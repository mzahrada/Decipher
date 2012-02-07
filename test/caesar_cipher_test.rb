$:.unshift File.join(File.dirname(__FILE__),'..','lib')

require 'test/unit'
require 'decipher/caesar_cipher'

class CaesarCipherTest < Test::Unit::TestCase

  CIPHERED_TEXT = "bipk"
  PLAIN_TEXT = "ahoj"
  CIPHER_KEY = 1

  def test_decrypt_char
    cipher = Decipher::CaesarCipher.new(CIPHER_KEY)
    plain_text = ""

    CIPHERED_TEXT.each_char { |cstr|
      plain_text << cipher.decrypt_char(cstr)
    }
    assert_equal(PLAIN_TEXT, plain_text)
  end

  def test_encrypt_char
    cipher = Decipher::CaesarCipher.new(CIPHER_KEY)
    ciphered_text = ""

    PLAIN_TEXT.each_char { |cstr|
      ciphered_text << cipher.encrypt_char(cstr)
    }
    assert_equal(CIPHERED_TEXT, ciphered_text)
  end

  def test_cipher_key_format_error
    assert_raise(ArgumentError) { Decipher::CaesarCipher.new("a") }
    assert_raise(ArgumentError) { Decipher::CaesarCipher.new(2.1) }
  end
end
