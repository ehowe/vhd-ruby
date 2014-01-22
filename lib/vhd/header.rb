module Vhd
  class Header < FFI::Struct
    #char        cookie[8];       /* Should contain "cxsparse"                    */
    #uint64_t    data_offset;     /* Byte offset of next record. (Unused) 0xffs   */
    #uint64_t    table_offset;    /* Absolute offset to the BAT.                  */
    #uint32_t    hdr_ver;         /* Version of the dd_hdr (major,minor)          */
    #uint32_t    max_bat_size;    /* Maximum number of entries in the BAT         */
    #uint32_t    block_size;      /* Block size in bytes. Must be power of 2.     */
    #uint32_t    checksum;        /* Header checksum.  1's comp of all fields.    */
    #uuid_t      prt_uuid;        /* ID of the parent disk.                       */
    #uint32_t    prt_ts;          /* Modification time of the parent disk         */
    #uint32_t    res1;            /* Reserved.                                    */
    #char        prt_name[512];   /* Parent unicode name.                         */
    #struct prt_loc loc[8];  /* Parent locator entries.                      */
    #char        res2[256];       /* Reserved.                                    */

    layout :cookie, [:char, 8],  # this needs to be limited to 8
      :data_offset, :uint64,
      :table_offset, :uint64,
      :hdr_ver, :uint32,
      :max_bat_size, :uint32,
      :block_size, :uint32,
      :checksum, :uint32,
      :prt_uuid, :string,
      :prt_ts, :uint32,
      :res1, :uint32,
      :prt_name, [:char, 512],
      :loc, Vhd::ParentLocation.ptr,
      :res2, [:char, 256]
  end
end
