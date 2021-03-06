require 'spec_helper'

describe FigNewton do
  context "when asking for data" do
    it "should retrieve the data by a key named after the method called" do
      FigNewton.yml_directory = 'conf'
      yml_mock = double('yaml')
      YAML.should_receive(:load_file).with('conf/test').and_return(yml_mock)
      yml_mock.should_receive(:[]).with('desired_data').and_return('information')
      FigNewton.load('test')
      FigNewton.desired_data.should == 'information'
    end
  end
end

