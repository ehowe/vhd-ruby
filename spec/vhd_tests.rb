require 'spec_helper'

describe "vhds" do
  before(:each) do
    @file_name = "/tmp/#{Faker::Name.first_name.downcase}.vhd"
  end

  let(:file_name) { @file_name }

  it "should create a dynamic vhd" do
    Vhd::Library.create(type: :dynamic, name: file_name, size: 0.1)
    File.size(file_name).should == 3584
  end

  it "should create a fixed vhd" do
    Vhd::Library.create(type: :fixed, name: file_name, size: 0.1)
    File.size(file_name).should == 109052416
  end

  context "with a vhd" do
    before(:each) do
      Vhd::Library.create(type: :fixed, name: file_name, size: 0.001)
    end

    it "should read a vhd file" do
      context = Vhd::Context.new
      binding.pry
      Vhd::Library.vhd_open(context, file_name, 0)
      file = context[:file]
      file.should == file_name
      Vhd::Library.vhd_close(context)
    end

    context "with an open VHD context" do
      before(:each) do
        @context = Vhd::Context.new
        Vhd::Library.vhd_open(@context, file_name, 0)
      end

      let(:context) { @context }

      it "should read a vhd's header" do
      end

      it "should read a vhd's footer" do
        context = Vhd::Context.new
        footer  = Vhd::Footer.new
        Vhd::Library.vhd_open(context, file_name, 0)
        footer = Vhd::Library.vhd_read_footer(context, footer, false)
      end

      after(:each) do
        Vhd::Library.vhd_close(@context)
      end
    end
  end

  after(:each) do
    FileUtils.rm_f(@file_name)
  end
end
