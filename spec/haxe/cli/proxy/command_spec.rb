describe Haxe::Cli::Proxy::Command do
  describe self do
    describe 'exists?' do
      subject { Haxe::Cli::Proxy::Command.exists? }
      it { is_expected.to be_truthy }
    end

    describe 'help' do
      it 'should returns Haxe::Cli::Proxy::Command::Result' do
        expect(Haxe::Cli::Proxy::Command.help).to be_kind_of(Haxe::Cli::Proxy::Command::Result)
      end
    end

    describe 'lib' do
      let(:lib_name) { 'test' }
      let(:version) { nil }

      it 'should returns Haxe::Cli::Proxy::Command::Result' do
        expect(Haxe::Cli::Proxy::Command.lib(lib_name, version)).to be_kind_of(Haxe::Cli::Proxy::Command::Result)
      end
    end

    describe 'xml' do
      let(:file) { 'test.xml' }

      it 'should returns Haxe::Cli::Proxy::Command::Result' do
        expect(Haxe::Cli::Proxy::Command.xml(file)).to be_kind_of(Haxe::Cli::Proxy::Command::Result)
      end
    end

    describe 'compile' do
      let(:options) do
        { main: 'Mina', target: Haxe::Cli::Proxy::Constants::TARGET_JS, output: 'output' }
      end

      it 'should returns Haxe::Cli::Proxy::Command::Result' do
        expect(Haxe::Cli::Proxy::Command.compile(options)).to be_kind_of(Haxe::Cli::Proxy::Command::Result)
      end
    end
  end

  describe Haxe::Cli::Proxy::Command::Result do
    subject { Haxe::Cli::Proxy::Command::Result.new %w(a b c) }
    it { should respond_to(:stdout) }
    it { should respond_to(:stderr) }
    it { should respond_to(:status) }
  end
end