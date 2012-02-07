$:.unshift File.join(File.dirname(__FILE__),'..','lib')

require 'test/unit'
require 'decipher/cipherer'

class CiphererTest < Test::Unit::TestCase

  CIPHER_KEY = 7
  PLAIN_TEXT = "*CDC is the trademark of the Control Data Corporation.*IBM is a trademark of the International Business Machine Corporation.*DEC is the trademark of the Digital Equipment Corporation."

  def test_decipher
    cipherer = Decipher::Cipherer.new("ciphered_text.txt", Decipher::CaesarCipher.new(CIPHER_KEY))
    assert_equal(PLAIN_TEXT, cipherer.decipher.join)
  end
end
