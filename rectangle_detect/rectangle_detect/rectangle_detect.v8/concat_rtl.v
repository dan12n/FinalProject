
//------> ./rtl_mgc_ioport.v 
//------------------------------------------------------------------
//                M G C _ I O P O R T _ C O M P S
//------------------------------------------------------------------

//------------------------------------------------------------------
//                       M O D U L E S
//------------------------------------------------------------------

//------------------------------------------------------------------
//-- INPUT ENTITIES
//------------------------------------------------------------------

module mgc_in_wire (d, z);

  parameter integer rscid = 1;
  parameter integer width = 8;

  output [width-1:0] d;
  input  [width-1:0] z;

  wire   [width-1:0] d;

  assign d = z;

endmodule

//------------------------------------------------------------------

module mgc_in_wire_en (ld, d, lz, z);

  parameter integer rscid = 1;
  parameter integer width = 8;

  input              ld;
  output [width-1:0] d;
  output             lz;
  input  [width-1:0] z;

  wire   [width-1:0] d;
  wire               lz;

  assign d = z;
  assign lz = ld;

endmodule

//------------------------------------------------------------------

module mgc_in_wire_wait (ld, vd, d, lz, vz, z);

  parameter integer rscid = 1;
  parameter integer width = 8;

  input              ld;
  output             vd;
  output [width-1:0] d;
  output             lz;
  input              vz;
  input  [width-1:0] z;

  wire               vd;
  wire   [width-1:0] d;
  wire               lz;

  assign d = z;
  assign lz = ld;
  assign vd = vz;

endmodule
//------------------------------------------------------------------

module mgc_chan_in (ld, vd, d, lz, vz, z, size, req_size, sizez, sizelz);

  parameter integer rscid = 1;
  parameter integer width = 8;
  parameter integer sz_width = 8;

  input              ld;
  output             vd;
  output [width-1:0] d;
  output             lz;
  input              vz;
  input  [width-1:0] z;
  output [sz_width-1:0] size;
  input              req_size;
  input  [sz_width-1:0] sizez;
  output             sizelz;


  wire               vd;
  wire   [width-1:0] d;
  wire               lz;
  wire   [sz_width-1:0] size;
  wire               sizelz;

  assign d = z;
  assign lz = ld;
  assign vd = vz;
  assign size = sizez;
  assign sizelz = req_size;

endmodule


//------------------------------------------------------------------
//-- OUTPUT ENTITIES
//------------------------------------------------------------------

module mgc_out_stdreg (d, z);

  parameter integer rscid = 1;
  parameter integer width = 8;

  input    [width-1:0] d;
  output   [width-1:0] z;

  wire     [width-1:0] z;

  assign z = d;

endmodule

//------------------------------------------------------------------

module mgc_out_stdreg_en (ld, d, lz, z);

  parameter integer rscid = 1;
  parameter integer width = 8;

  input              ld;
  input  [width-1:0] d;
  output             lz;
  output [width-1:0] z;

  wire               lz;
  wire   [width-1:0] z;

  assign z = d;
  assign lz = ld;

endmodule

//------------------------------------------------------------------

module mgc_out_stdreg_wait (ld, vd, d, lz, vz, z);

  parameter integer rscid = 1;
  parameter integer width = 8;

  input              ld;
  output             vd;
  input  [width-1:0] d;
  output             lz;
  input              vz;
  output [width-1:0] z;

  wire               vd;
  wire               lz;
  wire   [width-1:0] z;

  assign z = d;
  assign lz = ld;
  assign vd = vz;

endmodule

//------------------------------------------------------------------

module mgc_out_prereg_en (ld, d, lz, z);

    parameter integer rscid = 1;
    parameter integer width = 8;

    input              ld;
    input  [width-1:0] d;
    output             lz;
    output [width-1:0] z;

    wire               lz;
    wire   [width-1:0] z;

    assign z = d;
    assign lz = ld;

endmodule

//------------------------------------------------------------------
//-- INOUT ENTITIES
//------------------------------------------------------------------

