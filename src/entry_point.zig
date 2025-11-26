const root = @import("root.zig");

pub const Request = extern struct {
    id: [4]u64 = root.id(0x13d86c035a1cd3e1, 0x2b0caa89d8f3026a),
    revision: u64 = 0,
    response: ?*Response = null,
    entry: EntryPoint,
};

pub const Response = extern struct {
    revision: u64,
};

pub const EntryPoint = *const fn () callconv(.c) noreturn;
