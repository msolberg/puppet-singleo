require 'spec_helper'
describe 'singleo' do

  context 'with defaults for all parameters' do
    it { should contain_class('singleo') }
  end
end
