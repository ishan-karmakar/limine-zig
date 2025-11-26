const root = @import("root");

pub const Request = extern struct {
    id: [4]u64 = root.id(0x224ef0460a8e8926, 0xe1cb0fc25f46ea3d),
    revision: u64 = 0,
    response: ?*Response = null,
    stack_size: u64,
};

pub const Response = extern struct {
    revision: u64,
};
