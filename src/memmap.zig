const root = @import("root.zig");

pub const Request = extern struct {
    id: [4]u64 = root.id(0x67cf3d9d378a806f, 0xe304acdfc50c3c62),
    revision: u64 = 0,
    response: ?*Response = null,
};

pub const Response = extern struct {
    revision: u64,
    entry_count: u64,
    entries: [*]*Entry,
};

pub const Entry = extern struct {
    base: u64,
    length: u64,
    type: Type,
};

pub const Type = enum(u64) {
    usable = 0,
    reserved = 1,
    acpi_reclaimable = 2,
    acpi_nvs = 3,
    bad_memory = 4,
    bootloader_reclaimable = 5,
    executable_and_modules = 6,
    framebuffer = 7,
    acpi_tables = 8,
};
