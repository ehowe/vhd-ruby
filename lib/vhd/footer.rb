module Vhd
  class Footer < FFI::Struct
    layout :cookie, [:char, 8],
      :features, :uint32,
      :ff_version, :uint32,
      :data_offset, :uint64,
      :timestamp, :uint32,
      :crtr_app, [:char, 4],
      :crtr_ver, :uint32,
      :crtr_os, :uint32,
      :orig_size, :uint64,
      :curr_size, :uint64,
      :geometry, :uint32,
      :checksum, :uint32,
      :uuid, :string,
      :saved, :char,
      :hidden, :char,
      :reserved, [:char, 426]
  end
end
