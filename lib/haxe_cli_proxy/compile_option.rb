module HaxeCliProxy
  module CompileOption
    class Builder
      def initialize(options)
        @opts = options
      end

      def to_s
        if compile_by_hxml?
          @opts[:hxml]
        else
          build_options
        end
      end

      private
        def compile_by_hxml?
          @opts.key?(:hxml)
        end

        def build_options
          opts = ''
          targets = ::HaxeCliProxy::Constants::TARGETS
          ded_code_options = ::HaxeCliProxy::Constants::DED_CODE_OPTIONS
          main = ::HaxeCliProxy::Constants::COMPILE_MAIN
          lib = ::HaxeCliProxy::Constants::COMPILE_LIB
          flag = ::HaxeCliProxy::Constants::COMPILE_FLAG
          dce = ::HaxeCliProxy::Constants::COMPILE_DEC
          verbose = ::HaxeCliProxy::Constants::COMPILE_VERBOSE
          debug = ::HaxeCliProxy::Constants::COMPILE_DEBUG

          unless %i(main target output).any? { |k| !@opts[k].nil? }
            raise ::HaxeCliProxy::Error::NotExistsCompileRequiredKeys.new
          end

          unless targets.key?(@opts[:target])
            raise ::HaxeCliProxy::Error::UnknownCompileTarget.new
          end

          opts << "#{main} #{@opts[:main]} #{targets[@opts[:target]]} #{@opts[:output]}"

          if !@opts[:lib].nil? && @opts[:lib].is_a?(Array)
            opts << " #{lib} "
            opts << @opts[:lib].join(' ')
          end

          if !@opts[:compile_flag].nil? && @opts[:compile_flag].is_a?(Array)
            opts << " #{flag} "
            opts << @opts[:compile_flag].join(' ')
          end

          if !@opts[:debug].nil? && @opts[:debug]
            opts << " #{debug}"
          end

          if !@opts[:verbose].nil? && @opts[:verbose]
            opts << " #{verbose}"
          end

          if !@opts[:dce].nil? && ded_code_options.include?(@opts[:dce])
            opts << " #{dce} #{@opts[:dce]}"
          end

          opts
        end
    end
  end
end