require 'spec_helper.rb'

describe 'riemann' do
  context 'with defaults for all parameters' do
    it { should compile }
    it { should contain_class('riemann') }

    # Riemann tests
    it { should contain_package('riemann').with_ensure('latest') }
    it { should contain_service('riemann').with_ensure('running') }
    it { should contain_file('/etc/riemann/riemann.config') }
    it { should contain_file('/etc/sysconfig/riemann') }

  end
end
