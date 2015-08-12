module Haxe
  module Cli
    module Proxy
      module Command
        require 'open3'

        class << self
          HAXE = ::Haxe::Cli::Proxy::Constants::HAXE

          ##
          # Check whether command `haxe` exists.
          #
          # @return [boolean]
          ##
          def exists?
            if RUBY_PLATFORM.downcase =~ /mswin(?!ce)|mingw|cygwin|bccwin/
              system "where #{HAXE} > nul"
            else
              system "hash #{HAXE} 2> /dev/null"
            end
          end

          ##
          # Execute command `haxe -help`
          #
          # @return [::Haxe::Cli::Command::Result] `haxe -help` command results.
          ##
          def help
            help = ::Haxe::Cli::Proxy::Constants::OPTION_HELP
            execute "#{HAXE} #{help}"
          end

          ##
          # Execute command `haxe -lib [lib_name]:[version]`
          #
          # @param [String] lib_name haxe library name.
          # @param [String|nil] version haxe library version.
          # @return [::Haxe::Cli::Command::Result] `haxe -lib` command results.
          ##
          def lib(lib_name, version=nil)
            lib = ::Haxe::Cli::Proxy::Constants::OPTION_LIB
            lib_name << ":#{version}" unless version.nil?
            execute "#{HAXE} #{lib} #{lib_name}"
          end

          ##
          # Execute command `haxe -xml [file]`
          #
          # @param [String] file haxe library name.
          # @return [::Haxe::Cli::Command::Result] `haxe -lib` command results.
          ##
          def xml(file)
            xml = ::Haxe::Cli::Proxy::Constants::OPTION_XML
            execute "#{HAXE} #{xml} #{file}"
          end

          ##
          # Execute haxe compile command.
          #
          # @param [Hash] options compile options.
          #                       if uses hxml, give option parameter such as...
          #                         {
          #                           hxml: [hxml file name]
          #                         }
          #                       if not uses hxml, give option parameter such as...
          #                         {
          #                           main:         [main class name],
          #                           target:       [compile target],
          #                           output:       [output directory or file],
          #                           lib:          [using haxe libraries with array],
          #                           compile_flag: [compile flags with array],
          #                           debug:        [debug mode flag with boolean],
          #                           verbose:      [verbose mode flag with boolean],
          #                           dce:          [dead code elimination option]
          #                         }
          # @return [::Haxe::Cli::Command::Result] haxe compile command results.
          ##
          def compile(options)
            builder = ::Haxe::Cli::Proxy::CompileOption::Builder.new(options)
            execute "#{HAXE} #{builder}"
          end
          
          private

          def execute(command)
            Result.new Open3.capture3(command)
          end
        end

        class Result
          attr_reader :stdout, :stderr, :status

          def initialize(open3_captured)
            @stdout, @stderr, @status = open3_captured
          end
        end
      end
    end
  end
end
