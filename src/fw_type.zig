const root = @import("root");

pub const Type = enum(u64) {
    x86_bios = 0,
    uefi32 = 1,
    uefi64 = 2,
    sbi = 3,
};

pub const Request = extern struct {
    id: [4]u64 = root.id(0x8c2f75d90bef28a8, 0x7045a4688eac00c3),
    revision: u64 = 0,
    response: ?*Response = null,
};

pub const Response = extern struct {
    revision: u64,
    firmware_type: Type,
};
