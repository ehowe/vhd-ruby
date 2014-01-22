module Vhd
  class Context < FFI::Struct
    layout :fd, :int,
      :file, :string,
      :oflags, :int,
      :is_block, :int,
      :spb, :uint32,
      :bm_secs, :uint32,
      :header, Vhd::Header.ptr,
      :footer, Vhd::Footer.ptr,
      :bat, Vhd::Bat.ptr,
      :batmap, Vhd::Batmap.ptr,
      :next, :pointer,
      :custom_parent, :string
  end
end
