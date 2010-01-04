module Sinatra
  class Controller < Base
    set :controllers, Proc.new { root && File.join(root, 'controllers') }

    class << self
      # Load all controllers from the path specified to "set :controllers, '/path'".
      # This defaults to a "controllers" directory under the application root. This
      # is automatically called by run! when the server starts, so normally you
      # do not need to call it yourself.
      def load_controllers(path=nil)
        path ||= controllers
        raise "Missing controllers directory (try \"set :controllers, '/path'\"): #{path}" unless File.directory? path
        Dir.glob("#{path}/**.rb"){|f| require f }
        @did_load_controllers = true
      end

      def run!(options={})
        load_controllers unless @did_load_controllers
        super
      end

    end
  end
end