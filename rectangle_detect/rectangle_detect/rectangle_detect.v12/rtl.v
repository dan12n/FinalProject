// ----------------------------------------------------------------------
//  HLS HDL:        Verilog Netlister
//  HLS Version:    2011a.126 Production Release
//  HLS Date:       Wed Aug  8 00:52:07 PDT 2012
// 
//  Generated by:   ymh15@EEWS104A-007
//  Generated date: Thu May 12 14:43:01 2016
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
  wire or_dcpl_12;
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
  wire [11:0] if_3_acc_7;
  wire [12:0] nl_if_3_acc_7;
  wire and_13_cse;
  wire and_14_cse;
  wire [11:0] if_1_acc_7_itm;
  wire [12:0] nl_if_1_acc_7_itm;
  wire [10:0] if_1_acc_9_itm;
  wire [11:0] nl_if_1_acc_9_itm;
  wire [11:0] if_1_acc_4_itm;
  wire [12:0] nl_if_1_acc_4_itm;
  wire [10:0] if_1_acc_itm;
  wire [11:0] nl_if_1_acc_itm;
  wire [11:0] z_out;
  wire [12:0] nl_z_out;
  wire static_fill_1_sva_dfm_1_mx0w0;
  wire [31:0] counter_sva_2;
  wire [32:0] nl_counter_sva_2;
  wire [31:0] counter_sva_dfm_2_mx0;
  wire [9:0] if_1_if_acc_1_itm;
  wire [10:0] nl_if_1_if_acc_1_itm;

  wire[9:0] mux_13_nl;

  // Interconnect Declarations for Component Instantiations 
  rectangle_detect_core_fsm rectangle_detect_core_fsm_inst (
      .clk(clk),
      .en(en),
      .arst_n(arst_n),
      .fsm_output(fsm_output)
    );
  assign and_13_cse = (if_1_acc_itm[10]) & (if_1_acc_4_itm[11]) & (if_1_acc_9_itm[10])
      & (if_1_acc_7_itm[11]) & (fsm_output[0]);
  assign and_14_cse = (or_dcpl_12 | (~((if_1_acc_9_itm[10]) & (if_1_acc_7_itm[11]))))
      & (fsm_output[0]);
  assign nl_if_1_if_acc_1_itm = (readslicef_12_10_2((conv_u2u_11_12(conv_u2u_10_11(video_in_rsc_mgc_in_wire_d[9:0])
      + conv_u2u_10_11(video_in_rsc_mgc_in_wire_d[19:10])) + conv_u2u_10_12(video_in_rsc_mgc_in_wire_d[29:20]))))
      + 10'b1010001001;
  assign if_1_if_acc_1_itm = nl_if_1_if_acc_1_itm[9:0];
  assign nl_if_1_acc_7_itm = ({1'b1 , y_top_left_rsc_mgc_in_wire_d , 1'b1}) + conv_u2u_11_12({(~
      (vga_xy_rsc_mgc_in_wire_d[19:10])) , 1'b1});
  assign if_1_acc_7_itm = nl_if_1_acc_7_itm[11:0];
  assign nl_if_1_acc_9_itm = (readslicef_12_11_1((conv_u2u_11_12(conv_u2u_10_11(~
      y_top_left_rsc_mgc_in_wire_d) + conv_u2u_10_11(~ height_rsc_mgc_in_wire_d))
      + conv_u2u_10_12(vga_xy_rsc_mgc_in_wire_d[19:10])))) + 11'b10000000001;
  assign if_1_acc_9_itm = nl_if_1_acc_9_itm[10:0];
  assign nl_if_1_acc_4_itm = ({1'b1 , x_top_left_rsc_mgc_in_wire_d , 1'b1}) + conv_u2u_11_12({(~
      (vga_xy_rsc_mgc_in_wire_d[9:0])) , 1'b1});
  assign if_1_acc_4_itm = nl_if_1_acc_4_itm[11:0];
  assign static_fill_1_sva_dfm_1_mx0w0 = (static_fill_1_sva & (~((if_3_acc_7[11])
      & (z_out[11]) & else_2_slc_svs))) | land_2_lpi_1_dfm;
  assign nl_if_1_acc_itm = (readslicef_12_11_1((conv_u2u_11_12(conv_u2u_10_11(~ x_top_left_rsc_mgc_in_wire_d)
      + conv_u2u_10_11(~ width_rsc_mgc_in_wire_d)) + conv_u2u_10_12(vga_xy_rsc_mgc_in_wire_d[9:0]))))
      + 11'b10000000001;
  assign if_1_acc_itm = nl_if_1_acc_itm[10:0];
  assign nl_counter_sva_2 = counter_sva_dfm + 32'b1;
  assign counter_sva_2 = nl_counter_sva_2[31:0];
  assign counter_sva_dfm_2_mx0 = MUX_v_32_2_2({counter_sva_dfm , counter_sva_2},
      and_1_itm);
  assign nl_if_3_acc_7 = conv_u2u_11_12(readslicef_12_11_1((conv_u2u_11_12({slc_width_cse_sva
      , 1'b1}) + conv_u2u_11_12({(~ (io_read_vga_xy_rsc_d_cse_sva[9:0])) , 1'b1}))))
      + conv_s2u_11_12({1'b1 , slc_x_top_left_cse_sva});
  assign if_3_acc_7 = nl_if_3_acc_7[11:0];
  assign or_dcpl_12 = ~((if_1_acc_itm[10]) & (if_1_acc_4_itm[11]));
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
        mux_2_itm <= MUX1HOT_v_10_3_2({(signext_10_1(if_1_if_acc_1_itm[9])) , (video_in_rsc_mgc_in_wire_d[29:20])
            , mux_2_itm}, {and_13_cse , and_14_cse , (~ (fsm_output[0]))});
        mux_3_itm <= MUX1HOT_v_10_3_2({(signext_10_1(~ (if_1_if_acc_1_itm[9]))) ,
            (video_in_rsc_mgc_in_wire_d[19:10]) , mux_3_itm}, {and_13_cse , and_14_cse
            , (~ (fsm_output[0]))});
        mux_4_itm <= MUX1HOT_v_10_3_2({(signext_10_1(~ (if_1_if_acc_1_itm[9]))) ,
            (video_in_rsc_mgc_in_wire_d[9:0]) , mux_4_itm}, {and_13_cse , and_14_cse
            , (~ (fsm_output[0]))});
        aif_1_slc_svs <= MUX_s_1_2_2({(if_1_acc_9_itm[10]) , aif_1_slc_svs}, or_dcpl_12
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
        and_1_itm <= (if_1_if_acc_1_itm[9]) & (if_1_acc_7_itm[11]) & (MUX_s_1_2_2({(if_1_acc_9_itm[10])
            , aif_1_slc_svs}, or_dcpl_12)) & (if_1_acc_4_itm[11]) & (if_1_acc_itm[10]);
        counter_sva <= MUX1HOT_v_32_3_2({counter_sva_2 , counter_sva_dfm , counter_sva},
            {((fsm_output[1]) & and_1_itm) , ((fsm_output[1]) & (~ and_1_itm)) ,
            (~ (fsm_output[1]))});
        else_2_slc_svs <= readslicef_33_1_32((conv_s2u_32_33(counter_sva_dfm_2_mx0)
            + 33'b111111111111111111111110011011111));
        land_2_lpi_1_dfm <= (if_3_acc_7[11]) & (z_out[11]) & (readslicef_33_1_32((conv_s2u_32_33(~
            counter_sva_dfm_2_mx0) + 33'b1100100001)));
      end
    end
  end
  assign mux_13_nl = MUX_v_10_2_2({(~ (io_read_vga_xy_rsc_d_cse_sva[19:10])) , (~
      (io_read_vga_xy_rsc_d_cse_sva[19:10]))}, fsm_output[1]);
  assign nl_z_out = conv_u2u_11_12(readslicef_12_11_1((conv_u2u_11_12({height_rsc_mgc_in_wire_d
      , 1'b1}) + conv_u2u_11_12({(mux_13_nl) , 1'b1})))) + conv_s2u_11_12({1'b1 ,
      y_top_left_rsc_mgc_in_wire_d});
  assign z_out = nl_z_out[11:0];

  function [9:0] readslicef_12_10_2;
    input [11:0] vector;
    reg [11:0] tmp;
  begin
    tmp = vector >> 2;
    readslicef_12_10_2 = tmp[9:0];
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


  function [31:0] MUX_v_32_2_2;
    input [63:0] inputs;
    input [0:0] sel;
    reg [31:0] result;
  begin
    case (sel)
      1'b0 : begin
        result = inputs[63:32];
      end
      1'b1 : begin
        result = inputs[31:0];
      end
      default : begin
        result = inputs[63:32];
      end
    endcase
    MUX_v_32_2_2 = result;
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


  function [0:0] readslicef_33_1_32;
    input [32:0] vector;
    reg [32:0] tmp;
  begin
    tmp = vector >> 32;
    readslicef_33_1_32 = tmp[0:0];
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


  function  [11:0] conv_s2u_11_12 ;
    input signed [10:0]  vector ;
  begin
    conv_s2u_11_12 = {vector[10], vector};
  end
  endfunction


  function  [32:0] conv_s2u_32_33 ;
    input signed [31:0]  vector ;
  begin
    conv_s2u_32_33 = {vector[31], vector};
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



