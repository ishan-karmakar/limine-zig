const root = @import("root");

pub const Request = extern struct {
    id: [4]u64 = root.id(0xc5e77b6b397e7b43, 0x27637845accdcf3c),
    revision: u64 = 0,
    response: ?*Response = null,
};

pub const Response = extern struct {
    revision: u64,
    address: u64,
};
