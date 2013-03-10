module LogGraph (
    input [31:0] I,
    output [7:0] O
);
    parameter MSB  = 31;

    genvar i;
    generate 
      for(i=0; i<8; i=i+1) begin:lights
        assign O[i] = |{I[MSB:MSB-i]};
      end
    endgenerate

endmodule
