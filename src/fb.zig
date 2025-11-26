const root = @import("root.zig");

pub const Request = extern struct {
    id: [4]u64 = root.id(0x9d5827dcd881dd75, 0xa3148604f6fab11b),
    revision: u64 = 1,
    response: ?*Response = null,
};

pub const Response = extern struct {
    revision: u64,
    fb_count: u64,
    framebuffers: [*]*Framebuffer,
};

pub const Framebuffer = extern struct {
    address: *anyopaque,
    width: u64,
    height: u64,
    pitch: u64,
    bpp: u16,
    memory_model: MemoryModel,
    red_mask_size: u8,
    red_mask_shift: u8,
    green_mask_size: u8,
    green_mask_shift: u8,
    blue_mask_size: u8,
    blue_mask_shift: u8,
    unused: [7]u8,
    edid_size: u64,
    edid: *anyopaque,

    // Response revision 1
    mode_count: u64,
    modes: [*]*VideoMode,
};

pub const MemoryModel = enum(u8) {
    rgb = 1,
};

pub const VideoMode = extern struct {
    pitch: u64,
    width: u64,
    height: u64,
    bpp: u16,
    memory_model: MemoryModel,
    red_mask_size: u8,
    red_mask_shift: u8,
    green_mask_size: u8,
    green_mask_shift: u8,
    blue_mask_size: u8,
    blue_mask_shift: u8,
};
