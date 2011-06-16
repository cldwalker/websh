require 'ripl'

module Ripl::Websh
  def get_input
    history << @input
    @input
  end

  def print_result(result)
    format_result(result)
  end
end
Ripl.config[:readline] = false
Ripl::Shell.include Ripl::Websh
