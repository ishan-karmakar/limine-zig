const root = @import("root.zig");

pub const Request = extern struct {
    id: [4]u64 = root.id(0x3e7e279702be32af, 0xca1c4f3bd1280cee),
    revision: u64 = 1,
    // Request revision 1
    internal_module_count: u64 = 0,
    internal_modules: ?[*]const *const InternalModule = null,
};

pub const Response = extern struct {
    revision: u64,
    module_count: u64,
    modules: [*]*root.File,
};

pub const InternalModule = extern struct {
    pub const Flags = packed struct(u64) {
        required: bool,
        compressed: bool,
        reserved: u62,
    };

    path: [*:0]const u8,
    string: [*:0]const u8,
    flags: Flags,
};
