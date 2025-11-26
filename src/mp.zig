const root = @import("root.zig");
const arch = @import("builtin").cpu.arch;

pub const Request = extern struct {
    id: [4]u64 = root.id(0x95a67b819a1b857e, 0xa0b61b723b6a73e0),
    revision: u64,
    response: ?*Response = null,
    flags: Flags,
};

pub const Response = switch (arch) {
    .x86_64 => extern struct {
        revision: u64,
        flags: Flags,
        bsp_lapic_id: u32,
        cpu_count: u64,
        cpus: [*]*Info,

        pub inline fn get_cpus(self: @This()) []*Info {
            return self.cpus[0..self.cpu_count];
        }
    },
    .aarch64 => extern struct {
        revision: u64,
        flags: u64,
        bsp_mpidr: u64,
        cpu_count: u64,
        cpus: [*]*Info,

        pub inline fn get_cpus(self: @This()) []*Info {
            return self.cpus[0..self.cpu_count];
        }
    },
    .riscv64 => extern struct {
        revision: u64,
        flags: u64,
        bsp_hartid: u64,
        cpu_count: u64,
        cpus: [*]*Info,

        pub inline fn get_cpus(self: @This()) []*Info {
            return self.cpus[0..self.cpu_count];
        }
    },
    else => @compileError("Unsupported architecture"),
};

pub const Info = switch (arch) {
    .x86_64 => extern struct {
        processor_id: u32,
        lapic_id: u32,
        reserved: u64,
        goto_address: GotoAddress,
        extra_argument: u64,
    },
    .aarch64 => extern struct {
        processor_id: u32,
        reserved: u32,
        mpidr: u64,
        reserved1: u64,
        goto_address: GotoAddress,
        extra_argument: u64,
    },
    .riscv64 => extern struct {
        processor_id: u64,
        hartid: u64,
        reserved: u64,
        goto_address: GotoAddress,
        extra_argument: u64,
    },
    else => @compileError("Unsupported architecture"),
};

pub const GotoAddress = *const fn (*Info) callconv(.c) noreturn;

pub const Flags = switch (arch) {
    .x86_64 => packed struct(u32) {
        x2apic: bool = false,
        reserved: u31 = 0,
    },
    .aarch64, .riscv64, .loongarch64 => packed struct(u64) {},
    else => @compileError("Unsupported architecture"),
};
