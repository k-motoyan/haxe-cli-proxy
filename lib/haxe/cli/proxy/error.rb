module Haxe
  module Cli
    module Proxy
      module Error
        class HaxeCliProxyError < StandardError
        end

        class CommandNotExistsError < HaxeCliProxyError
          def initialize
            super 'Command `haxe` was not found. please install haxe.'
          end
        end

        class NotExistsCompileRequiredKeys < HaxeCliProxyError
          def initialize
            super 'Compile option required "main", "target" and "output".'
          end
        end

        class UnknownCompileTarget < HaxeCliProxyError
          def initialize
            super 'Unknown compile target.'
          end
        end
      end
    end
  end
end