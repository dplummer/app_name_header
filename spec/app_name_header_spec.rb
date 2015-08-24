require 'spec_helper'

describe AppNameHeader do
  it 'has a version number' do
    expect(AppNameHeader::VERSION).not_to be nil
  end
end
