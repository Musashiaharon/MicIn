module ml505top (
  input  [4:0]  GPIO_COMPSW,
  output [7:0]  GPIO_LED,

  input     AUDIO_SDATA_OUT,
  output    AUDIO_SDATA_IN,
  input     AUDIO_BIT_CLK,
  input     AUDIO_SYNC,
  output    FLASH_AUDIO_RESET_B,

  input         CLK_33MHZ_FPGA
);
  
  wire Clock;
  BUFG ClockBuf(
    .I(CLK_33MHZ_FPGA), 
    .O(Clock));

  // TEMP
  assign AUDIO_SDATA_IN = 0;
  assign FLASH_AUDIO_RESET_B = 1; // active low

  reg [31:0] counter;

  LogGraph #(.MSB(29)) lg ( // divide by 4
    .I(counter),
    .O(GPIO_LED)
  );

  always @(posedge Clock) begin
        counter <= counter + 1;
  end
endmodule
