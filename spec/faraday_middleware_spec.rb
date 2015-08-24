require 'spec_helper'

describe AppNameHeader::FaradayMiddleware do
  class TestAppWithOnComplete
    attr_accessor :response_env, :do_this_before_complete

    def call(_request_env)
      self
    end

    def on_complete(&block)
      do_this_before_complete.call if do_this_before_complete
      block.call(response_env)
      self
    end
  end

  let(:app) { ->(env) { env } }
  let(:env) { { request_headers: {} } }
  let(:app_name) { 'derper' }

  subject { described_class.new(app, name: app_name) }

  describe '#call' do
    it 'calls the app' do
      expect(app).to receive(:call).with(env).and_return(app)
      subject.call(env)
    end

    it 'sets the app name header' do
      subject.call(env)
      expect(env[:request_headers]['X-App-Name']).to eq('derper')
    end
  end
end
