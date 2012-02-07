require_relative 'caesar_cipher'

module Decipher

  # Defines machine that reads <tt>ciphered text</tt> from _file_ and decrypts it
  # using specific cipher.
  class Cipherer

    # Creates new Cipherer object, opens _file_ for reading and sets ciphering method.
    # ---
    # * Args::
    #   - _filename_ name of file with <tt>ciphered text</tt>
    #   - _cipher_ cipher method used for decrypting
    def initialize(filename, cipher)
      @file = File.new(filename, 'r')
      @cipher = cipher
    end

    # Deciphers <tt>ciphered text</tt> from _file_.
    # * Returns::
    #   - _plain_text_ <tt>plain text</tt>
    def decipher
      plain_text = []
      @file.each_line { |line|
        plain_row = ""
        line.chomp!.each_char { |c|
          plain_row << @cipher.decrypt_char(c)
        }
        plain_text << plain_row
      }
      return plain_text
    end

  end
  
end