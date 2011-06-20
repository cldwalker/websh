class Websh::Runner < Ripl::Runner
  class <<self; attr :on_load_string; end
  self.app = 'websh'

  def self.start
    @on_load_string = Websh::Util.capture_all { super argv: [] }[0,2].inject(&:+)
    Ripl::Shell.include Websh::Shell
  end
end
