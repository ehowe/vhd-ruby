module Vhd
  class ManagedPointer < FFI::ManagedStruct
    def self.release(ptr)
      Vhd::Library.free_object(ptr)
    end
  end
end
