const root = @import("root.zig");
const arch = @import("builtin").cpu.arch;

pub const Request = extern struct {
    id: [4]u64 = root.id(0x95c1a0edab0944cb, 0xa4e5cb3842f7488a),
    revision: u64 = 0,
    response: ?*Response = null,
    mode: Mode = .default,
    max_mode: Mode = .max,
    min_mode: Mode = .min,
};

pub const Response = extern struct {
    revision: u64,
    mode: Mode,
};

pub const Mode = switch (arch) {
    .x86_64, .aarch64 => enum(u64) {
        @"4",
        @"5",

        const min = .@"4";
        const max = .@"5";
        const default = .@"4";
    },
    .riscv64 => enum(u64) {
        sv39,
        sv48,
        sv57,

        const min = .sv39;
        const max = .sv57;
        const default = .sv48;
    },
    .loongarch64 => enum(u64) {
        @"4",

        const min = .@"4";
        const max = .@"4";
        const default = .@"4";
    },
    else => @compileError("Unsupported architecture"),
};
