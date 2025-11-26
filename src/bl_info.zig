const root = @import("root.zig");

pub const Request = extern struct {
    id: [4]u64 = root.id(0xf55038d8e2a1202f, 0x279426fcf5f59740),
    revision: u64 = 0,
    response: ?*Response = null,
};

pub const Response = extern struct {
    revision: u64,
    name: [*:0]u8,
    version: [*:0]u8,
};
