# Week 7: Problem Statement

## Program 1: Microprocessor Control Logic - 1

**Aim**: Design the control logic for a 16-bit microprocessor to handle arithmetic and logic instructions using a finite state machine (FSM). The microprocessor components involved are:

- ALU
- Register File
- Program Counter (PC)
- Instruction Register (IR)

### Functional Requirements:

- **Instruction Fetch**: Fetch the instruction from memory.
- **Instruction Decode/Execute**: Decode the fetched instruction and execute it with the ALU.
- **FSM Control**: Manage control signals for fetching, decoding, and executing instructions.

### Control Signals:

- `rd_addr_a`, `rd_addr_b`: Read addresses for operands A and B.
- `wr_addr`: Write address for the register file.
- `op`: ALU operation.
- `pc_inc`: Program Counter increment.
- `load_ir`: Load instruction register.
- `wr_reg`: Write enable for the register file.
