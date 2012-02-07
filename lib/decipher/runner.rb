require_relative 'cipherer'
require_relative 'caesar_cipher'

# Module that deciphers ciphered text using Caesar's ciphering.
# - <tt>p = |c - key| .. key = 7</tt>
#
# Author:: Martin Zahradnicky  (mailto:zahrama8@fit.cvut.cz)
module Decipher

  # Runner class for Decipher module.
  class Runner
    # Usage message printed when used wrong.
    USAGE_TEXT = 'USAGE: ruby decipher filename'
    # Error message raised when file not found.
    FNF_TEXT = "File not found."
    # Value of cipher key.
    CIPHER_KEY = 7

    # Initializes Runner, gets _filename_ from input _ARGS_.
    # ---
    # * Raises::
    #   - _ArgumentError_ is no input file specified in _ARGS_
    #   - _IOError_ if file not found
    def initialize(args)
      if args.size != 1
        raise ArgumentError.new(USAGE_TEXT)
      end
      if !File.exist?(args[0])
        raise IOError.new(FNF_TEXT)
      end
      @filename = args[0]
    end

    # Main method for running Decipher module.
    # ---
    # * Returns::
    #   - plain text
    def run
      cipher = CaesarCipher.new(CIPHER_KEY)
      cipherer = Cipherer.new(@filename, cipher)
      p cipherer.decipher()
    end
  end
end
