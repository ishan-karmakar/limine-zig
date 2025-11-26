const std = @import("std");

pub const BootloaderInfo = @import("bl_info.zig");
pub const ExecutableCmdline = @import("exec_cl.zig");
pub const FirmwareType = @import("fw_type.zig");
pub const StackSize = @import("stack_size.zig");
pub const HHDM = @import("hhdm.zig");
pub const Framebuffer = @import("fb.zig");
pub const PagingMode = @import("paging_mode.zig");
pub const MP = @import("mp.zig");
pub const MemoryMap = @import("memmap.zig");
pub const ExecutableFile = @import("exec_file.zig");
pub const Module = @import("module.zig");
pub const RSDP = @import("rsdp.zig");
pub const SMBIOS = @import("smbios.zig");
pub const EfiSystemTable = @import("efi_st.zig");
pub const EfiMemoryMap = @import("efi_mm.zig");
pub const DateAtBoot = @import("date_at_boot.zig");
pub const ExecutableAddress = @import("exec_addr.zig");
pub const RiscvBootHartId = @import("riscv_bsp_hartid.zig");

pub fn id(a: u64, b: u64) [4]u64 {
    return .{ 0xc7b1dd30df4c8b88, 0x0a82e883a194f07b, a, b };
}

pub const BaseRevision = extern struct {
    magic: [2]u64 = .{ 0xf9562b2d5c95a6c8, 0x6a7b384944536bdc },
    revision: u64,

    pub fn loaded_revision(self: @This()) u64 {
        return self.magic[1];
    }

    pub fn is_valid(self: @This()) bool {
        return self.magic[1] != 0x6a7b384944536bdc;
    }

    pub fn is_supported(self: @This()) bool {
        return self.revision == 0;
    }
};

pub const Uuid = extern struct {
    a: u32,
    b: u16,
    c: u16,
    d: [8]u8,
};

pub const MediaType = enum(u32) {
    generic = 0,
    optical = 1,
    tftp = 2,
};

pub const File = extern struct {
    revision: u64,
    address: *align(4096) anyopaque,
    size: u64,
    path: [*:0]u8,
    string: [*:0]u8,
    media_type: MediaType,
    unused: u32,
    tftp_ip: u32,
    tftp_port: u32,
    partition_index: u32,
    mbr_disk_id: u32,
    gpt_disk_uuid: Uuid,
    gpt_part_uuid: Uuid,
    part_uuid: Uuid,
};

comptime {
    std.testing.refAllDeclsRecursive(@This());
}
