describe HaxeCliProxy::CompileOption do
  describe 'Class Builder' do
    Builder = HaxeCliProxy::CompileOption::Builder
    Constants = HaxeCliProxy::Constants
    NotExistsCompileRequiredKeys = HaxeCliProxy::Error::NotExistsCompileRequiredKeys
    UnknownCompileTarget = HaxeCliProxy::Error::UnknownCompileTarget

    subject { @builder.to_s }

    describe 'compile by hxml' do
      let(:hxml) { 'compile.hxml' }
      before { @builder = Builder.new({ hxml: hxml }) }
      it { is_expected.to eq hxml }
    end

    describe 'compile by options' do
      let(:main) { 'Main' }
      let(:target) { Constants::TARGET_JS }
      let(:output) { 'js/main.js' }
      let(:options) { { main: main, target: target, output: output } }

      before { @builder = Builder.new(options) }

      it { is_expected.to eq "-main #{main} #{Constants::TARGETS[Constants::TARGET_JS]} #{output}" }

      describe 'not enough required option' do
        %i(main target output).each do |sym|
          before do
            local_opts = options
            local_opts.delete(sym)
            @builder = Builder.new(local_opts)
          end
          context "#{sym} not exists" do
            it { expect{@builder.to_s}.to raise_error(NotExistsCompileRequiredKeys) }
          end
        end
      end

      describe 'unknown target' do
        let(:target) { 'ruby' }
        it { expect{@builder.to_s}.to raise_error(UnknownCompileTarget) }
      end

      describe 'sub options' do
        describe 'given lib' do
          let(:lib) { %w(foo bar baz) }

          before do
            local_opts = options
            local_opts[:lib] = lib
            @builder = Builder.new(local_opts)
          end

          it { is_expected.to match(/-lib foo bar baz/) }

          context 'when lib not array' do
            let(:lib) { 'foo bar baz' }
            it { is_expected.not_to match(/-lib foo bar baz/) }
          end
        end

        describe 'given compile_flag' do
          let(:compile_flag) { %w(foo bar baz) }

          before do
            local_opts = options
            local_opts[:compile_flag] = compile_flag
            @builder = Builder.new(local_opts)
          end

          it { is_expected.to match(/-D foo bar baz/) }

          context 'when compile_flag not array' do
            let(:compile_flag) { 'foo bar baz' }
            it { is_expected.not_to match(/-D foo bar baz/) }
          end
        end

        describe 'given debug' do
          let(:debug) { true }

          before do
            local_opts = options
            local_opts[:debug] = debug
            @builder = Builder.new(local_opts)
          end

          it { is_expected.to match(/-debug/) }

          context 'when debug is false' do
            let(:debug) { false }
            it { is_expected.not_to match(/-debug/) }
          end
        end

        describe 'given verbose' do
          let(:verbose) { true }

          before do
            local_opts = options
            local_opts[:verbose] = verbose
            @builder = Builder.new(local_opts)
          end

          it { is_expected.to match(/-v/) }

          context 'when verbose is false' do
            let(:verbose) { false }
            it { is_expected.not_to match(/-v/) }
          end
        end

        describe 'given dce' do
          before do
            local_opts = options
            local_opts[:dce] = dce
            @builder = Builder.new(local_opts)
          end

          context 'when dce empty' do
            let(:dce) { '' }
            it { is_expected.not_to match(/-dce/) }
          end

          describe 'normal dce' do
            Constants::DED_CODE_OPTIONS.each do |normal_dce|
              context "when dce is #{normal_dce}" do
                let(:dce) { normal_dce }
                it { is_expected.to match("-dce #{normal_dce}") }
              end
            end
          end
        end
      end
    end
  end
end