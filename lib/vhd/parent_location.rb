module Vhd
  class ParentLocation < FFI::Struct
    layout :code, :uint32,
      :data_space, :uint32,
      :data_len, :uint32,
      :res, :uint32,
      :data_offset, :uint64
  end
end