module mgc_inout_stdreg_en (ldin, din, ldout, dout, lzin, lzout, z);

    parameter integer rscid = 1;
    parameter integer width = 8;

    input              ldin;
    output [width-1:0] din;
    input              ldout;
    input  [width-1:0] dout;
    output             lzin;
    output             lzout;
    inout  [width-1:0] z;

    wire   [width-1:0] din;
    wire               lzin;
    wire               lzout;
    wire   [width-1:0] z;

    assign lzin = ldin;
    assign din = ldin ? z : {width{1'bz}};
    assign lzout = ldout;
    assign z = ldout ? dout : {width{1'bz}};

endmodule

//------------------------------------------------------------------
module hid_tribuf( I_SIG, ENABLE, O_SIG);
  parameter integer width = 8;

  input [width-1:0] I_SIG;
  input ENABLE;
  inout [width-1:0] O_SIG;

  assign O_SIG = (ENABLE) ? I_SIG : { width{1'bz}};

endmodule
//------------------------------------------------------------------

module mgc_inout_stdreg_wait (ldin, vdin, din, ldout, vdout, dout, lzin, vzin, lzout, vzout, z);

    parameter integer rscid = 1;
    parameter integer width = 8;

    input              ldin;
    output             vdin;
    output [width-1:0] din;
    input              ldout;
    output             vdout;
    input  [width-1:0] dout;
    output             lzin;
    input              vzin;
    output             lzout;
    input              vzout;
    inout  [width-1:0] z;

    wire               vdin;
    wire   [width-1:0] din;
    wire               vdout;
    wire               lzin;
    wire               lzout;
    wire   [width-1:0] z;
    wire   ldout_and_vzout;

    assign lzin = ldin;
    assign vdin = vzin;
    assign din = ldin ? z : {width{1'bz}};
    assign lzout = ldout;
    assign vdout = vzout ;
    assign ldout_and_vzout = ldout && vzout ;

    hid_tribuf #(width) tb( .I_SIG(dout),
                            .ENABLE(ldout_and_vzout),
                            .O_SIG(z) );

endmodule

//------------------------------------------------------------------

module mgc_inout_buf_wait (clk, en, arst, srst, ldin, vdin, din, ldout, vdout, dout, lzin, vzin, lzout, vzout, z);

    parameter integer rscid   = 0; // resource ID
    parameter integer width   = 8; // fifo width
    parameter         ph_clk  =  1'b1; // clock polarity 1=rising edge, 0=falling edge
    parameter         ph_en   =  1'b1; // clock enable polarity
    parameter         ph_arst =  1'b1; // async reset polarity
    parameter         ph_srst =  1'b1; // sync reset polarity

    input              clk;
    input              en;
    input              arst;
    input              srst;
    input              ldin;
    output             vdin;
    output [width-1:0] din;
    input              ldout;
    output             vdout;
    input  [width-1:0] dout;
    output             lzin;
    input              vzin;
    output             lzout;
    input              vzout;
    inout  [width-1:0] z;

    wire               lzout_buf;
    wire               vzout_buf;
    wire   [width-1:0] z_buf;
    wire               vdin;
    wire   [width-1:0] din;
    wire               vdout;
    wire               lzin;
    wire               lzout;
    wire   [width-1:0] z;

    assign lzin = ldin;
    assign vdin = vzin;
    assign din = ldin ? z : {width{1'bz}};
    assign lzout = lzout_buf & ~ldin;
    assign vzout_buf = vzout & ~ldin;
    hid_tribuf #(width) tb( .I_SIG(z_buf),
                            .ENABLE((lzout_buf && (!ldin) && vzout) ),
                            .O_SIG(z)  );

    mgc_out_buf_wait
    #(
        .rscid   (rscid),
        .width   (width),
        .ph_clk  (ph_clk),
        .ph_en   (ph_en),
        .ph_arst (ph_arst),
        .ph_srst (ph_srst)
    )
    BUFF
    (
        .clk     (clk),
        .en      (en),
        .arst    (arst),
        .srst    (srst),
        .ld      (ldout),
        .vd      (vdout),
        .d       (dout),
        .lz      (lzout_buf),
        .vz      (vzout_buf),
        .z       (z_buf)
    );


endmodule

module mgc_inout_fifo_wait (clk, en, arst, srst, ldin, vdin, din, ldout, vdout, dout, lzin, vzin, lzout, vzout, z);

    parameter integer rscid   = 0; // resource ID
    parameter integer width   = 8; // fifo width
    parameter integer fifo_sz = 8; // fifo depth
    parameter         ph_clk  = 1'b1;  // clock polarity 1=rising edge, 0=falling edge
    parameter         ph_en   = 1'b1;  // clock enable polarity
    parameter         ph_arst = 1'b1;  // async reset polarity
    parameter         ph_srst = 1'b1;  // sync reset polarity
    parameter integer ph_log2 = 3;     // log2(fifo_sz)
    parameter integer pwropt  = 0;     // pwropt

    input              clk;
    input              en;
    input              arst;
    input              srst;
    input              ldin;
    output             vdin;
    output [width-1:0] din;
    input              ldout;
    output             vdout;
    input  [width-1:0] dout;
    output             lzin;
    input              vzin;
    output             lzout;
    input              vzout;
    inout  [width-1:0] z;

    wire               lzout_buf;
    wire               vzout_buf;
    wire   [width-1:0] z_buf;
    wire               comb;
    wire               vdin;
    wire   [width-1:0] din;
    wire               vdout;
    wire               lzin;
    wire               lzout;
    wire   [width-1:0] z;

    assign lzin = ldin;
    assign vdin = vzin;
    assign din = ldin ? z : {width{1'bz}};
    assign lzout = lzout_buf & ~ldin;
    assign vzout_buf = vzout & ~ldin;
    assign comb = (lzout_buf && (!ldin) && vzout);

    hid_tribuf #(width) tb2( .I_SIG(z_buf), .ENABLE(comb), .O_SIG(z)  );

    mgc_out_fifo_wait
    #(
        .rscid   (rscid),
        .width   (width),
        .fifo_sz (fifo_sz),
        .ph_clk  (ph_clk),
        .ph_en   (ph_en),
        .ph_arst (ph_arst),
        .ph_srst (ph_srst),
        .ph_log2 (ph_log2),
        .pwropt  (pwropt)
    )
    FIFO
    (
        .clk   (clk),
        .en      (en),
        .arst    (arst),
        .srst    (srst),
        .ld      (ldout),
        .vd      (vdout),
        .d       (dout),
        .lz      (lzout_buf),
        .vz      (vzout_buf),
        .z       (z_buf)
    );

endmodule

//------------------------------------------------------------------
//-- I/O SYNCHRONIZATION ENTITIES
//------------------------------------------------------------------

module mgc_io_sync (ld, lz);

    input  ld;
    output lz;

    assign lz = ld;

endmodule

module mgc_bsync_rdy (rd, rz);

    parameter integer rscid   = 0; // resource ID
    parameter ready = 1;
    parameter valid = 0;

    input  rd;
    output rz;

    wire   rz;

    assign rz = rd;

endmodule

module mgc_bsync_vld (vd, vz);

    parameter integer rscid   = 0; // resource ID
    parameter ready = 0;
    parameter valid = 1;

    output vd;
    input  vz;

    wire   vd;

    assign vd = vz;

endmodule

module mgc_bsync_rv (rd, vd, rz, vz);

    parameter integer rscid   = 0; // resource ID
    parameter ready = 1;
    parameter valid = 1;

    input  rd;
    output vd;
    output rz;
    input  vz;

    wire   vd;
    wire   rz;

    assign rz = rd;
    assign vd = vz;

endmodule

//------------------------------------------------------------------

module mgc_sync (ldin, vdin, ldout, vdout);

  input  ldin;
  output vdin;
  input  ldout;
  output vdout;

  wire   vdin;
  wire   vdout;

  assign vdin = ldout;
  assign vdout = ldin;

endmodule

///////////////////////////////////////////////////////////////////////////////
// dummy function used to preserve funccalls for modulario
// it looks like a memory read to the caller
///////////////////////////////////////////////////////////////////////////////
module funccall_inout (d, ad, bd, z, az, bz);

  parameter integer ram_id = 1;
  parameter integer width = 8;
  parameter integer addr_width = 8;

  output [width-1:0]       d;
  input  [addr_width-1:0]  ad;
  input                    bd;
  input  [width-1:0]       z;
  output [addr_width-1:0]  az;
  output                   bz;

  wire   [width-1:0]       d;
  wire   [addr_width-1:0]  az;
  wire                     bz;

  assign d  = z;
  assign az = ad;
  assign bz = bd;

endmodule


///////////////////////////////////////////////////////////////////////////////
// inlinable modular io not otherwise found in mgc_ioport
///////////////////////////////////////////////////////////////////////////////

module modulario_en_in (vd, d, vz, z);

  parameter integer rscid = 1;
  parameter integer width = 8;

  output             vd;
  output [width-1:0] d;
  input              vz;
  input  [width-1:0] z;

  wire   [width-1:0] d;
  wire               vd;

  assign d = z;
  assign vd = vz;

endmodule

//------> ./rtl_mgc_ioport_v2001.v 
//------------------------------------------------------------------

module mgc_out_reg_pos (clk, en, arst, srst, ld, d, lz, z);

    parameter integer rscid   = 1;
    parameter integer width   = 8;
    parameter         ph_en   =  1'b1;
    parameter         ph_arst =  1'b1;
    parameter         ph_srst =  1'b1;

    input              clk;
    input              en;
    input              arst;
    input              srst;
    input              ld;
    input  [width-1:0] d;
    output             lz;
    output [width-1:0] z;

    reg                lz;
    reg    [width-1:0] z;

    generate
    if (ph_arst == 1'b0)
    begin: NEG_ARST
        always @(posedge clk or negedge arst)
        if (arst == 1'b0)
        begin: B1
            lz <= 1'b0;
            z  <= {width{1'b0}};
        end
        else if (srst == ph_srst)
        begin: B2
            lz <= 1'b0;
            z  <= {width{1'b0}};
        end
        else if (en == ph_en)
        begin: B3
            lz <= ld;
            z  <= (ld) ? d : z;
        end
    end
    else
    begin: POS_ARST
        always @(posedge clk or posedge arst)
        if (arst == 1'b1)
        begin: B1
            lz <= 1'b0;
            z  <= {width{1'b0}};
        end
        else if (srst == ph_srst)
        begin: B2
            lz <= 1'b0;
            z  <= {width{1'b0}};
        end
        else if (en == ph_en)
        begin: B3
            lz <= ld;
            z  <= (ld) ? d : z;
        end
    end
    endgenerate

endmodule

//------------------------------------------------------------------

module mgc_out_reg_neg (clk, en, arst, srst, ld, d, lz, z);

    parameter integer rscid   = 1;
    parameter integer width   = 8;
    parameter         ph_en   =  1'b1;
    parameter         ph_arst =  1'b1;
    parameter         ph_srst =  1'b1;

    input              clk;
    input              en;
    input              arst;
    input              srst;
    input              ld;
    input  [width-1:0] d;
    output             lz;
    output [width-1:0] z;

    reg                lz;
    reg    [width-1:0] z;

    generate
    if (ph_arst == 1'b0)
    begin: NEG_ARST
        always @(negedge clk or negedge arst)
        if (arst == 1'b0)
        begin: B1
            lz <= 1'b0;
            z  <= {width{1'b0}};
        end
        else if (srst == ph_srst)
        begin: B2
            lz <= 1'b0;
            z  <= {width{1'b0}};
        end
        else if (en == ph_en)
        begin: B3
            lz <= ld;
            z  <= (ld) ? d : z;
        end
    end
    else
    begin: POS_ARST
        always @(negedge clk or posedge arst)
        if (arst == 1'b1)
        begin: B1
            lz <= 1'b0;
            z  <= {width{1'b0}};
        end
        else if (srst == ph_srst)
        begin: B2
            lz <= 1'b0;
            z  <= {width{1'b0}};
        end
        else if (en == ph_en)
        begin: B3
            lz <= ld;
            z  <= (ld) ? d : z;
        end
    end
    endgenerate

endmodule

//------------------------------------------------------------------

module mgc_out_reg (clk, en, arst, srst, ld, d, lz, z); // Not Supported

    parameter integer rscid   = 1;
    parameter integer width   = 8;
    parameter         ph_clk  =  1'b1;
    parameter         ph_en   =  1'b1;
    parameter         ph_arst =  1'b1;
    parameter         ph_srst =  1'b1;

    input              clk;
    input              en;
    input              arst;
    input              srst;
    input              ld;
    input  [width-1:0] d;
    output             lz;
    output [width-1:0] z;


    generate
    if (ph_clk == 1'b0)
    begin: NEG_EDGE

        mgc_out_reg_neg
        #(
            .rscid   (rscid),
            .width   (width),
            .ph_en   (ph_en),
            .ph_arst (ph_arst),
            .ph_srst (ph_srst)
        )
        mgc_out_reg_neg_inst
        (
            .clk     (clk),
            .en      (en),
            .arst    (arst),
            .srst    (srst),
            .ld      (ld),
            .d       (d),
            .lz      (lz),
            .z       (z)
        );

    end
    else
    begin: POS_EDGE

        mgc_out_reg_pos
        #(
            .rscid   (rscid),
            .width   (width),
            .ph_en   (ph_en),
            .ph_arst (ph_arst),
            .ph_srst (ph_srst)
        )
        mgc_out_reg_pos_inst
        (
            .clk     (clk),
            .en      (en),
            .arst    (arst),
            .srst    (srst),
            .ld      (ld),
            .d       (d),
            .lz      (lz),
            .z       (z)
        );

    end
    endgenerate

endmodule




//------------------------------------------------------------------

module mgc_out_buf_wait (clk, en, arst, srst, ld, vd, d, vz, lz, z); // Not supported

    parameter integer rscid   = 1;
    parameter integer width   = 8;
    parameter         ph_clk  =  1'b1;
    parameter         ph_en   =  1'b1;
    parameter         ph_arst =  1'b1;
    parameter         ph_srst =  1'b1;

    input              clk;
    input              en;
    input              arst;
    input              srst;
    input              ld;
    output             vd;
    input  [width-1:0] d;
    output             lz;
    input              vz;
    output [width-1:0] z;

    wire               filled;
    wire               filled_next;
    wire   [width-1:0] abuf;
    wire               lbuf;


    assign filled_next = (filled & (~vz)) | (filled & ld) | (ld & (~vz));

    assign lbuf = ld & ~(filled ^ vz);

    assign vd = vz | ~filled;

    assign lz = ld | filled;

    assign z = (filled) ? abuf : d;

    wire dummy;
    wire dummy_bufreg_lz;

    // Output registers:
    mgc_out_reg
    #(
        .rscid   (rscid),
        .width   (1'b1),
        .ph_clk  (ph_clk),
        .ph_en   (ph_en),
        .ph_arst (ph_arst),
        .ph_srst (ph_srst)
    )
    STATREG
    (
        .clk     (clk),
        .en      (en),
        .arst    (arst),
        .srst    (srst),
        .ld      (filled_next),
        .d       (1'b0),       // input d is unused
        .lz      (filled),
        .z       (dummy)            // output z is unused
    );

    mgc_out_reg
    #(
        .rscid   (rscid),
        .width   (width),
        .ph_clk  (ph_clk),
        .ph_en   (ph_en),
        .ph_arst (ph_arst),
        .ph_srst (ph_srst)
    )
    BUFREG
    (
        .clk     (clk),
        .en      (en),
        .arst    (arst),
        .srst    (srst),
        .ld      (lbuf),
        .d       (d),
        .lz      (dummy_bufreg_lz),
        .z       (abuf)
    );

endmodule

//------------------------------------------------------------------

module mgc_out_fifo_wait (clk, en, arst, srst, ld, vd, d, lz, vz,  z);

    parameter integer rscid   = 0; // resource ID
    parameter integer width   = 8; // fifo width
    parameter integer fifo_sz = 8; // fifo depth
    parameter         ph_clk  = 1'b1; // clock polarity 1=rising edge, 0=falling edge
    parameter         ph_en   = 1'b1; // clock enable polarity
    parameter         ph_arst = 1'b1; // async reset polarity
    parameter         ph_srst = 1'b1; // sync reset polarity
    parameter integer ph_log2 = 3; // log2(fifo_sz)
    parameter integer pwropt  = 0; // pwropt


    input                 clk;
    input                 en;
    input                 arst;
    input                 srst;
    input                 ld;    // load data
    output                vd;    // fifo full active low
    input     [width-1:0] d;
    output                lz;    // fifo ready to send
    input                 vz;    // dest ready for data
    output    [width-1:0] z;

    wire    [31:0]      size;


      // Output registers:
 mgc_out_fifo_wait_core#(
        .rscid   (rscid),
        .width   (width),
        .sz_width (32),
        .fifo_sz (fifo_sz),
        .ph_clk  (ph_clk),
        .ph_en   (ph_en),
        .ph_arst (ph_arst),
        .ph_srst (ph_srst),
        .ph_log2 (ph_log2),
        .pwropt  (pwropt)
        ) CORE (
        .clk (clk),
        .en (en),
        .arst (arst),
        .srst (srst),
        .ld (ld),
        .vd (vd),
        .d (d),
        .lz (lz),
        .vz (vz),
        .z (z),
        .size (size)
        );

endmodule



module mgc_out_fifo_wait_core (clk, en, arst, srst, ld, vd, d, lz, vz,  z, size);

    parameter integer rscid   = 0; // resource ID
    parameter integer width   = 8; // fifo width
    parameter integer sz_width = 8; // size of port for elements in fifo
    parameter integer fifo_sz = 8; // fifo depth
    parameter         ph_clk  =  1'b1; // clock polarity 1=rising edge, 0=falling edge
    parameter         ph_en   =  1'b1; // clock enable polarity
    parameter         ph_arst =  1'b1; // async reset polarity
    parameter         ph_srst =  1'b1; // sync reset polarity
    parameter integer ph_log2 = 3; // log2(fifo_sz)
    parameter integer pwropt  = 0; // pwropt

   localparam integer  fifo_b = width * fifo_sz;

    input                 clk;
    input                 en;
    input                 arst;
    input                 srst;
    input                 ld;    // load data
    output                vd;    // fifo full active low
    input     [width-1:0] d;
    output                lz;    // fifo ready to send
    input                 vz;    // dest ready for data
    output    [width-1:0] z;
    output    [sz_width-1:0]      size;

    reg      [( (fifo_sz > 0) ? fifo_sz : 1)-1:0] stat_pre;
    wire     [( (fifo_sz > 0) ? fifo_sz : 1)-1:0] stat;
    reg      [( (fifo_b > 0) ? fifo_b : 1)-1:0] buff_pre;
    wire     [( (fifo_b > 0) ? fifo_b : 1)-1:0] buff;
    reg      [( (fifo_sz > 0) ? fifo_sz : 1)-1:0] en_l;
    reg      [(((fifo_sz > 0) ? fifo_sz : 1)-1)/8:0] en_l_s;

    reg       [width-1:0] buff_nxt;

    reg                   stat_nxt;
    reg                   stat_before;
    reg                   stat_after;
    reg                   en_l_var;

    integer               i;
    genvar                eni;

    wire [32:0]           size_t;
    reg [31:0]            count;
    reg [31:0]            count_t;
    reg [32:0]            n_elem;
// pragma translate_off
    reg [31:0]            peak;
// pragma translate_on

    wire [( (fifo_sz > 0) ? fifo_sz : 1)-1:0] dummy_statreg_lz;
    wire [( (fifo_b > 0) ? fifo_b : 1)-1:0] dummy_bufreg_lz;

    generate
    if ( fifo_sz > 0 )
    begin: FIFO_REG
      assign vd = vz | ~stat[0];
      assign lz = ld | stat[fifo_sz-1];
      assign size_t = (count - (vz && stat[fifo_sz-1])) + ld;
      assign size = size_t[sz_width-1:0];
      assign z = (stat[fifo_sz-1]) ? buff[fifo_b-1:width*(fifo_sz-1)] : d;

      always @(*)
      begin: FIFOPROC
        n_elem = 33'b0;
        for (i = fifo_sz-1; i >= 0; i = i - 1)
        begin
          if (i != 0)
            stat_before = stat[i-1];
          else
            stat_before = 1'b0;

          if (i != (fifo_sz-1))
            stat_after = stat[i+1];
          else
            stat_after = 1'b1;

          stat_nxt = stat_after &
                    (stat_before | (stat[i] & (~vz)) | (stat[i] & ld) | (ld & (~vz)));

          stat_pre[i] = stat_nxt;
          en_l_var = 1'b1;
          if (!stat_nxt)
            begin
              buff_nxt = {width{1'b0}};
              en_l_var = 1'b0;
            end
          else if (vz && stat_before)
            buff_nxt[0+:width] = buff[width*(i-1)+:width];
          else if (ld && !((vz && stat_before) || ((!vz) && stat[i])))
            buff_nxt = d;
          else
            begin
              if (pwropt == 0)
                buff_nxt[0+:width] = buff[width*i+:width];
              else
                buff_nxt = {width{1'b0}};
              en_l_var = 1'b0;
            end

          if (ph_en != 0)
            en_l[i] = en & en_l_var;
          else
            en_l[i] = en | ~en_l_var;

          buff_pre[width*i+:width] = buff_nxt[0+:width];

          if ((stat_after == 1'b1) && (stat[i] == 1'b0))
            n_elem = ($unsigned(fifo_sz) - 1) - i;
        end

        if (ph_en != 0)
          en_l_s[(((fifo_sz > 0) ? fifo_sz : 1)-1)/8] = 1'b1;
        else
          en_l_s[(((fifo_sz > 0) ? fifo_sz : 1)-1)/8] = 1'b0;

        for (i = fifo_sz-1; i >= 7; i = i - 1)
        begin
          if ((i%'d2) == 0)
          begin
            if (ph_en != 0)
              en_l_s[(i/8)-1] = en & (stat[i]|stat_pre[i-1]);
            else
              en_l_s[(i/8)-1] = en | ~(stat[i]|stat_pre[i-1]);
          end
        end

        if ( stat[fifo_sz-1] == 1'b0 )
          count_t = 32'b0;
        else if ( stat[0] == 1'b1 )
          count_t = { {(32-ph_log2){1'b0}}, fifo_sz};
        else
          count_t = n_elem[31:0];
        count = count_t;
// pragma translate_off
        if ( peak < count )
          peak = count;
// pragma translate_on
      end

      if (pwropt == 0)
      begin: NOCGFIFO
        // Output registers:
        mgc_out_reg
        #(
            .rscid   (rscid),
            .width   (fifo_sz),
            .ph_clk  (ph_clk),
            .ph_en   (ph_en),
            .ph_arst (ph_arst),
            .ph_srst (ph_srst)
        )
        STATREG
        (
            .clk     (clk),
            .en      (en),
            .arst    (arst),
            .srst    (srst),
            .ld      (1'b1),
            .d       (stat_pre),
            .lz      (dummy_statreg_lz[0]),
            .z       (stat)
        );
        mgc_out_reg
        #(
            .rscid   (rscid),
            .width   (fifo_b),
            .ph_clk  (ph_clk),
            .ph_en   (ph_en),
            .ph_arst (ph_arst),
            .ph_srst (ph_srst)
        )
        BUFREG
        (
            .clk     (clk),
            .en      (en),
            .arst    (arst),
            .srst    (srst),
            .ld      (1'b1),
            .d       (buff_pre),
            .lz      (dummy_bufreg_lz[0]),
            .z       (buff)
        );
      end
      else
      begin: CGFIFO
        // Output registers:
        if ( pwropt > 1)
        begin: CGSTATFIFO2
          for (eni = fifo_sz-1; eni >= 0; eni = eni - 1)
          begin: pwroptGEN1
            mgc_out_reg
            #(
              .rscid   (rscid),
              .width   (1),
              .ph_clk  (ph_clk),
              .ph_en   (ph_en),
              .ph_arst (ph_arst),
              .ph_srst (ph_srst)
            )
            STATREG
            (
              .clk     (clk),
              .en      (en_l_s[eni/8]),
              .arst    (arst),
              .srst    (srst),
              .ld      (1'b1),
              .d       (stat_pre[eni]),
              .lz      (dummy_statreg_lz[eni]),
              .z       (stat[eni])
            );
          end
        end
        else
        begin: CGSTATFIFO
          mgc_out_reg
          #(
            .rscid   (rscid),
            .width   (fifo_sz),
            .ph_clk  (ph_clk),
            .ph_en   (ph_en),
            .ph_arst (ph_arst),
            .ph_srst (ph_srst)
          )
          STATREG
          (
            .clk     (clk),
            .en      (en),
            .arst    (arst),
            .srst    (srst),
            .ld      (1'b1),
            .d       (stat_pre),
            .lz      (dummy_statreg_lz[0]),
            .z       (stat)
          );
        end
        for (eni = fifo_sz-1; eni >= 0; eni = eni - 1)
        begin: pwroptGEN2
          mgc_out_reg
          #(
            .rscid   (rscid),
            .width   (width),
            .ph_clk  (ph_clk),
            .ph_en   (ph_en),
            .ph_arst (ph_arst),
            .ph_srst (ph_srst)
          )
          BUFREG
          (
            .clk     (clk),
            .en      (en_l[eni]),
            .arst    (arst),
            .srst    (srst),
            .ld      (1'b1),
            .d       (buff_pre[width*eni+:width]),
            .lz      (dummy_bufreg_lz[eni]),
            .z       (buff[width*eni+:width])
          );
        end
      end
    end
    else
    begin: FEED_THRU
      assign vd = vz;
      assign lz = ld;
      assign z = d;
      assign size = ld && !vz;
    end
    endgenerate

endmodule

//------------------------------------------------------------------
//-- PIPE ENTITIES
//------------------------------------------------------------------
/*
 *
 *             _______________________________________________
 * WRITER    |                                               |          READER
 *           |           MGC_PIPE                            |
 *           |           __________________________          |
 *        --<| vdout  --<| vd ---------------  vz<|-----ldin<|---
 *           |           |      FIFO              |          |
 *        ---|>ldout  ---|>ld ---------------- lz |> ---vdin |>--
 *        ---|>dout -----|>d  ---------------- dz |> ----din |>--
 *           |           |________________________|          |
 *           |_______________________________________________|
 */
// two clock pipe
module mgc_pipe (clk, en, arst, srst, ldin, vdin, din, ldout, vdout, dout, size, req_size);

    parameter integer rscid   = 0; // resource ID
    parameter integer width   = 8; // fifo width
    parameter integer sz_width = 8; // width of size of elements in fifo
    parameter integer fifo_sz = 8; // fifo depth
    parameter integer log2_sz = 3; // log2(fifo_sz)
    parameter         ph_clk  = 1'b1;  // clock polarity 1=rising edge, 0=falling edge
    parameter         ph_en   = 1'b1;  // clock enable polarity
    parameter         ph_arst = 1'b1;  // async reset polarity
    parameter         ph_srst = 1'b1;  // sync reset polarity
    parameter integer pwropt  = 0; // pwropt

    input              clk;
    input              en;
    input              arst;
    input              srst;
    input              ldin;
    output             vdin;
    output [width-1:0] din;
    input              ldout;
    output             vdout;
    input  [width-1:0] dout;
    output [sz_width-1:0]      size;
    input              req_size;


    mgc_out_fifo_wait_core
    #(
        .rscid    (rscid),
        .width    (width),
        .sz_width (sz_width),
        .fifo_sz  (fifo_sz),
        .ph_clk   (ph_clk),
        .ph_en    (ph_en),
        .ph_arst  (ph_arst),
        .ph_srst  (ph_srst),
        .ph_log2  (log2_sz),
        .pwropt   (pwropt)
    )
    FIFO
    (
        .clk     (clk),
        .en      (en),
        .arst    (arst),
        .srst    (srst),
        .ld      (ldout),
        .vd      (vdout),
        .d       (dout),
        .lz      (vdin),
        .vz      (ldin),
        .z       (din),
        .size    (size)
    );

endmodule


//------> ./rtl.v 
// ----------------------------------------------------------------------
//  HLS HDL:        Verilog Netlister
//  HLS Version:    2011a.126 Production Release
//  HLS Date:       Wed Aug  8 00:52:07 PDT 2012
// 
//  Generated by:   ymh15@EEWS104A-007
//  Generated date: Thu May 12 14:12:10 2016
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



