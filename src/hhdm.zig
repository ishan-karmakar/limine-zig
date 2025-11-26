const root = @import("root.zig");

pub const Request = extern struct {
    id: [4]u64 = root.id(0x48dcf1cb8ad2b852, 0x63984e959a98244b),
    revision: u64 = 0,
    response: ?*Response = null,
};

pub const Response = extern struct {
    revision: u64,
    offset: u64,
};
