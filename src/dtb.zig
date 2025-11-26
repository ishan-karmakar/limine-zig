const root = @import("root.zig");

pub const Request = extern struct {
    id: [4]u64 = root.id(0xb40ddb48fb54bac7, 0x545081493f81ffb7),
    revision: u64 = 0,
    response: ?*Response = null,
};

pub const Response = extern struct {
    revision: u64,
    dtb_ptr: *anyopaque,
};
