require File.expand_path('../../../../../spec_helper', __FILE__)
require 'net/http'
require File.expand_path('../fixtures/http_server', __FILE__)

describe "Net::HTTP#trace" do
  before(:all) do
    NetHTTPSpecs.start_server
  end

  after(:all) do
    NetHTTPSpecs.stop_server
  end

  before(:each) do
    @http = Net::HTTP.start("127.0.0.1", NetHTTPSpecs.server_port)
  end

  it "sends a TRACE request to the passed path and returns the response" do
    response = @http.trace("/request")
    response.body.should == "Request type: TRACE"
  end

  it "returns a Net::HTTPResponse" do
    @http.trace("/request").should be_kind_of(Net::HTTPResponse)
  end
end
