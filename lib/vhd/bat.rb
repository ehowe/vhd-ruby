module Vhd
  class Bat < FFI::Struct
    layout :spb, :uint32,
      :entries, :uint32,
      :bat, :uint32
  end
end
