require 'spec_helper'

describe "vhds" do
  before(:each) do
    #@file_name = "/tmp/#{Faker::Name.first_name}"
    @file_name = "#{Faker::Name.first_name.downcase}.vhd"
  end

  let(:file_name) { @file_name }

  it "should create a fixed vhd" do
    disk = Vhd::Library.new(type: :fixed, size: 1, name: file_name)
    disk.create
    ap @file_name
  end

  after(:each) do
    #FileUtils.rm_f(@file_name)
  end
end
