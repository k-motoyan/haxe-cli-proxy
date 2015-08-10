require 'open3'

module HaxeCliProxy
  module Command
    class << self
      @@haxe = ::HaxeCliProxy::Constants::HAXE

      def exists?
        if RUBY_PLATFORM.downcase =~ /mswin(?!ce)|mingw|cygwin|bccwin/
          system "where #{@@haxe} > nul"
        else
          system "hash #{@@haxe} 1>& /dev/null"
        end
      end

      def execute(command)
        Result.new Open3.capture3(command)
      end

      def help
        help = ::HaxeCliProxy::Constants::OPTION_HELP
        execute "#{@@haxe} #{help}"
      end

      def lib(lib_name, version=nil)
        lib = ::HaxeCliProxy::Constants::OPTION_LIB
        lib_name << ":#{version}" unless version.nil?
        execute "#{@@haxe} #{lib} #{lib_name}"
      end

      def xml(file)
        xml = ::HaxeCliProxy::Constants::OPTION_XML
        execute "#{@@haxe} #{xml} #{file}"
      end

      def compile(options)
        builder = ::HaxeCliProxy::CompileOption::Builder.new(options)
        execute "#{@@haxe} #{builder}"
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