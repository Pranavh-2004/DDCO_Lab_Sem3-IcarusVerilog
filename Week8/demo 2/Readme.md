# Week 8: Problem Statement

## Program: Microprocessor Control Logic - 2 (Load and Jump Instructions)

**Aim**: Enhance the control logic to implement `load` and `jump` instructions by modifying the data-path and control signals.

### Functional Requirements:

- **Load Instruction**: Transfer data from RAM to a register using the `sel` control signal.
- **Jump Instruction**: Modify the Program Counter (PC) using an offset if the ALU's `cout` is high.

### Control Signals:

- `sel`: Enables RAM data input for the register file during load.
- `jump`: Activates offset subtraction from PC during jump.
- `pc_inc`: Increment PC during instruction execution.

### FSM Adjustments:

- **Load Instruction**:
  - Requires three clock cycles.
  - `pc_inc` asserted twice.
- **Jump Instruction**:
  - Requires two clock cycles.
  - PC increment followed by offset subtraction if `cout` is 1.

### Notes:

- Ensure `inc` and `sub` signals are not asserted simultaneously.
- Modify `control_logic` to generate `sel` and `jump` outputs for the new instructions.
