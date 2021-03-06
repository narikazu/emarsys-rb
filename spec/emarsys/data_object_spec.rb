require 'spec_helper'

describe Emarsys::DataObject do
  context "as a class" do

    describe '.get' do
      it "delegates to the instance request method" do
        allow_any_instance_of(Emarsys::DataObject).to receive(:request).with(nil, 'get', 'test_method', {}).and_return(nil)
        Emarsys::DataObject.get(nil, 'test_method', {})
      end

      it "transfers params to specific emarsys params format" do
        allow_any_instance_of(Emarsys::DataObject).to receive(:request).with(nil, 'get', 'test_method/?a=1&b=2', {}).and_return(nil)
        Emarsys::DataObject.get(nil, 'test_method', {'a' => 1, 'b' => 2})
      end
    end

    describe '.post' do
      it "delegates to the instance request method" do
        allow_any_instance_of(Emarsys::DataObject).to receive(:request).with(nil, 'post', 'test_method', {}).and_return(nil)
        Emarsys::DataObject.post(nil, 'test_method', {})
      end
    end

    describe '.put' do
      it "delegates to the instance request method" do
        allow_any_instance_of(Emarsys::DataObject).to receive(:request).with(nil, 'put', 'test_method', {}).and_return(nil)
        Emarsys::DataObject.put(nil, 'test_method', {})
      end
    end

    describe '.delete' do
      it "delegates to the instance request method" do
        allow_any_instance_of(Emarsys::DataObject).to receive(:request).with(nil, 'delete', 'test_method', {}).and_return(nil)
        Emarsys::DataObject.delete(nil, 'test_method', {})
      end
    end

    describe '.parameterize_params' do
      it "converts hash to params string" do
        params = {"a" => 1, "b" => 2, "c" => 3}
        expect(Emarsys::DataObject.parameterize_params(params)).to eq("?a=1&b=2&c=3")
      end

      it "url_encodes params" do
        params = {"email" => "best/email@mail.org"}
        expect(Emarsys::DataObject.parameterize_params(params)).to eq("?email=best%2Femail%40mail.org")
      end
    end
  end

  context "as an instance" do
    let(:data_object) { Emarsys::DataObject.new }

    it "provides a simple #request that delegates to Emarsys::Request" do
      allow_any_instance_of(Emarsys::Request).to receive(:send_request).and_return(nil)
      data_object.request(nil, 'get', 'test_method', {})
    end
  end
end
