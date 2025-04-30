module lfsr_tb;

  reg clk;
  reg reset;

  wire [3:0] lfsr_o;

  lfsr LFSR_INST (
    .clk(clk),
    .reset(reset),
    .lfsr_o(lfsr_o)
  );

  // Declare variables before procedural blocks
  integer i;

  always begin
    clk = 1'b1;
    #5;
    clk = 1'b0;
    #5;
  end

  initial begin
    $dumpfile("lfsr.vcd");
    $dumpvars(0, lfsr_tb);

    reset = 1'b1;
    @(posedge clk);
    reset = 1'b0;

    // Loop to simulate for 32 clock cycles
    for (i = 0; i < 32; i = i + 1)
      @(posedge clk);

    $finish;
  end

endmodule