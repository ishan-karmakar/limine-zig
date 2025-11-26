const root = @import("root");

pub const Request = extern struct {
    id: [4]u64 = root.id(0x5ceba5163eaaf6d6, 0x0a6981610cf65fcc),
    revision: u64 = 0,
    response: ?*Response = null,
};

pub const Response = extern struct {
    revision: u64,
    address: u64,
};
