const root = @import("root");

pub const Request = extern struct {
    id: [4]u64 = root.id(0x71ba76863cc55f63, 0xb2644a48c516a487),
    revision: u64 = 0,
    response: ?*Response = null,
};

pub const Response = extern struct {
    revision: u64,
    physical_base: u64,
    virtual_base: u64,
};
