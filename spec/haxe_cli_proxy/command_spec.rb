describe HaxeCliProxy::Command do
  describe 'exists?' do
    subject { HaxeCliProxy::Command.exists? }
    it { is_expected.to be_truthy }
  end

  describe 'execute' do
    let(:command) { 'echo text' }

    before do
      @result = HaxeCliProxy::Command.execute(command)
    end

    it 'should returns HaxeCliProxy::Command::Result' do
      expect(@result).to be_kind_of(HaxeCliProxy::Command::Result)
    end

    it 'should stdout include char "text"' do
      expect(@result.stdout).to match(/text/)
    end
  end

  describe 'help' do
    it 'should returns HaxeCliProxy::Command::Result' do
      expect(HaxeCliProxy::Command.help).to be_kind_of(HaxeCliProxy::Command::Result)
    end
  end

  describe 'lib' do
    let(:lib_name) { 'test' }
    let(:version) { nil }

    it 'should returns HaxeCliProxy::Command::Result' do
      expect(HaxeCliProxy::Command.lib(lib_name, version)).to be_kind_of(HaxeCliProxy::Command::Result)
    end
  end

  describe 'xml' do
    let(:file) { 'test.xml' }

    it 'should returns HaxeCliProxy::Command::Result' do
      expect(HaxeCliProxy::Command.xml(file)).to be_kind_of(HaxeCliProxy::Command::Result)
    end
  end

  describe 'compile' do
    let(:options) do
      { main: 'Mina', target: HaxeCliProxy::Constants::TARGET_JS, output: 'output' }
    end

    it 'should returns HaxeCliProxy::Command::Result' do
      expect(HaxeCliProxy::Command.compile(options)).to be_kind_of(HaxeCliProxy::Command::Result)
    end
  end
end