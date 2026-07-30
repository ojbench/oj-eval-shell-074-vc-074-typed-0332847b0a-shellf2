// Minimal stub CPU for ACM RISCV-CPU harness
// Provides the expected interface but performs no operations.
// This is intended to compile with the standard testbench but will not pass tests.

module cpu(
    input  wire        clk_in,        // system clock signal
    input  wire        rst_in,        // reset signal
    input  wire        rdy_in,        // ready signal, pause cpu when low

    input  wire [7:0]  mem_din,       // data input bus
    output wire [7:0]  mem_dout,      // data output bus
    output wire [31:0] mem_a,         // address bus (only 17:0 is used)
    output wire        mem_wr,        // write/read signal (1 for write)

    output wire        io_buffer_full // 1 if io buffer is full
);

    // Keep everything stable to avoid X propagation in sim
    assign mem_dout = 8'b0;
    assign mem_a    = 32'b0;
    assign mem_wr   = 1'b0;

    // Report IO buffer never full so testbench won't stall due to I/O backpressure
    assign io_buffer_full = 1'b0;

endmodule
