const root = @import("root");

pub const Request = extern struct {
    id: [4]u64 = root.id(0x7df62a431d6872d5, 0xa4fcdfb3e57306c8),
    revision: u64 = 0,
    response: ?*Response = null,
};

pub const Response = extern struct {
    revision: u64,
    memmap: *anyopaque,
    memmap_size: u64,
    desc_size: u64,
    desc_version: u64,
};
