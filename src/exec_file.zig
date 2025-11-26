const root = @import("root");

pub const Request = extern struct {
    id: [4]u64 = root.id(0xad97e90e83f1ed67, 0x31eb5d1c5ff23b69),
    revision: u64 = 0,
    response: ?*Response = null,
};

pub const Response = extern struct {
    revision: u64,
    executable_file: *root.File,
};
