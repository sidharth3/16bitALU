/*
   This file was generated automatically by the Mojo IDE version B1.3.6.
   Do not edit this file directly. Instead edit the original Lucid source.
   This is a temporary file and any changes made to it will be destroyed.
*/

module testadd_3 (
    input clk,
    input rst,
    input start,
    output reg [1:0] status
  );
  
  
  
  reg [3:0] M_test_counter_d, M_test_counter_q = 1'h0;
  
  localparam IDLE_state = 2'd0;
  localparam TEST_state = 2'd1;
  localparam PASS_state = 2'd2;
  localparam FAIL_state = 2'd3;
  
  reg [1:0] M_state_d, M_state_q = IDLE_state;
  
  wire [16-1:0] M_adder_sumresult;
  wire [1-1:0] M_adder_z;
  wire [1-1:0] M_adder_v;
  wire [1-1:0] M_adder_n;
  wire [1-1:0] M_adder_car;
  reg [6-1:0] M_adder_alufn;
  reg [16-1:0] M_adder_a;
  reg [16-1:0] M_adder_b;
  adder_9 adder (
    .alufn(M_adder_alufn),
    .a(M_adder_a),
    .b(M_adder_b),
    .sumresult(M_adder_sumresult),
    .z(M_adder_z),
    .v(M_adder_v),
    .n(M_adder_n),
    .car(M_adder_car)
  );
  
  always @* begin
    M_state_d = M_state_q;
    M_test_counter_d = M_test_counter_q;
    
    status = 1'h0;
    M_adder_a = 1'h0;
    M_adder_b = 1'h0;
    M_adder_alufn = 6'h00;
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
          1'h0: begin
            M_adder_alufn = 6'h00;
            M_adder_a = 16'hffff;
            M_adder_b = 16'hffff;
            if (M_adder_sumresult != 16'hfffe) begin
              M_state_d = FAIL_state;
            end
          end
          1'h1: begin
            M_adder_alufn = 6'h00;
            M_adder_a = 16'h8000;
            M_adder_b = 16'hffff;
            if (M_adder_sumresult != 16'h7fff) begin
              M_state_d = FAIL_state;
            end
          end
          2'h2: begin
            M_adder_alufn = 6'h00;
            M_adder_a = 16'h0001;
            M_adder_b = 16'h0001;
            if (M_adder_sumresult != 16'h0002) begin
              M_state_d = FAIL_state;
            end
          end
          2'h3: begin
            M_adder_alufn = 6'h00;
            M_adder_a = 16'h7fff;
            M_adder_b = 16'h0001;
            if (M_adder_sumresult != 16'h8000) begin
              M_state_d = FAIL_state;
            end
          end
          3'h4: begin
            M_adder_alufn = 6'h00;
            M_adder_a = 16'h0002;
            M_adder_b = 16'hffff;
            if (M_adder_sumresult != 16'h0001) begin
              M_state_d = FAIL_state;
            end
          end
          3'h5: begin
            M_adder_alufn = 6'h00;
            M_adder_a = 16'hffff;
            M_adder_b = 16'h0002;
            if (M_adder_sumresult != 16'h0001) begin
              M_state_d = FAIL_state;
            end
          end
          3'h6: begin
            M_adder_alufn = 6'h01;
            M_adder_a = 16'h0001;
            M_adder_b = 16'hffff;
            if (M_adder_sumresult != 2'h2) begin
              M_state_d = FAIL_state;
            end
          end
          3'h7: begin
            M_adder_alufn = 6'h01;
            M_adder_a = 16'h7fff;
            M_adder_b = 16'hffff;
            if (M_adder_sumresult != 16'h8000) begin
              M_state_d = FAIL_state;
            end
          end
          4'h8: begin
            M_adder_alufn = 6'h01;
            M_adder_a = 16'hffff;
            M_adder_b = 16'h0001;
            if (M_adder_sumresult != 16'hfffe) begin
              M_state_d = FAIL_state;
            end
          end
          4'h9: begin
            M_adder_alufn = 6'h01;
            M_adder_a = 16'hfffc;
            M_adder_b = 16'h7fff;
            if (M_adder_sumresult != 16'h7ffd) begin
              M_state_d = FAIL_state;
            end
          end
          4'ha: begin
            M_adder_alufn = 6'h01;
            M_adder_a = 16'hffff;
            M_adder_b = 16'hffff;
            if (M_adder_sumresult != 1'h0) begin
              M_state_d = FAIL_state;
            end
          end
          4'hb: begin
            M_adder_alufn = 6'h01;
            M_adder_a = 16'h0001;
            M_adder_b = 16'h0001;
            if (M_adder_sumresult != 1'h0) begin
              M_state_d = FAIL_state;
            end
          end
          4'hc: begin
            M_adder_alufn = 6'h01;
            M_adder_a = 16'h0000;
            M_adder_b = 16'h0000;
            if (M_adder_sumresult != 1'h0) begin
              M_state_d = FAIL_state;
            end
          end
          4'hd: begin
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
      M_test_counter_q <= 1'h0;
    end else begin
      M_test_counter_q <= M_test_counter_d;
    end
  end
  
  
  always @(posedge clk) begin
    if (rst == 1'b1) begin
      M_state_q <= 1'h0;
    end else begin
      M_state_q <= M_state_d;
    end
  end
  
endmodule