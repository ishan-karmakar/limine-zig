const root = @import("root.zig");

pub const Request = extern struct {
    id: [4]u64 = root.id(0x1369359f025525f9, 0x2ff2a56178391bb6),
    revision: u64 = 0,
    response: ?*Response = null,
};

pub const Response = extern struct {
    revision: u64,
    bsp_hartid: u64,
};
