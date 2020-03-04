/*Copyright (c) 1995-1999 Teradyne, Inc, All Rights Reserved
$Header: /atc1a/syncmgr/syncdata/atc1/2021/server_vault/Projects/Teradyne/lib/tech_indep/verilog/include/saratoga.vh.rca 1.1 Fri May 12 13:12:10 2000 greenste Experimental $
 
 
Revision history:
------------------
$Log: /atc1a/syncmgr/syncdata/atc1/2021/server_vault/Projects/Teradyne/lib/tech_indep/verilog/include/saratoga.vh.rca $

 Revision: 1.1 Fri May 12 13:12:10 2000 greenste
   Initial transfer from Teradyne
Revision 1.5  1999/10/14 12:10:52  proto
*** empty log message ***

Revision 1.4  1999/10/01 17:09:08  elshama
Added tg*.vh files.

Revision 1.3  1999/09/29 20:44:26  proto
added include files for pg

Revision 1.2  1999/08/10 16:49:48  elshama
Defined the states of the State Bus and the TCIO perameter.

Revision 1.1  1999/07/16 13:00:04  elshama
Initial revision


*/

`resetall

//---- Defining desing timescale 
// synopsys translate_off
`ifdef using_1ps_timescale
  `timescale 1ns/1ps // Make all delays be in ns time units, but ps precision
`else
  `timescale 1ns/100ps
`endif
// synopsys translate_on


// synopsys translate_off
`ifdef SARATOGA_INCLUDE 
 `else
// FLAG THAT THIS FILE HAS BEEN READ
   `define SARATOGA_INCLUDE 1
// synopsys translate_on

//-----------------------------------------------------------------
//----  BINARY VALUES DEFINED
//-----------------------------------------------------------------
`define TRUE         1'b1
`define FALSE        1'b0
`define SET          1'b1
`define CLR          1'b0
`define ZERO         0


`define RESET_DELAY # (10.5 * `TICK)                 //10.5 clk100's

//-----------------------------------------------------------------
//---- TCIO Related delays 
//-----------------------------------------------------------------

`define BDD #0.1
`define BDD2 #0.2
`define BDD3 #0.3


`define RDD
`define RDD_WITHOUT_POUND 0
`define TCI_RDD
`define TCIO_RDD
`define RDD_CLKCTL
`define RDD_CLKDIV
`define RDD_CTGA
`define RDD_DIST
`define RDD_DSIO
`define RDD_MAC
`define RDD_PACSIF
`define RDD_SEQ
`define RDD_TCI
`define RDD_THI

`define TICK 10
`define NS   1

//-----------------------------------------------------------------
//---- State bus states 
//-----------------------------------------------------------------

`define STB_SVM                   5'h0
`define STB_LD_LVMAD_L            5'h1    // defined this way in the state bus doc
`define STB_LD_LVMADR_L           5'h1    // previously defined this way
`define STB_LD_LVMAD_H            5'h11
`define STB_LD_LVMADR_H           5'h11
`define STB_LD_LVMSUB_L           5'h12
`define STB_LD_LVMSUB_H           5'h13
`define STB_RETURN_MAIN           5'h14
`define STB_LVM_INC               5'h2
`define STB_LVM_NO_INC            5'h3
`define STB_KA_RESET              5'h4
`define STB_KA_INC                5'h5
`define STB_IDLE                  5'h7
`define STB_PRIMING               5'h6
`define STB_FLUSHING              5'h9
`define STB_RELOAD_ADDR           5'h15
`define STB_RELOAD_ADDR_LVM_INC   5'h8

// synopsys translate_off
`ifdef PG
  `include "pg_idl_rtl.vh"
  `include "pg.vh"
`endif
`ifdef TG
   `include "tg_idl_rtl.vh"
`endif 
`endif
// synopsys translate_on
