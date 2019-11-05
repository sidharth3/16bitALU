/*
   This file was generated automatically by the Mojo IDE version B1.3.6.
   Do not edit this file directly. Instead edit the original Lucid source.
   This is a temporary file and any changes made to it will be destroyed.
*/

module testbitshifter_5 (
    input clk,
    input rst,
    input start,
    output reg [1:0] status
  );
  
  
  
  reg [4:0] M_test_counter_d, M_test_counter_q = 1'h0;
  
  localparam IDLE_state = 2'd0;
  localparam TEST_state = 2'd1;
  localparam PASS_state = 2'd2;
  localparam FAIL_state = 2'd3;
  
  reg [1:0] M_state_d, M_state_q = IDLE_state;
  
  wire [16-1:0] M_shifter1_c;
  reg [6-1:0] M_shifter1_alufn;
  reg [16-1:0] M_shifter1_a;
  reg [16-1:0] M_shifter1_b;
  bitshifter_12 shifter1 (
    .alufn(M_shifter1_alufn),
    .a(M_shifter1_a),
    .b(M_shifter1_b),
    .c(M_shifter1_c)
  );
  
  always @* begin
    M_state_d = M_state_q;
    M_test_counter_d = M_test_counter_q;
    
    status = 1'h0;
    M_shifter1_a = 1'h0;
    M_shifter1_b = 1'h0;
    M_shifter1_alufn = 6'h00;
    if (start == 1'h0) begin
      M_state_d = IDLE_state;
    end
    
    case (M_state_q)
      IDLE_state: begin
        status = 1'h0;
        if (start == 1'h1) begin
          M_state_d = TEST_state;
        end
      end
      TEST_state: begin
        
        case (M_test_counter_q)
          5'h00: begin
            M_shifter1_alufn = 6'h20;
            M_shifter1_a = 16'hffff;
            M_shifter1_b = 16'h000f;
            if (M_shifter1_c != 16'h8000) begin
              M_state_d = FAIL_state;
            end
          end
          5'h01: begin
            M_shifter1_alufn = 6'h21;
            M_shifter1_a = 16'hffff;
            M_shifter1_b = 16'h000f;
            if (M_shifter1_c != 16'h0001) begin
              M_state_d = FAIL_state;
            end
          end
          5'h02: begin
            M_shifter1_alufn = 6'h21;
            M_shifter1_a = 16'hffff;
            M_shifter1_b = 16'h000f;
            if (M_shifter1_c != 16'hffff) begin
              M_state_d = FAIL_state;
            end
          end
          5'h03: begin
            M_shifter1_alufn = 6'h20;
            M_shifter1_a = 16'h0000;
            M_shifter1_b = 16'h000f;
            if (M_shifter1_c != 16'h0000) begin
              M_state_d = FAIL_state;
            end
          end
          5'h04: begin
            M_shifter1_alufn = 6'h21;
            M_shifter1_a = 16'h0000;
            M_shifter1_b = 16'h000f;
            if (M_shifter1_c != 16'h0000) begin
              M_state_d = FAIL_state;
            end
          end
          5'h05: begin
            M_shifter1_alufn = 6'h23;
            M_shifter1_a = 16'h0000;
            M_shifter1_b = 15'h000f;
            if (M_shifter1_c != 16'h0000) begin
              M_state_d = FAIL_state;
            end
          end
          5'h06: begin
            M_shifter1_alufn = 6'h20;
            M_shifter1_a = 16'habcd;
            M_shifter1_b = 16'h0008;
            if (M_shifter1_c != 16'hcd00) begin
              M_state_d = FAIL_state;
            end
          end
          5'h07: begin
            M_shifter1_alufn = 6'h21;
            M_shifter1_a = 16'hcdef;
            M_shifter1_b = 16'h0008;
            if (M_shifter1_c != 16'h00cd) begin
              M_state_d = FAIL_state;
            end
          end
          5'h08: begin
            M_shifter1_alufn = 6'h23;
            M_shifter1_a = 16'h3005;
            M_shifter1_b = 16'h0008;
            if (M_shifter1_c != 16'h0030) begin
              M_state_d = FAIL_state;
            end
          end
          5'h1f: begin
            M_state_d = PASS_state;
          end
        endcase
      end
      PASS_state: begin
        status = 1'h1;
      end
      FAIL_state: begin
        status = 2'h2;
      end
    endcase
    M_test_counter_d = M_test_counter_q + 1'h1;
  end
  
  always @(posedge clk) begin
    if (rst == 1'b1) begin
      M_state_q <= 1'h0;
    end else begin
      M_state_q <= M_state_d;
    end
  end
  
  
  always @(posedge clk) begin
    if (rst == 1'b1) begin
      M_test_counter_q <= 1'h0;
    end else begin
      M_test_counter_q <= M_test_counter_d;
    end
  end
  
endmodule