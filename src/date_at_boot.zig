const root = @import("root");

pub const Request = extern struct {
    id: [4]u64 = root.id(0x502746e184c088aa, 0xfbc5ec83e6327893),
    revision: u64 = 0,
    response: ?*Response = null,
};

pub const Response = extern struct {
    revision: u64,
    timestamp: i64,
};
