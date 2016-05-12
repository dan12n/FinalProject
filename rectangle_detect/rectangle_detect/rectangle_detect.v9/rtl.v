// ----------------------------------------------------------------------
//  HLS HDL:        Verilog Netlister
//  HLS Version:    2011a.126 Production Release
//  HLS Date:       Wed Aug  8 00:52:07 PDT 2012
// 
//  Generated by:   ymh15@EEWS104A-007
//  Generated date: Thu May 12 14:19:49 2016
// ----------------------------------------------------------------------

// 
// ------------------------------------------------------------------
//  Design Unit:    rectangle_detect_core_fsm
//  FSM Module
// ------------------------------------------------------------------


module rectangle_detect_core_fsm (
  clk, en, arst_n, fsm_output
);
  input clk;
  input en;
  input arst_n;
  output [3:0] fsm_output;
  reg [3:0] fsm_output;


  // FSM State Type Declaration for rectangle_detect_core_fsm_1
  parameter
    st_main = 2'd0,
    st_main_1 = 2'd1,
    st_main_2 = 2'd2,
    st_main_3 = 2'd3,
    state_x = 2'b00;

  reg [1:0] state_var;
  reg [1:0] state_var_NS;


  // Interconnect Declarations for Component Instantiations 
  always @(*)
  begin : rectangle_detect_core_fsm_1
    case (state_var)
      st_main : begin
        fsm_output = 4'b1;
        state_var_NS = st_main_1;
      end
      st_main_1 : begin
        fsm_output = 4'b10;
        state_var_NS = st_main_2;
      end
      st_main_2 : begin
        fsm_output = 4'b100;
        state_var_NS = st_main_3;
      end
      st_main_3 : begin
        fsm_output = 4'b1000;
        state_var_NS = st_main;
      end
      default : begin
        fsm_output = 4'b0000;
        state_var_NS = st_main;
      end
    endcase
  end

  always @(posedge clk or negedge arst_n) begin
    if ( ~ arst_n ) begin
      state_var <= st_main;
    end
    else if ( en ) begin
      state_var <= state_var_NS;
    end
  end

endmodule

// ------------------------------------------------------------------
//  Design Unit:    rectangle_detect_core
// ------------------------------------------------------------------


