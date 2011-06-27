require 'ripl'

module Ripl::Websh
  def before_loop
    super
    (Ripl.config[:hirb] ||= {})[:pager] = false if defined? Hirb
  end

  def in_loop
    define_singleton_method(:after_loop) { }
  end

  def get_input
    history << @input
    @input
  end

  def format_error(err)
    "#{err.class}: #{err.message}\n    " +
      "#{err.backtrace.take_while {|e| e[/ripl/] }.join("\n    ")}"
  end

  def print_result(result) end
end
Ripl.config[:readline] = false
Ripl.config[:web] = true
Ripl::Shell.include Ripl::Websh
