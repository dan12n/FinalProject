// ----------------------------------------------------------------------
//  HLS HDL:        Verilog Netlister
//  HLS Version:    2011a.126 Production Release
//  HLS Date:       Wed Aug  8 00:52:07 PDT 2012
// 
//  Generated by:   ymh15@EEWS104A-007
//  Generated date: Thu May 12 10:00:57 2016
// ----------------------------------------------------------------------

// 
// ------------------------------------------------------------------
//  Design Unit:    get_red_core
// ------------------------------------------------------------------


module get_red_core (
  clk, en, arst_n, vga_xy_rsc_mgc_in_wire_d, red_left_x_rsc_mgc_out_stdreg_d, red_right_x_rsc_mgc_out_stdreg_d,
      y_red_rsc_mgc_out_stdreg_d, video_in_rsc_mgc_in_wire_d, video_out_rsc_mgc_out_stdreg_d
);
  input clk;
  input en;
  input arst_n;
  input [19:0] vga_xy_rsc_mgc_in_wire_d;
  output [9:0] red_left_x_rsc_mgc_out_stdreg_d;
  reg [9:0] red_left_x_rsc_mgc_out_stdreg_d;
  output [9:0] red_right_x_rsc_mgc_out_stdreg_d;
  reg [9:0] red_right_x_rsc_mgc_out_stdreg_d;
  output [9:0] y_red_rsc_mgc_out_stdreg_d;
  reg [9:0] y_red_rsc_mgc_out_stdreg_d;
  input [29:0] video_in_rsc_mgc_in_wire_d;
  output [29:0] video_out_rsc_mgc_out_stdreg_d;
  reg [29:0] video_out_rsc_mgc_out_stdreg_d;


  // Interconnect Declarations
  wire or_dcpl_5;
  wire and_dcpl_3;
  reg detected_red_left_1_sva;
  reg detected_red_right_1_sva;
  reg oelse_slc_svs;
  reg [29:0] io_read_video_in_rsc_d_cse_sva_1;
  reg [9:0] left_red_x_1_sva_dfm_2;
  reg [9:0] right_red_x_1_sva_dfm_3;
  reg [9:0] red_y_1_sva_dfm_2;
  reg lor_lpi_1_dfm_1;
  reg main_stage_0_2;
  reg [9:0] io_read_vga_xy_rsc_d_cse_sva_1_sg1;
  wire [6:0] if_if_acc_3;
  wire [7:0] nl_if_if_acc_3;
  wire [6:0] if_if_acc_5;
  wire [7:0] nl_if_if_acc_5;
  wire [10:0] if_acc_2;
  wire [11:0] nl_if_acc_2;
  wire or_11_cse;
  wire [10:0] else_1_acc_itm;
  wire [11:0] nl_else_1_acc_itm;
  wire [11:0] if_3_acc_2_itm;
  wire [12:0] nl_if_3_acc_2_itm;
  wire [11:0] if_3_acc_itm;
  wire [12:0] nl_if_3_acc_itm;
  wire [7:0] if_acc_3_itm;
  wire [8:0] nl_if_acc_3_itm;
  wire else_4_land_lpi_1_dfm;
  wire [9:0] right_red_x_1_sva_dfm_3_mx0;
  wire [9:0] left_red_x_1_sva_dfm_2_mx0;
  wire land_1_lpi_1_dfm;
  wire if_land_lpi_1_dfm;
  wire oelse_slc_svs_mx0;


  // Interconnect Declarations for Component Instantiations 
  assign or_11_cse = or_dcpl_5 | (~ (if_acc_2[10])) | (~((if_if_acc_5[6]) & (if_if_acc_3[6])));
  assign else_4_land_lpi_1_dfm = (readslicef_7_1_6((conv_u2u_6_7(io_read_video_in_rsc_d_cse_sva_1[19:14])
      + 7'b1100111))) & (readslicef_7_1_6((conv_u2u_6_7(io_read_video_in_rsc_d_cse_sva_1[9:4])
      + 7'b1100111))) & (readslicef_11_1_10((({1'b1 , (~ (io_read_video_in_rsc_d_cse_sva_1[29:20]))})
      + 11'b1100100001)));
  assign right_red_x_1_sva_dfm_3_mx0 = MUX_v_10_2_2({(vga_xy_rsc_mgc_in_wire_d[9:0])
      , (right_red_x_1_sva_dfm_3 & ({{9{main_stage_0_2}}, main_stage_0_2}))}, and_dcpl_3
      | (~((if_acc_2[10]) & (if_if_acc_5[6]))) | (~((if_if_acc_3[6]) & (else_1_acc_itm[10])))
      | detected_red_right_1_sva);
  assign left_red_x_1_sva_dfm_2_mx0 = MUX_v_10_2_2({(vga_xy_rsc_mgc_in_wire_d[9:0])
      , (left_red_x_1_sva_dfm_2 & ({{9{main_stage_0_2}}, main_stage_0_2}))}, or_11_cse);
  assign land_1_lpi_1_dfm = (readslicef_12_1_11((conv_u2s_11_12(conv_u2u_10_11(red_y_1_sva_dfm_2)
      + conv_u2u_10_11(~ io_read_vga_xy_rsc_d_cse_sva_1_sg1)) + 12'b101111111111)))
      & (readslicef_12_1_11((conv_u2s_11_12(conv_u2u_10_11(io_read_vga_xy_rsc_d_cse_sva_1_sg1)
      + conv_u2u_10_11(~ red_y_1_sva_dfm_2)) + 12'b101111111111))) & lor_lpi_1_dfm_1;
  assign if_land_lpi_1_dfm = (if_if_acc_3[6]) & (if_if_acc_5[6]) & (if_acc_2[10]);
  assign nl_else_1_acc_itm = ({1'b1 , (~ (vga_xy_rsc_mgc_in_wire_d[9:0]))}) + 11'b1010111101;
  assign else_1_acc_itm = nl_else_1_acc_itm[10:0];
  assign oelse_slc_svs_mx0 = MUX_s_1_2_2({(readslicef_12_1_11((conv_u2s_11_12(conv_u2u_10_11(vga_xy_rsc_mgc_in_wire_d[9:0])
      + conv_u2u_10_11(~ right_red_x_1_sva_dfm_3_mx0)) + 12'b101111111111))) , oelse_slc_svs},
      (if_3_acc_itm[11]) & (if_3_acc_2_itm[11]));
  assign nl_if_3_acc_2_itm = conv_u2s_11_12(conv_u2u_10_11(left_red_x_1_sva_dfm_2_mx0)
      + conv_u2u_10_11(~ (vga_xy_rsc_mgc_in_wire_d[9:0]))) + 12'b101111111111;
  assign if_3_acc_2_itm = nl_if_3_acc_2_itm[11:0];
  assign nl_if_3_acc_itm = conv_u2s_11_12(conv_u2u_10_11(vga_xy_rsc_mgc_in_wire_d[9:0])
      + conv_u2u_10_11(~ left_red_x_1_sva_dfm_2_mx0)) + 12'b101111111111;
  assign if_3_acc_itm = nl_if_3_acc_itm[11:0];
  assign nl_if_acc_2 = ({1'b1 , (~ (video_in_rsc_mgc_in_wire_d[29:20]))}) + 11'b1100100001;
  assign if_acc_2 = nl_if_acc_2[10:0];
  assign nl_if_if_acc_3 = conv_u2u_6_7(video_in_rsc_mgc_in_wire_d[19:14]) + 7'b1100111;
  assign if_if_acc_3 = nl_if_if_acc_3[6:0];
  assign nl_if_if_acc_5 = conv_u2u_6_7(video_in_rsc_mgc_in_wire_d[9:4]) + 7'b1100111;
  assign if_if_acc_5 = nl_if_if_acc_5[6:0];
  assign nl_if_acc_3_itm = conv_u2u_7_8(vga_xy_rsc_mgc_in_wire_d[9:3]) + 8'b11100111;
  assign if_acc_3_itm = nl_if_acc_3_itm[7:0];
  assign or_dcpl_5 = (~ (if_acc_3_itm[7])) | detected_red_left_1_sva;
  assign and_dcpl_3 = (if_acc_3_itm[7]) & (~ detected_red_left_1_sva);
  always @(posedge clk or negedge arst_n) begin
    if ( ~ arst_n ) begin
      video_out_rsc_mgc_out_stdreg_d <= 30'b0;
      y_red_rsc_mgc_out_stdreg_d <= 10'b0;
      red_right_x_rsc_mgc_out_stdreg_d <= 10'b0;
      red_left_x_rsc_mgc_out_stdreg_d <= 10'b0;
      io_read_video_in_rsc_d_cse_sva_1 <= 30'b0;
      red_y_1_sva_dfm_2 <= 10'b0;
      io_read_vga_xy_rsc_d_cse_sva_1_sg1 <= 10'b0;
      right_red_x_1_sva_dfm_3 <= 10'b0;
      left_red_x_1_sva_dfm_2 <= 10'b0;
      lor_lpi_1_dfm_1 <= 1'b0;
      detected_red_right_1_sva <= 1'b0;
      oelse_slc_svs <= 1'b0;
      detected_red_left_1_sva <= 1'b0;
      main_stage_0_2 <= 1'b0;
    end
    else begin
      if ( en ) begin
        video_out_rsc_mgc_out_stdreg_d <= MUX_v_30_2_2({video_out_rsc_mgc_out_stdreg_d
            , ({(((io_read_video_in_rsc_d_cse_sva_1[29:20]) & (signext_10_1(~ else_4_land_lpi_1_dfm)))
            | ({{9{land_1_lpi_1_dfm}}, land_1_lpi_1_dfm})) , (~((~((io_read_video_in_rsc_d_cse_sva_1[19:10])
            | ({{9{else_4_land_lpi_1_dfm}}, else_4_land_lpi_1_dfm}))) | ({{9{land_1_lpi_1_dfm}},
            land_1_lpi_1_dfm}))) , ((io_read_video_in_rsc_d_cse_sva_1[9:0]) | ({{9{else_4_land_lpi_1_dfm}},
            else_4_land_lpi_1_dfm}) | ({{9{land_1_lpi_1_dfm}}, land_1_lpi_1_dfm}))})},
            main_stage_0_2);
        y_red_rsc_mgc_out_stdreg_d <= MUX_v_10_2_2({y_red_rsc_mgc_out_stdreg_d ,
            red_y_1_sva_dfm_2}, main_stage_0_2);
        red_right_x_rsc_mgc_out_stdreg_d <= MUX_v_10_2_2({red_right_x_rsc_mgc_out_stdreg_d
            , right_red_x_1_sva_dfm_3}, main_stage_0_2);
        red_left_x_rsc_mgc_out_stdreg_d <= MUX_v_10_2_2({red_left_x_rsc_mgc_out_stdreg_d
            , left_red_x_1_sva_dfm_2}, main_stage_0_2);
        io_read_video_in_rsc_d_cse_sva_1 <= video_in_rsc_mgc_in_wire_d;
        red_y_1_sva_dfm_2 <= MUX_v_10_2_2({(vga_xy_rsc_mgc_in_wire_d[19:10]) , (red_y_1_sva_dfm_2
            & ({{9{main_stage_0_2}}, main_stage_0_2}))}, or_11_cse);
        io_read_vga_xy_rsc_d_cse_sva_1_sg1 <= vga_xy_rsc_mgc_in_wire_d[19:10];
        right_red_x_1_sva_dfm_3 <= right_red_x_1_sva_dfm_3_mx0;
        left_red_x_1_sva_dfm_2 <= left_red_x_1_sva_dfm_2_mx0;
        lor_lpi_1_dfm_1 <= ((readslicef_12_1_11((conv_u2s_11_12(conv_u2u_10_11(right_red_x_1_sva_dfm_3_mx0)
            + conv_u2u_10_11(~ (vga_xy_rsc_mgc_in_wire_d[9:0]))) + 12'b101111111111)))
            & oelse_slc_svs_mx0) | ((if_3_acc_2_itm[11]) & (if_3_acc_itm[11]));
        detected_red_right_1_sva <= MUX_s_1_2_2({(MUX_s_1_2_2({detected_red_right_1_sva
            , (detected_red_right_1_sva | if_land_lpi_1_dfm)}, (~ detected_red_right_1_sva)
            & (else_1_acc_itm[10]))) , detected_red_right_1_sva}, and_dcpl_3);
        oelse_slc_svs <= oelse_slc_svs_mx0;
        detected_red_left_1_sva <= MUX_s_1_2_2({(detected_red_left_1_sva | if_land_lpi_1_dfm)
            , detected_red_left_1_sva}, or_dcpl_5);
        main_stage_0_2 <= 1'b1;
      end
    end
  end

  function [0:0] readslicef_7_1_6;
    input [6:0] vector;
    reg [6:0] tmp;
  begin
    tmp = vector >> 6;
    readslicef_7_1_6 = tmp[0:0];
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


  function [0:0] readslicef_12_1_11;
    input [11:0] vector;
    reg [11:0] tmp;
  begin
    tmp = vector >> 11;
    readslicef_12_1_11 = tmp[0:0];
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


  function [9:0] signext_10_1;
    input [0:0] vector;
  begin
    signext_10_1= {{9{vector[0]}}, vector};
  end
  endfunction


  function  [6:0] conv_u2u_6_7 ;
    input [5:0]  vector ;
  begin
    conv_u2u_6_7 = {1'b0, vector};
  end
  endfunction


  function signed [11:0] conv_u2s_11_12 ;
    input [10:0]  vector ;
  begin
    conv_u2s_11_12 = {1'b0, vector};
  end
  endfunction


  function  [10:0] conv_u2u_10_11 ;
    input [9:0]  vector ;
  begin
    conv_u2u_10_11 = {1'b0, vector};
  end
  endfunction


  function  [7:0] conv_u2u_7_8 ;
    input [6:0]  vector ;
  begin
    conv_u2u_7_8 = {1'b0, vector};
  end
  endfunction

endmodule

// ------------------------------------------------------------------
//  Design Unit:    get_red
//  Generated from file(s):
//    2) $PROJECT_HOME/get_red.c
// ------------------------------------------------------------------


module get_red (
  vga_xy_rsc_z, red_left_x_rsc_z, red_right_x_rsc_z, y_red_rsc_z, video_in_rsc_z,
      video_out_rsc_z, clk, en, arst_n
);
  input [19:0] vga_xy_rsc_z;
  output [9:0] red_left_x_rsc_z;
  output [9:0] red_right_x_rsc_z;
  output [9:0] y_red_rsc_z;
  input [29:0] video_in_rsc_z;
  output [29:0] video_out_rsc_z;
  input clk;
  input en;
  input arst_n;


  // Interconnect Declarations
  wire [19:0] vga_xy_rsc_mgc_in_wire_d;
  wire [9:0] red_left_x_rsc_mgc_out_stdreg_d;
  wire [9:0] red_right_x_rsc_mgc_out_stdreg_d;
  wire [9:0] y_red_rsc_mgc_out_stdreg_d;
  wire [29:0] video_in_rsc_mgc_in_wire_d;
  wire [29:0] video_out_rsc_mgc_out_stdreg_d;


  // Interconnect Declarations for Component Instantiations 
  mgc_in_wire #(.rscid(1),
  .width(20)) vga_xy_rsc_mgc_in_wire (
      .d(vga_xy_rsc_mgc_in_wire_d),
      .z(vga_xy_rsc_z)
    );
  mgc_out_stdreg #(.rscid(2),
  .width(10)) red_left_x_rsc_mgc_out_stdreg (
      .d(red_left_x_rsc_mgc_out_stdreg_d),
      .z(red_left_x_rsc_z)
    );
  mgc_out_stdreg #(.rscid(3),
  .width(10)) red_right_x_rsc_mgc_out_stdreg (
      .d(red_right_x_rsc_mgc_out_stdreg_d),
      .z(red_right_x_rsc_z)
    );
  mgc_out_stdreg #(.rscid(4),
  .width(10)) y_red_rsc_mgc_out_stdreg (
      .d(y_red_rsc_mgc_out_stdreg_d),
      .z(y_red_rsc_z)
    );
  mgc_in_wire #(.rscid(5),
  .width(30)) video_in_rsc_mgc_in_wire (
      .d(video_in_rsc_mgc_in_wire_d),
      .z(video_in_rsc_z)
    );
  mgc_out_stdreg #(.rscid(6),
  .width(30)) video_out_rsc_mgc_out_stdreg (
      .d(video_out_rsc_mgc_out_stdreg_d),
      .z(video_out_rsc_z)
    );
  get_red_core get_red_core_inst (
      .clk(clk),
      .en(en),
      .arst_n(arst_n),
      .vga_xy_rsc_mgc_in_wire_d(vga_xy_rsc_mgc_in_wire_d),
      .red_left_x_rsc_mgc_out_stdreg_d(red_left_x_rsc_mgc_out_stdreg_d),
      .red_right_x_rsc_mgc_out_stdreg_d(red_right_x_rsc_mgc_out_stdreg_d),
      .y_red_rsc_mgc_out_stdreg_d(y_red_rsc_mgc_out_stdreg_d),
      .video_in_rsc_mgc_in_wire_d(video_in_rsc_mgc_in_wire_d),
      .video_out_rsc_mgc_out_stdreg_d(video_out_rsc_mgc_out_stdreg_d)
    );
endmodule


