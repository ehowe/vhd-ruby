module Vhd::Library
  extend FFI::Library
  ffi_lib "libvhd.so.0.1.1"
  attach_function :vhd_create, [ :string, :uint64, :int, :uint64, :uint ], :int
  # vhd_open( Vhd::Context object, #file_name, #flags )
  attach_function :vhd_open, [ Vhd::Context.ptr, :string, :int ], :int
  attach_function :vhd_read_footer, [ Vhd::Footer.ptr, :pointer, :bool ], :int

  HD_TYPE_FIXED   = 2
  HD_TYPE_DYNAMIC = 3

  VALID_TYPES = [:fixed, :dynamic]

  def self.create(options={})
    raise "Invalid disk type" unless VALID_TYPES.include?(options[:type])

    size_in_bytes = self.size_in_bytes(options[:size])

    if options[:type] == :fixed
      vhd_create(options[:name], size_in_bytes, HD_TYPE_FIXED, 0, 2)
    elsif options[:type] == :dynamic
      vhd_create(options[:name], size_in_bytes, HD_TYPE_DYNAMIC, 0, 0)
    end
  end

  def self.size_in_bytes(size_in_gb)
    size_in_gb * 1024 * 1024 * 1024
  end
end
