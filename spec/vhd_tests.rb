require 'spec_helper'

describe "vhds" do
  before(:each) do
    @file_name = "/tmp/#{Faker::Name.first_name}"
  end

  let(:file_name) { @file_name }

  it "should create a dynamic vhd" do
    Vhd::Library.create_dynamic_disk(file_name, 0.1)
    File.size(file_name).should == 3584
  end

  it "should create a fixed vhd" do
    Vhd::Library.create_fixed_disk(file_name, 0.1)
    File.size(file_name).should == 109052416
  end

  after(:each) do
    FileUtils.rm_f(@file_name)
  end
end
