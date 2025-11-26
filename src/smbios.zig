const root = @import("root.zig");

pub const Request = extern struct {
    id: [4]u64 = root.id(0x9e9046f11e095391, 0xaa4a520fefbde5ee),
    revision: u64 = 0,
    response: ?*Response = null,
};

pub const Response = extern struct {
    revision: u64,
    entry_32: u64,
    entry_64: u64,
};