module rectangle_detect_core (
  clk, en, arst_n, vga_xy_rsc_mgc_in_wire_d, video_in_rsc_mgc_in_wire_d, x_top_left_rsc_mgc_in_wire_d,
      y_top_left_rsc_mgc_in_wire_d, width_rsc_mgc_in_wire_d, height_rsc_mgc_in_wire_d,
      video_out_rsc_mgc_out_stdreg_d, filled_rsc_mgc_out_stdreg_d, reset_rsc_mgc_in_wire_d
);
  input clk;
  input en;
  input arst_n;
  input [19:0] vga_xy_rsc_mgc_in_wire_d;
  input [29:0] video_in_rsc_mgc_in_wire_d;
  input [9:0] x_top_left_rsc_mgc_in_wire_d;
  input [9:0] y_top_left_rsc_mgc_in_wire_d;
  input [9:0] width_rsc_mgc_in_wire_d;
  input [9:0] height_rsc_mgc_in_wire_d;
  output [29:0] video_out_rsc_mgc_out_stdreg_d;
  reg [29:0] video_out_rsc_mgc_out_stdreg_d;
  output filled_rsc_mgc_out_stdreg_d;
  reg filled_rsc_mgc_out_stdreg_d;
  input reset_rsc_mgc_in_wire_d;


  // Interconnect Declarations
  wire [3:0] fsm_output;
  wire or_dcpl_20;
  reg [31:0] counter_sva;
  reg static_fill_1_sva;
  reg [19:0] io_read_vga_xy_rsc_d_cse_sva;
  reg [31:0] counter_sva_dfm;
  reg [9:0] slc_x_top_left_cse_sva;
  reg [9:0] slc_width_cse_sva;
  reg aif_1_slc_svs;
  reg land_2_lpi_1_dfm;
  reg else_2_slc_svs;
  reg and_1_itm;
  reg [9:0] mux_2_itm;
  reg [9:0] mux_3_itm;
  reg [9:0] mux_4_itm;
  wire [11:0] if_3_acc_6;
  wire [12:0] nl_if_3_acc_6;
  wire and_15_cse;
  wire and_16_cse;
  wire static_fill_1_sva_dfm_1_mx0w0;
  wire [31:0] counter_sva_2;
  wire [32:0] nl_counter_sva_2;
  wire land_2_sva_1;
  wire [27:0] else_2_if_slc_counter_2;
  wire aif_5_nor_cse;
  reg xeq;
  wire [10:0] if_3_acc_8_sg1;
  wire if_1_acc_7_itm_sg1;
  wire if_1_acc_9_itm_sg1;
  wire if_1_acc_4_itm_sg1;
  wire if_1_acc_itm_sg1;
  wire acc_itm_sg1;


  // Interconnect Declarations for Component Instantiations 
  rectangle_detect_core_fsm rectangle_detect_core_fsm_inst (
      .clk(clk),
      .en(en),
      .arst_n(arst_n),
      .fsm_output(fsm_output)
    );
  assign and_15_cse = if_1_acc_itm_sg1 & if_1_acc_4_itm_sg1 & if_1_acc_9_itm_sg1
      & if_1_acc_7_itm_sg1 & (fsm_output[0]);
  assign and_16_cse = (or_dcpl_20 | (~(if_1_acc_9_itm_sg1 & if_1_acc_7_itm_sg1)))
      & (fsm_output[0]);
  assign aif_5_nor_cse = ~((~ xeq) | (if_3_acc_6[11]));
  assign acc_itm_sg1 = readslicef_12_1_11(((conv_u2u_11_12(conv_u2u_10_11(~ (video_in_rsc_mgc_in_wire_d[9:0]))
      + conv_u2u_10_11(~ (video_in_rsc_mgc_in_wire_d[19:10]))) + conv_u2u_10_12(~
      (video_in_rsc_mgc_in_wire_d[29:20]))) + 12'b100111011111));
  assign if_1_acc_7_itm_sg1 = readslicef_12_1_11((({1'b1 , y_top_left_rsc_mgc_in_wire_d
      , 1'b1}) + conv_u2u_11_12({(~ (vga_xy_rsc_mgc_in_wire_d[19:10])) , 1'b1})));
  assign if_1_acc_9_itm_sg1 = readslicef_11_1_10(((readslicef_12_11_1((conv_u2u_11_12(conv_u2u_10_11(~
      y_top_left_rsc_mgc_in_wire_d) + conv_u2u_10_11(~ height_rsc_mgc_in_wire_d))
      + conv_u2u_10_12(vga_xy_rsc_mgc_in_wire_d[19:10])))) + 11'b10000000001));
  assign if_1_acc_4_itm_sg1 = readslicef_12_1_11((({1'b1 , x_top_left_rsc_mgc_in_wire_d
      , 1'b1}) + conv_u2u_11_12({(~ (vga_xy_rsc_mgc_in_wire_d[9:0])) , 1'b1})));
  assign static_fill_1_sva_dfm_1_mx0w0 = (static_fill_1_sva & (~(land_2_sva_1 & aif_5_nor_cse
      & else_2_slc_svs))) | land_2_lpi_1_dfm;
  assign if_1_acc_itm_sg1 = readslicef_11_1_10(((readslicef_12_11_1((conv_u2u_11_12(conv_u2u_10_11(~
      x_top_left_rsc_mgc_in_wire_d) + conv_u2u_10_11(~ width_rsc_mgc_in_wire_d))
      + conv_u2u_10_12(vga_xy_rsc_mgc_in_wire_d[9:0])))) + 11'b10000000001));
  assign nl_counter_sva_2 = counter_sva_dfm + 32'b1;
  assign counter_sva_2 = nl_counter_sva_2[31:0];
  assign land_2_sva_1 = ~(((io_read_vga_xy_rsc_d_cse_sva[9:0]) != (if_3_acc_8_sg1[9:0]))
      | (if_3_acc_8_sg1[10]));
  assign nl_if_3_acc_6 = conv_u2u_11_12({y_top_left_rsc_mgc_in_wire_d , 1'b1}) +
      conv_u2u_11_12({height_rsc_mgc_in_wire_d , 1'b1});
  assign if_3_acc_6 = nl_if_3_acc_6[11:0];
  assign if_3_acc_8_sg1 = readslicef_12_11_1((conv_u2u_11_12({slc_x_top_left_cse_sva
      , 1'b1}) + conv_u2u_11_12({slc_width_cse_sva , 1'b1})));
  assign else_2_if_slc_counter_2 = MUX_v_28_2_2({(counter_sva_dfm[31:4]) , (counter_sva_2[31:4])},
      and_1_itm);
  assign or_dcpl_20 = ~(if_1_acc_itm_sg1 & if_1_acc_4_itm_sg1);
  always @(posedge clk or negedge arst_n) begin
    if ( ~ arst_n ) begin
      mux_2_itm <= 10'b0;
      mux_3_itm <= 10'b0;
      mux_4_itm <= 10'b0;
      aif_1_slc_svs <= 1'b0;
      io_read_vga_xy_rsc_d_cse_sva <= 20'b0;
      slc_x_top_left_cse_sva <= 10'b0;
      counter_sva_dfm <= 32'b0;
      slc_width_cse_sva <= 10'b0;
      static_fill_1_sva <= 1'b0;
      filled_rsc_mgc_out_stdreg_d <= 1'b0;
      video_out_rsc_mgc_out_stdreg_d <= 30'b0;
      and_1_itm <= 1'b0;
      counter_sva <= 32'b0;
      else_2_slc_svs <= 1'b0;
      land_2_lpi_1_dfm <= 1'b0;
    end
    else begin
      if ( en ) begin
        mux_2_itm <= MUX1HOT_v_10_3_2({({{9{acc_itm_sg1}}, acc_itm_sg1}) , (video_in_rsc_mgc_in_wire_d[29:20])
            , mux_2_itm}, {and_15_cse , and_16_cse , (~ (fsm_output[0]))});
        mux_3_itm <= MUX1HOT_v_10_3_2({(signext_10_1(~ acc_itm_sg1)) , (video_in_rsc_mgc_in_wire_d[19:10])
            , mux_3_itm}, {and_15_cse , and_16_cse , (~ (fsm_output[0]))});
        mux_4_itm <= MUX1HOT_v_10_3_2({(signext_10_1(~ acc_itm_sg1)) , (video_in_rsc_mgc_in_wire_d[9:0])
            , mux_4_itm}, {and_15_cse , and_16_cse , (~ (fsm_output[0]))});
        aif_1_slc_svs <= MUX_s_1_2_2({if_1_acc_9_itm_sg1 , aif_1_slc_svs}, or_dcpl_20
            | (~ (fsm_output[0])));
        io_read_vga_xy_rsc_d_cse_sva <= MUX_v_20_2_2({vga_xy_rsc_mgc_in_wire_d ,
            io_read_vga_xy_rsc_d_cse_sva}, fsm_output[1]);
        slc_x_top_left_cse_sva <= MUX_v_10_2_2({x_top_left_rsc_mgc_in_wire_d , slc_x_top_left_cse_sva},
            fsm_output[1]);
        counter_sva_dfm <= counter_sva & (signext_32_1(~ reset_rsc_mgc_in_wire_d));
        slc_width_cse_sva <= MUX_v_10_2_2({width_rsc_mgc_in_wire_d , slc_width_cse_sva},
            fsm_output[1]);
        static_fill_1_sva <= MUX_s_1_2_2({static_fill_1_sva , static_fill_1_sva_dfm_1_mx0w0},
            fsm_output[2]);
        filled_rsc_mgc_out_stdreg_d <= MUX_s_1_2_2({filled_rsc_mgc_out_stdreg_d ,
            static_fill_1_sva_dfm_1_mx0w0}, fsm_output[2]);
        video_out_rsc_mgc_out_stdreg_d <= MUX_v_30_2_2({video_out_rsc_mgc_out_stdreg_d
            , ({mux_2_itm , mux_3_itm , mux_4_itm})}, fsm_output[2]);
        and_1_itm <= acc_itm_sg1 & if_1_acc_7_itm_sg1 & (MUX_s_1_2_2({if_1_acc_9_itm_sg1
            , aif_1_slc_svs}, or_dcpl_20)) & if_1_acc_4_itm_sg1 & if_1_acc_itm_sg1;
        counter_sva <= MUX1HOT_v_32_3_2({counter_sva_2 , counter_sva_dfm , counter_sva},
            {((fsm_output[1]) & and_1_itm) , ((fsm_output[1]) & (~ and_1_itm)) ,
            (~ (fsm_output[1]))});
        else_2_slc_svs <= readslicef_29_1_28((conv_s2u_28_29(else_2_if_slc_counter_2)
            + 29'b11111111111111111111111100111));
        land_2_lpi_1_dfm <= land_2_sva_1 & aif_5_nor_cse & (readslicef_29_1_28((conv_s2u_28_29(~
            else_2_if_slc_counter_2) + 29'b11001)));
      end
    end
  end
  always @(io_read_vga_xy_rsc_d_cse_sva or if_3_acc_6)
  begin : b0_line_24
    // Interconnect Declarations
    reg [9:0] inputs_gtmp;

    inputs_gtmp = (io_read_vga_xy_rsc_d_cse_sva[19:10]) ^ (if_3_acc_6[10:1]);
    xeq = ~((inputs_gtmp[0]) | (inputs_gtmp[1]) | (inputs_gtmp[2]) | (inputs_gtmp[3])
        | (inputs_gtmp[4]) | (inputs_gtmp[5]) | (inputs_gtmp[6]) | (inputs_gtmp[7])
        | (inputs_gtmp[8]) | (inputs_gtmp[9]));
  end


  function [0:0] readslicef_12_1_11;
    input [11:0] vector;
    reg [11:0] tmp;
  begin
    tmp = vector >> 11;
    readslicef_12_1_11 = tmp[0:0];
  end
  endfunction


  function [0:0] readslicef_11_1_10;
    input [10:0] vector;
    reg [10:0] tmp;
  begin
    tmp = vector >> 10;
    readslicef_11_1_10 = tmp[0:0];
  end
  endfunction


  function [10:0] readslicef_12_11_1;
    input [11:0] vector;
    reg [11:0] tmp;
  begin
    tmp = vector >> 1;
    readslicef_12_11_1 = tmp[10:0];
  end
  endfunction


  function [27:0] MUX_v_28_2_2;
    input [55:0] inputs;
    input [0:0] sel;
    reg [27:0] result;
  begin
    case (sel)
      1'b0 : begin
        result = inputs[55:28];
      end
      1'b1 : begin
        result = inputs[27:0];
      end
      default : begin
        result = inputs[55:28];
      end
    endcase
    MUX_v_28_2_2 = result;
  end
  endfunction


  function [9:0] MUX1HOT_v_10_3_2;
    input [29:0] inputs;
    input [2:0] sel;
    reg [9:0] result;
    integer i;
  begin
    result = inputs[0+:10] & {10{sel[0]}};
    for( i = 1; i < 3; i = i + 1 )
      result = result | (inputs[i*10+:10] & {10{sel[i]}});
    MUX1HOT_v_10_3_2 = result;
  end
  endfunction


  function [9:0] signext_10_1;
    input [0:0] vector;
  begin
    signext_10_1= {{9{vector[0]}}, vector};
  end
  endfunction


  function [0:0] MUX_s_1_2_2;
    input [1:0] inputs;
    input [0:0] sel;
    reg [0:0] result;
  begin
    case (sel)
      1'b0 : begin
        result = inputs[1:1];
      end
      1'b1 : begin
        result = inputs[0:0];
      end
      default : begin
        result = inputs[1:1];
      end
    endcase
    MUX_s_1_2_2 = result;
  end
  endfunction


  function [19:0] MUX_v_20_2_2;
    input [39:0] inputs;
    input [0:0] sel;
    reg [19:0] result;
  begin
    case (sel)
      1'b0 : begin
        result = inputs[39:20];
      end
      1'b1 : begin
        result = inputs[19:0];
      end
      default : begin
        result = inputs[39:20];
      end
    endcase
    MUX_v_20_2_2 = result;
  end
  endfunction


  function [9:0] MUX_v_10_2_2;
    input [19:0] inputs;
    input [0:0] sel;
    reg [9:0] result;
  begin
    case (sel)
      1'b0 : begin
        result = inputs[19:10];
      end
      1'b1 : begin
        result = inputs[9:0];
      end
      default : begin
        result = inputs[19:10];
      end
    endcase
    MUX_v_10_2_2 = result;
  end
  endfunction


  function [31:0] signext_32_1;
    input [0:0] vector;
  begin
    signext_32_1= {{31{vector[0]}}, vector};
  end
  endfunction


  function [29:0] MUX_v_30_2_2;
    input [59:0] inputs;
    input [0:0] sel;
    reg [29:0] result;
  begin
    case (sel)
      1'b0 : begin
        result = inputs[59:30];
      end
      1'b1 : begin
        result = inputs[29:0];
      end
      default : begin
        result = inputs[59:30];
      end
    endcase
    MUX_v_30_2_2 = result;
  end
  endfunction


  function [31:0] MUX1HOT_v_32_3_2;
    input [95:0] inputs;
    input [2:0] sel;
    reg [31:0] result;
    integer i;
  begin
    result = inputs[0+:32] & {32{sel[0]}};
    for( i = 1; i < 3; i = i + 1 )
      result = result | (inputs[i*32+:32] & {32{sel[i]}});
    MUX1HOT_v_32_3_2 = result;
  end
  endfunction


  function [0:0] readslicef_29_1_28;
    input [28:0] vector;
    reg [28:0] tmp;
  begin
    tmp = vector >> 28;
    readslicef_29_1_28 = tmp[0:0];
  end
  endfunction


  function  [11:0] conv_u2u_11_12 ;
    input [10:0]  vector ;
  begin
    conv_u2u_11_12 = {1'b0, vector};
  end
  endfunction


  function  [10:0] conv_u2u_10_11 ;
    input [9:0]  vector ;
  begin
    conv_u2u_10_11 = {1'b0, vector};
  end
  endfunction


  function  [11:0] conv_u2u_10_12 ;
    input [9:0]  vector ;
  begin
    conv_u2u_10_12 = {{2{1'b0}}, vector};
  end
  endfunction


  function  [28:0] conv_s2u_28_29 ;
    input signed [27:0]  vector ;
  begin
    conv_s2u_28_29 = {vector[27], vector};
  end
  endfunction

endmodule

// ------------------------------------------------------------------
//  Design Unit:    rectangle_detect
//  Generated from file(s):
//    2) $PROJECT_HOME/rectangle_detect.c
// ------------------------------------------------------------------


module rectangle_detect (
  vga_xy_rsc_z, video_in_rsc_z, x_top_left_rsc_z, y_top_left_rsc_z, width_rsc_z,
      height_rsc_z, video_out_rsc_z, filled_rsc_z, reset_rsc_z, clk, en, arst_n
);
  input [19:0] vga_xy_rsc_z;
  input [29:0] video_in_rsc_z;
  input [9:0] x_top_left_rsc_z;
  input [9:0] y_top_left_rsc_z;
  input [9:0] width_rsc_z;
  input [9:0] height_rsc_z;
  output [29:0] video_out_rsc_z;
  output filled_rsc_z;
  input reset_rsc_z;
  input clk;
  input en;
  input arst_n;


  // Interconnect Declarations
  wire [19:0] vga_xy_rsc_mgc_in_wire_d;
  wire [29:0] video_in_rsc_mgc_in_wire_d;
  wire [9:0] x_top_left_rsc_mgc_in_wire_d;
  wire [9:0] y_top_left_rsc_mgc_in_wire_d;
  wire [9:0] width_rsc_mgc_in_wire_d;
  wire [9:0] height_rsc_mgc_in_wire_d;
  wire [29:0] video_out_rsc_mgc_out_stdreg_d;
  wire filled_rsc_mgc_out_stdreg_d;
  wire reset_rsc_mgc_in_wire_d;


  // Interconnect Declarations for Component Instantiations 
  mgc_in_wire #(.rscid(1),
  .width(20)) vga_xy_rsc_mgc_in_wire (
      .d(vga_xy_rsc_mgc_in_wire_d),
      .z(vga_xy_rsc_z)
    );
  mgc_in_wire #(.rscid(2),
  .width(30)) video_in_rsc_mgc_in_wire (
      .d(video_in_rsc_mgc_in_wire_d),
      .z(video_in_rsc_z)
    );
  mgc_in_wire #(.rscid(3),
  .width(10)) x_top_left_rsc_mgc_in_wire (
      .d(x_top_left_rsc_mgc_in_wire_d),
      .z(x_top_left_rsc_z)
    );
  mgc_in_wire #(.rscid(4),
  .width(10)) y_top_left_rsc_mgc_in_wire (
      .d(y_top_left_rsc_mgc_in_wire_d),
      .z(y_top_left_rsc_z)
    );
  mgc_in_wire #(.rscid(5),
  .width(10)) width_rsc_mgc_in_wire (
      .d(width_rsc_mgc_in_wire_d),
      .z(width_rsc_z)
    );
  mgc_in_wire #(.rscid(6),
  .width(10)) height_rsc_mgc_in_wire (
      .d(height_rsc_mgc_in_wire_d),
      .z(height_rsc_z)
    );
  mgc_out_stdreg #(.rscid(7),
  .width(30)) video_out_rsc_mgc_out_stdreg (
      .d(video_out_rsc_mgc_out_stdreg_d),
      .z(video_out_rsc_z)
    );
  mgc_out_stdreg #(.rscid(8),
  .width(1)) filled_rsc_mgc_out_stdreg (
      .d(filled_rsc_mgc_out_stdreg_d),
      .z(filled_rsc_z)
    );
  mgc_in_wire #(.rscid(9),
  .width(1)) reset_rsc_mgc_in_wire (
      .d(reset_rsc_mgc_in_wire_d),
      .z(reset_rsc_z)
    );
  rectangle_detect_core rectangle_detect_core_inst (
      .clk(clk),
      .en(en),
      .arst_n(arst_n),
      .vga_xy_rsc_mgc_in_wire_d(vga_xy_rsc_mgc_in_wire_d),
      .video_in_rsc_mgc_in_wire_d(video_in_rsc_mgc_in_wire_d),
      .x_top_left_rsc_mgc_in_wire_d(x_top_left_rsc_mgc_in_wire_d),
      .y_top_left_rsc_mgc_in_wire_d(y_top_left_rsc_mgc_in_wire_d),
      .width_rsc_mgc_in_wire_d(width_rsc_mgc_in_wire_d),
      .height_rsc_mgc_in_wire_d(height_rsc_mgc_in_wire_d),
      .video_out_rsc_mgc_out_stdreg_d(video_out_rsc_mgc_out_stdreg_d),
      .filled_rsc_mgc_out_stdreg_d(filled_rsc_mgc_out_stdreg_d),
      .reset_rsc_mgc_in_wire_d(reset_rsc_mgc_in_wire_d)
    );
endmodule



