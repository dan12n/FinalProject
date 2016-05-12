// ----------------------------------------------------------------------
//  HLS HDL:        Verilog Netlister
//  HLS Version:    2011a.126 Production Release
//  HLS Date:       Wed Aug  8 00:52:07 PDT 2012
// 
//  Generated by:   ymh15@EEWS104A-007
//  Generated date: Thu May 12 13:30:05 2016
// ----------------------------------------------------------------------

// 
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



  // Interconnect Declarations for Component Instantiations 
  always @(*)
  begin : core
    // Interconnect Declarations
    reg [31:0] counter_sva;
    reg went_through_1_sva;
    reg [19:0] io_read_vga_xy_rsc_d_cse_sva;
    reg [29:0] io_read_video_in_rsc_d_cse_sva;
    reg io_read_reset_rsc_d_svs;
    reg [31:0] counter_sva_dfm;
    reg went_through_1_sva_dfm;
    reg [9:0] slc_x_top_left_cse_sva;
    reg slc_svs;
    reg land_1_sva_1;
    reg land_1_lpi_1_dfm;
    reg [9:0] if_1_io_read_y_top_left_rsc_d_ncse_sva;
    reg [9:0] if_1_io_read_height_rsc_d_ncse_sva;
    reg aif_1_slc_svs;
    reg aif_1_land_sva_1;
    reg land_lpi_1_dfm;
    reg if_1_slc_svs;
    reg [31:0] counter_sva_2;
    reg [31:0] counter_sva_dfm_2;
    reg and_2_itm;
    reg if_4_acc_cse_sg1;

    reg[9:0] mux_3_nl;
    reg[9:0] mux_4_nl;
    reg[9:0] mux_5_nl;
    begin : core_rlpExit
      forever begin : core_rlp
        // C-Step 0 of Loop 'core_rlp'
        counter_sva = 32'b0;
        went_through_1_sva = 1'b0;
        begin : mainExit
          forever begin : main
            // C-Step 0 of Loop 'main'
            begin : waitLoop0Exit
              forever begin : waitLoop0
                @(posedge clk or negedge ( arst_n ));
                if ( ~ arst_n )
                  disable core_rlpExit;
                if ( en )
                  disable waitLoop0Exit;
              end
            end
            // C-Step 1 of Loop 'main'
            if_1_slc_svs = 1'b0;
            aif_1_land_sva_1 = 1'b0;
            land_1_sva_1 = 1'b0;
            io_read_vga_xy_rsc_d_cse_sva = vga_xy_rsc_mgc_in_wire_d;
            io_read_video_in_rsc_d_cse_sva = video_in_rsc_mgc_in_wire_d;
            io_read_reset_rsc_d_svs = reset_rsc_mgc_in_wire_d;
            counter_sva_dfm = counter_sva & (signext_32_1(~ io_read_reset_rsc_d_svs));
            went_through_1_sva_dfm = went_through_1_sva & (~ io_read_reset_rsc_d_svs);
            slc_x_top_left_cse_sva = x_top_left_rsc_mgc_in_wire_d;
            slc_svs = readslicef_11_1_10(((readslicef_12_11_1((conv_u2u_11_12(conv_u2u_10_11(~
                slc_x_top_left_cse_sva) + conv_u2u_10_11(~ width_rsc_mgc_in_wire_d))
                + conv_u2u_10_12(io_read_vga_xy_rsc_d_cse_sva[9:0])))) + 11'b10000000001));
            if ( slc_svs ) begin
              land_1_sva_1 = readslicef_12_1_11((({1'b1 , slc_x_top_left_cse_sva
                  , 1'b1}) + conv_u2u_11_12({(~ (io_read_vga_xy_rsc_d_cse_sva[9:0]))
                  , 1'b1})));
            end
            land_1_lpi_1_dfm = land_1_sva_1 & slc_svs;
            if_1_io_read_y_top_left_rsc_d_ncse_sva = y_top_left_rsc_mgc_in_wire_d;
            if_1_io_read_height_rsc_d_ncse_sva = height_rsc_mgc_in_wire_d;
            if ( land_1_lpi_1_dfm ) begin
              aif_1_slc_svs = readslicef_11_1_10(((readslicef_12_11_1((conv_u2u_11_12(conv_u2u_10_11(~
                  if_1_io_read_y_top_left_rsc_d_ncse_sva) + conv_u2u_10_11(~ if_1_io_read_height_rsc_d_ncse_sva))
                  + conv_u2u_10_12(io_read_vga_xy_rsc_d_cse_sva[19:10])))) + 11'b10000000001));
              if ( aif_1_slc_svs ) begin
                aif_1_land_sva_1 = readslicef_12_1_11((({1'b1 , if_1_io_read_y_top_left_rsc_d_ncse_sva
                    , 1'b1}) + conv_u2u_11_12({(~ (io_read_vga_xy_rsc_d_cse_sva[19:10]))
                    , 1'b1})));
              end
            end
            land_lpi_1_dfm = aif_1_land_sva_1 & aif_1_slc_svs & land_1_lpi_1_dfm;
            if ( land_lpi_1_dfm ) begin
              if_1_slc_svs = readslicef_12_1_11(((conv_u2u_11_12(conv_u2u_10_11(~
                  (io_read_video_in_rsc_d_cse_sva[9:0])) + conv_u2u_10_11(~ (io_read_video_in_rsc_d_cse_sva[19:10])))
                  + conv_u2u_10_12(~ (io_read_video_in_rsc_d_cse_sva[29:20]))) +
                  12'b100111011111));
            end
            and_2_itm = if_1_slc_svs & land_lpi_1_dfm;
            mux_3_nl = MUX_v_10_2_2({(io_read_video_in_rsc_d_cse_sva[29:20]) , ({{9{if_1_slc_svs}},
                if_1_slc_svs})}, land_lpi_1_dfm);
            mux_4_nl = MUX_v_10_2_2({(io_read_video_in_rsc_d_cse_sva[19:10]) , (signext_10_1(~
                if_1_slc_svs))}, land_lpi_1_dfm);
            mux_5_nl = MUX_v_10_2_2({(io_read_video_in_rsc_d_cse_sva[9:0]) , (signext_10_1(~
                if_1_slc_svs))}, land_lpi_1_dfm);
            video_out_rsc_mgc_out_stdreg_d <= {(mux_3_nl) , (mux_4_nl) , (mux_5_nl)};
            if_4_acc_cse_sg1 = readslicef_12_1_11((conv_u2u_11_12(readslicef_12_11_1((conv_u2u_11_12({if_1_io_read_height_rsc_d_ncse_sva
                , 1'b1}) + conv_u2u_11_12({(~ (io_read_vga_xy_rsc_d_cse_sva[19:10]))
                , 1'b1})))) + conv_s2u_11_12({1'b1 , if_1_io_read_y_top_left_rsc_d_ncse_sva})));
            went_through_1_sva = went_through_1_sva_dfm | if_4_acc_cse_sg1;
            begin : waitLoop1Exit
              forever begin : waitLoop1
                @(posedge clk or negedge ( arst_n ));
                if ( ~ arst_n )
                  disable core_rlpExit;
                if ( en )
                  disable waitLoop1Exit;
              end
            end
            // C-Step 2 of Loop 'main'
            counter_sva_2 = 32'b0;
            if ( land_lpi_1_dfm ) begin
              if ( if_1_slc_svs ) begin
                counter_sva_2 = counter_sva_dfm + 32'b1;
              end
            end
            counter_sva_dfm_2 = MUX_v_32_2_2({counter_sva_dfm , counter_sva_2}, and_2_itm);
            filled_rsc_mgc_out_stdreg_d <= ~(went_through_1_sva_dfm | (~(if_4_acc_cse_sg1
                & (readslicef_29_1_28((conv_s2u_28_29(~ (counter_sva_dfm_2[31:4]))
                + 29'b11001))))));
            counter_sva = counter_sva_dfm_2;
            begin : waitLoop2Exit
              forever begin : waitLoop2
                @(posedge clk or negedge ( arst_n ));
                if ( ~ arst_n )
                  disable core_rlpExit;
                if ( en )
                  disable waitLoop2Exit;
              end
            end
            // C-Step 3 of Loop 'main'
          end
        end
      end
    end
    if_4_acc_cse_sg1 = 1'b0;
    and_2_itm = 1'b0;
    counter_sva_dfm_2 = 32'b0;
    counter_sva_2 = 32'b0;
    if_1_slc_svs = 1'b0;
    land_lpi_1_dfm = 1'b0;
    aif_1_land_sva_1 = 1'b0;
    aif_1_slc_svs = 1'b0;
    if_1_io_read_height_rsc_d_ncse_sva = 10'b0;
    if_1_io_read_y_top_left_rsc_d_ncse_sva = 10'b0;
    land_1_lpi_1_dfm = 1'b0;
    land_1_sva_1 = 1'b0;
    slc_svs = 1'b0;
    slc_x_top_left_cse_sva = 10'b0;
    went_through_1_sva_dfm = 1'b0;
    counter_sva_dfm = 32'b0;
    io_read_reset_rsc_d_svs = 1'b0;
    io_read_video_in_rsc_d_cse_sva = 30'b0;
    io_read_vga_xy_rsc_d_cse_sva = 20'b0;
    went_through_1_sva = 1'b0;
    counter_sva = 32'b0;
    filled_rsc_mgc_out_stdreg_d <= 1'b0;
    video_out_rsc_mgc_out_stdreg_d <= 30'b0;
  end


  function [31:0] signext_32_1;
    input [0:0] vector;
  begin
    signext_32_1= {{31{vector[0]}}, vector};
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


  function [0:0] readslicef_12_1_11;
    input [11:0] vector;
    reg [11:0] tmp;
  begin
    tmp = vector >> 11;
    readslicef_12_1_11 = tmp[0:0];
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


  function [9:0] signext_10_1;
    input [0:0] vector;
  begin
    signext_10_1= {{9{vector[0]}}, vector};
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


  function  [11:0] conv_s2u_11_12 ;
    input signed [10:0]  vector ;
  begin
    conv_s2u_11_12 = {vector[10], vector};
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



