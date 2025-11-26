const root = @import("root");

pub const Request = extern struct {
    id: [4]u64 = root.id(0x4b161536e598651e, 0xb390ad4a2f1f303a),
    revision: u64 = 0,
    response: ?*Response = null,
};

pub const Response = extern struct {
    revision: u64,
    cmdline: [*:0]u8,
};
