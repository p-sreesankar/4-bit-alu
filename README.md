# 4-bit ALU

This project contains a simple 4-bit arithmetic logic unit implemented in Verilog. It is designed to perform basic arithmetic and logical operations using a 3-bit operation selector.

## Design

The ALU is defined in `alu.v` and has the following inputs and outputs:

- `a`: 4-bit input
- `b`: 4-bit input
- `op`: 3-bit operation selector
- `answer`: 4-bit output
- `carry_out`: 1-bit carry output

The module uses a combinational `always @(*)` block and a `case` statement to select the operation.

## Supported operations

| op value | Operation | Behavior |
| --- | --- | --- |
| `3'b000` | Addition | `answer = a + b`, with `carry_out` set from the addition |
| `3'b001` | Subtraction | `answer = a - b`, with `carry_out` set from the subtraction |
| `3'b010` | AND | `answer = a & b` |
| `3'b011` | OR | `answer = a | b` |
| `3'b100` | XOR | `answer = a ^ b` |
| default | Invalid op | `answer = 4'b0000` |

For all operations, `carry_out` is initialized to `0` before the case statement. It is only updated for the add and subtract operations.

## Testbench

The simulation is set up in `tb_alu.cpp` using Verilator.

It tests the following cases:

1. Add: `5 + 3 = 8`
2. Subtract: `10 - 4 = 6`
3. AND: `0xF & 0x3 = 0x3`
4. OR: `0x4 | 0x2 = 0x6`

The testbench also enables waveform dumping to `wave.vcd`.

## Files in this project

- `alu.v` - ALU implementation
- `tb_alu.cpp` - Verilator testbench
- `wave.vcd` - Generated waveform file from simulation
- `obj_dir/` - Generated Verilator build output

## Run the simulation

From the project folder, run:

```bash
verilator -Wall --cc alu.v --exe tb_alu.cpp --trace && make -C obj_dir -f Valu.mk Valu && ./obj_dir/Valu
```

This compiles the Verilog module, builds the testbench, and runs the simulation. The generated waveform is saved as `wave.vcd`.
