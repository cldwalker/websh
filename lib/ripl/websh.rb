require 'ripl'

module Ripl::Websh
  def in_loop()
    define_singleton_method(:after_loop) { }
  end

  def get_input
    history << @input
    @input
  end

  def print_result(result) end
end
Ripl.config[:readline] = false
Ripl::Shell.include Ripl::Websh
