class Websh::Runner < Ripl::Runner
  class <<self; attr :on_load_string; end
  self.app = 'websh'

  def self.start
    stdout, stderr, _ = Websh::Util.capture_all { super argv: [] }
    @on_load_string = Websh::Shell.output(stdout, stderr)
    Ripl::Shell.include Websh::Shell
  end
end
