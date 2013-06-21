module Vhd::Library
  extend FFI::Library
  ffi_lib "libvhd.so.0.1.1"
  attach_function :vhd_create, [ :string, :uint64, :int, :uint64, :uint ], :int

  HD_TYPE_FIXED   = 2
  HD_TYPE_DYNAMIC = 3

  def self.create_dynamic_disk(name, size_in_gb)
    size_in_bytes = self.size_in_bytes(size_in_gb)

    vhd_create(name, size_in_bytes, HD_TYPE_DYNAMIC, 0, 0)
  end

  def self.create_fixed_disk(name, size_in_gb)
    size_in_bytes = self.size_in_bytes(size_in_gb)

    vhd_create(name, size_in_bytes, HD_TYPE_FIXED, 0, 2)
  end

  def self.size_in_bytes(size_in_gb)
    size_in_gb * 1024 * 1024 * 1024
  end
end
