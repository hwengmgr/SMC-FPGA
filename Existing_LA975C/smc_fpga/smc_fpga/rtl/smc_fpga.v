/*
 $Id: smc_fpga.v /main/5 2003/10/22  11:34 klein $
 $Log: smc_fpga.v $
 Version: /main/5  2003/10/22  11:34 klein
 inverted bobcat 48V output per Bob's request
 
 Version: /main/4  2003/08/13  17:54 klein
 added needed reabacks for rw regs and put tach signals ito freq ctr
 
 Version: /main/3  2003/08/06  15:57 klein
 added new inputs for bobcat and jag, and new output controls too
 
 Version: /main/2  2003/07/24  16:44 broadben
 added io defs
 
 Version: /main/1  2002/03/19  14:46 klein
 Initial Version
 
Revision 1.6  2003/07/23 23:28:31  Broadbent
 added First cut at jaguar, bobcat
 Revision 1.5  2001/09/10 01:47:03  klein
 added lock out of holding register updates during readback.
 added readback of maint rising and falling signals.
 added enable register to allow on/off to turn on. This is a double
 fault safety mechanism.

 Revision 1.4  2001/09/08 12:19:04  klein
 added enble registers for on/off bits. Changed on/off reg;s to noallocs
 that are reset by enable deasserting.
 added readback for maint rising and falling signals.

 Revision 1.3  2001/08/16 14:07:22  klein
 changed structure to 5 frequency counters, one of which is shared and 4
 of which are dedicated to specific inputs.

 Revision 1.2  2001/07/17 19:41:30  klein
 added id and log fields

 */

`define RDD
module smc_fpga (I_ale, IN_wr, IN_rd, IN_psen, BI_port0, I_port2, I_clk,
		 I_monitors, OC_48v_on, OC_k1_on,
		 I_main_blower_mon, I_V0_mon, I_I1_mon, I_I2_mon, I_maint_mon,
	 I_reset_N, I_SMC_MON_DC90_OUTPUT_FAULT, 
	I_SMC_MON_DC90_AC_PWR_FAULT, I_SMC_MON_DC90_OVR_TMP, 
	I_SMC_MON_DC90_48V_ON,  I_SMC_MON_BC_OUTPUT_FAULT, 
	I_SMC_MON_BC_AC_PWR_FAULT, I_SMC_MON_BC_OVR_TMP, 
	I_SMC_MON_BC_PHASE_LOSS, I_SMC_MON_BC_AC_ON, 
	I_SMC_MON_PDU_JAG_THERMAL_FAULT,
	I_SMC_MON_BC_FAN0_STATE, I_SMC_MON_PDU_JAG_48V_GOOD, 
	I_SMC_MON_BC_FAN1_STATE, I_SMC_MON_BC_FAN0_TACH, 	
	I_SMC_MON_BC_FAN1_TACH, OC_B_CNTRL_BC_48VDC_DC90, 	
	OC_B_CNTRL_BC_48VDC, OC_SMC_CNTRL_JAG_SWITCHED_AC, 	
	OC_SMC_CNTRL_JAG_48VDC_ON, OC_B_SMC_CNTRL_BC_SWITCHED_AC);

   input I_ale,    // ale control input from uC
	 IN_wr,    // write strobe from uC
	 IN_rd,    // read strobe from uC
	 IN_psen,  // memory cycle control signal from uC
	 I_clk,    // 11.092 MHz clock
	 I_reset_N; // async power clear
   
   inout [7:0] BI_port0; // address/data bus from uC
   input [7:0] I_port2; // address port from uC

   input [10:0] I_monitors;  // 11 signals to monitor from PDU etc (opto isolated)
   input I_main_blower_mon, // blower monitor signal from PDU (opto isolated)
	 I_V0_mon,     // V0 monitor from PDU (opto isolated)
	 I_I1_mon,     // I1 monitor from PDU (opto isolated)
	 I_I2_mon,     // I2 monitor from PDU (opto isolated)
	 I_maint_mon;  // maintainence signal monitor from PDU (opto isolated)
   
   input I_SMC_MON_DC90_OUTPUT_FAULT,
	 I_SMC_MON_DC90_AC_PWR_FAULT,
	 I_SMC_MON_DC90_OVR_TMP,
	 I_SMC_MON_DC90_48V_ON,
	 I_SMC_MON_BC_OUTPUT_FAULT,
	 I_SMC_MON_BC_AC_PWR_FAULT,
	 I_SMC_MON_BC_OVR_TMP,
	 I_SMC_MON_BC_PHASE_LOSS,
	 I_SMC_MON_BC_AC_ON,
	 I_SMC_MON_PDU_JAG_48V_GOOD,
	 I_SMC_MON_PDU_JAG_THERMAL_FAULT,
	 I_SMC_MON_BC_FAN0_STATE,
	 I_SMC_MON_BC_FAN1_STATE,
	 I_SMC_MON_BC_FAN0_TACH,
	 I_SMC_MON_BC_FAN1_TACH;
   output OC_B_CNTRL_BC_48VDC_DC90,
	  OC_B_CNTRL_BC_48VDC,
	  OC_SMC_CNTRL_JAG_SWITCHED_AC,
	  OC_SMC_CNTRL_JAG_48VDC_ON, 
	  OC_B_SMC_CNTRL_BC_SWITCHED_AC;
   inout OC_48v_on,  // output control to turn 48V on (opto isolated)
	 OC_k1_on;  // output control to turn K1 on (opto isolated)


   wire wr_N = IN_wr;
   wire rd_N = IN_rd;
   wire psen_N = IN_psen;
   wire ale = I_ale;
   wire [7:0] port2 = I_port2;
   wire       wstb;
   wire       reset_N = I_reset_N;
   wire [7:0] noalloc_rdata;
   wire [7:0] noalloc_wdata;
   wire [31:0] idl_rdata; // output of idl module is 32 bits
   
   wire OC_48v_on,  // output control to turn 48V on (opto isolated)
	 OC_k1_on;  // output control to turn K1 on (opto isolated)
   wire O_48v_on,  // output control to turn 48V on (opto isolated)
	 O_k1_on;  // output control to turn K1 on (opto isolated)
   wire OC_B_CNTRL_BC_48VDC_DC90,
	 OC_B_CNTRL_BC_48VDC,
	 OC_SMC_CNTRL_JAG_SWITCHED_AC,
	 OC_SMC_CNTRL_JAG_48VDC_ON, 
	 OC_B_SMC_CNTRL_BC_SWITCHED_AC;
   wire I_SMC_MON_PDU_K1,
I_SMC_MON_DC90_OUTPUT_FAULT,
I_SMC_MON_DC90_AC_PWR_FAULT,
I_SMC_MON_DC90_OVR_TMP,
I_SMC_MON_DC90_48V_ON,
I_SMC_MON_BC_OUTPUT_FAULT,
I_SMC_MON_BC_AC_PWR_FAULT,
I_SMC_MON_BC_OVR_TMP,
I_SMC_MON_BC_PHASE_LOSS,
I_SMC_MON_BC_AC_ON,
I_SMC_MON_PDU_JAG_48V_LVL_ON,
I_SMC_MON_PDU_JAG_THERMAL_FAULT,
I_SMC_MON_PDU_48V_LVL_ON,
I_SMC_MON_BC_FAN0_STATE,
I_SMC_MON_BC_FAN1_STATE,
I_SMC_MON_BC_FAN0_TACH,
	I_SMC_MON_BC_FAN1_TACH;
wire [10:0] I_monitors;  // 11 signals to monitor from PDU etc (opto isolated)

// noalloc idl declarations
   reg K1_ON,
       V48_ON,
       B_CNTRL_BC_48VDC,
       B_CNTRL_BC_48VDC_DC90,
       B_SMC_CNTRL_BC_SWITCHED_AC,
       SMC_CNTRL_JAG_SWITCHED_AC,
       SMC_CNTRL_JAG_48VDC_ON;
   
// idl register declarations
`include "smc_fpga_idl_decls.i"
   
   wire [7:0] V0_LO;
   wire [7:0] V0_HI;
   wire [7:0] I1_LO;
   wire [7:0] I1_HI;
   wire [7:0] I2_LO;
   wire [7:0] I2_HI;
   wire [7:0] MAIN_BLOWER_LO;
   wire [7:0] MAIN_BLOWER_HI;
   wire [7:0] GEN_FREQ_CTR_LO;
   wire [7:0] GEN_FREQ_CTR_MID;
   wire [7:0] GEN_FREQ_CTR_HI;
   wire [7:0] BC_TACH0_CTR_HI,
	      BC_TACH0_CTR_LO,
	      BC_TACH1_CTR_HI,
	      BC_TACH1_CTR_LO;
   
   wire MAINT_RISING,
	MAINT_FALLING;
   
   wire mon_freq_ctr_in,
	io_freq_ctr_in,
	gen_freq_ctr_in;
    
   wire v0_lock_out,
	i1_lock_out,
	i2_lock_out,
	main_lock_out,
	gen_freq_lock_out,
	tach0_lock_out,
	tach1_lock_out;
   
   // wires for ignored bits of frequency counters.
   wire ignore_V0,
	ignore_I1,
	ignore_I2;
   
   wire [6:0] ignore_MAIN_BLOWER;
   
   wire [23:0] dummy_wdata; // wdata is 32 bits from idl reg but we only use 8
   reg [23:0] addr; // 24 bit address
   wire valid_read,
	address_valid;
   
   reg [8:0]   freq_div_ctr; // to create 15khz wave from master 11.0592Mhz clock
   reg 	       r15khz_clk; // freq_div_ctr divided by two for clean 50% duty cycle

   assign I_SMC_MON_PDU_K1 = I_monitors[3];
   assign I_SMC_MON_PDU_JAG_48V_LVL_ON = I_monitors[9];

   parameter [3:0] ID_CONST = 4'hD ;				//
   parameter [3:0] REV_CONST = 4'h3 ;				//

   // create 15khz clock for control outputs to use. divide master clock by 369.
   // then divide again by 2 to make clean waveform with 50% duty cycle.

   always @(posedge I_clk or negedge I_reset_N) begin
      if (~I_reset_N) freq_div_ctr <= 0;
      else begin
	 if (freq_div_ctr < 369) freq_div_ctr <= freq_div_ctr + 1;
	 else freq_div_ctr <= 0;
      end
   end

   always @(posedge I_clk or negedge I_reset_N) begin
      if (~I_reset_N) r15khz_clk <= 0;
      else begin
	 if (freq_div_ctr == 369) r15khz_clk <= ~r15khz_clk;
      end
   end

   // determine valid address range for read transfers. Don't turn on
   // output if address not meant for us. valid range is B200 to B3ff
 //rjb
   assign address_valid = (addr[15:8] == 8'hB2 | addr[15:8] ==  8'hB3);

   // valid reads are when rd_N is low, psen_N is high and the address
   // is in a valid range.
   assign valid_read = ~rd_N & psen_N & address_valid;
     
   // bidir output port tristate control. turn on when reading
   wire [7:0] BI_port0 = ~valid_read ? 8'hzz : idl_rdata [7:0];
   wire [7:0] port0 = BI_port0; // intput side of bidir port

   assign     wstb = (psen_N & ~wr_N);
   
   // latch address signals from both ports during ale asserted.
   always @(ale or port0 or port2 or reset_N) begin
      if (~reset_N) begin
	 addr [7:0] <= 8'h00;
	 addr [23:16] <= 8'h00;
      end
      else if (ale) begin
	 addr [7:0] <= port0;
	 addr [23:16] <= port2;
      end
   end

   // latch addr [15:8] when ale is not asserted
   always @(ale or port2 or reset_N) begin
      if (~reset_N) addr [15:8] <= 8'h00;
      else if (~ale) addr [15:8] <= port2;
   end

   // instantiate IDL generated rtl verilog. This uses wrstb_derived as an
   // asynchronous write strobe. clk100, wrstb and the top 8 bits of addr
   // are not used and are tied low.

   smc_fpga_idl_rtl idl_regs (.I_clk100 (I_clk), // to clock in enables. don't need otherwise 
			      .I_PWRCLR (~I_reset_N), 
			      .I_addr (addr[15:0]), 
			      .I_wrstb (1'b0), 
			      .I_wrstb_derived (wstb), 
			      .I_rdstb (~rd_N), 
			      .I_w_data ({24'h0, port0}), 
			      .O_r_data (idl_rdata), 
			      .O_address_match (),
			      .I_K1_ENABLE_ON (K1_ENABLE), 
			      .I_V48_ENABLE_ON (V48_ENABLE),
			      .I_AC_ENABLE_ON(K1_ENABLE), // use K1 enable temporarily
			      .I_B_DC90_48V_Enable_ON(B_DC90_48V_Enable),
			      .I_smc_fpga_idl_noalloc_data_r ({24'h0, noalloc_rdata}),
			      .O_smc_fpga_idl_noalloc_data_w ({dummy_wdata, noalloc_wdata}),
			      `include "smc_fpga_idl_conn.i"
			      );
   
   // create control outputs. These are internal signals that need the correct output buffer
   //  logic, which is below so they are open collector.
   // for v48_on and k1_on, if control signal is asserted, 
   // gate 15khz_clk to output. if low, output is tri-state (pulled up on board).

   assign O_48v_on = V48_ON ? r15khz_clk : 1'b1;
   assign O_k1_on = K1_ON ? r15khz_clk : 1'b1;

   // for other outputs use 2nd control bit to set level state instead of 15khz_clk.
   // encoding is: 00 = tri-state, 01 = 15khz_clk, 10 = tri-state, 11 = low level.
/*
   assign O_aux_ctl[0] = (AUX_0_CTL == 2'b01) ? r15khz_clk :
	              (AUX_0_CTL == 2'b11) ? 1'b0 : 1'b1;
   assign O_aux_ctl[1] = (AUX_1_CTL == 2'b01) ? r15khz_clk :
	              (AUX_1_CTL == 2'b11) ? 1'b0 : 1'b1;
   assign O_aux_ctl[2] = (AUX_2_CTL == 2'b01) ? r15khz_clk :
	              (AUX_2_CTL == 2'b11) ? 1'b0 : 1'b1;
   assign O_aux_ctl[3] = (AUX_3_CTL == 2'b01) ? r15khz_clk :
	              (AUX_3_CTL == 2'b11) ? 1'b0 : 1'b1;
*/   
   // for each output if the data is high, the pin should be tristate with an 
   // external pullup (OC output)
   
   assign OC_48v_on = O_48v_on;// ? 1'bz : 0;
   assign OC_k1_on = O_k1_on;// ? 1'bz : 0;
//   assign OC_aux_ctl[0] = O_aux_ctl[0];// ? 1'bz : 0;
//   assign OC_aux_ctl[1] = O_aux_ctl[1];// ? 1'bz : 0;
//   assign OC_aux_ctl[2] = O_aux_ctl[2];// ? 1'bz : 0;
//   assign OC_aux_ctl[3] = O_aux_ctl[3];// ? 1'bz : 0;

// Bobcat and Jag control signals are open collector, low true   
   assign OC_B_CNTRL_BC_48VDC_DC90 = ~B_CNTRL_BC_48VDC_DC90;// ? 1 : 0;
   assign OC_B_CNTRL_BC_48VDC = ~B_CNTRL_BC_48VDC; // ? 0 : 1;
   assign OC_SMC_CNTRL_JAG_SWITCHED_AC = ~SMC_CNTRL_JAG_SWITCHED_AC; // ? 0 : 1;
   assign OC_SMC_CNTRL_JAG_48VDC_ON = ~SMC_CNTRL_JAG_48VDC_ON; // ? 0 : 1;
   assign OC_B_SMC_CNTRL_BC_SWITCHED_AC = ~B_SMC_CNTRL_BC_SWITCHED_AC; // ? 0 : 1;

   // readback mux for noalloc registers
   assign noalloc_rdata =
	  ({8{V0_LO_rstb}} & V0_LO) |
	  ({8{V0_HI_rstb}} & V0_HI) |
	  ({8{I1_LO_rstb}} & I1_LO) |
	  ({8{I1_HI_rstb}} & I1_HI) |
	  ({8{I2_LO_rstb}} & I2_LO) |
	  ({8{I2_HI_rstb}} & I2_HI) |
	  ({8{MAIN_BLOWER_LO_rstb}} & MAIN_BLOWER_LO) |
	  ({8{MAIN_BLOWER_HI_rstb}} & MAIN_BLOWER_HI) |
	  ({8{GEN_FREQ_CTR_LO_rstb}} & GEN_FREQ_CTR_LO) |
	  ({8{GEN_FREQ_CTR_MID_rstb}} & GEN_FREQ_CTR_MID) |
	  ({8{GEN_FREQ_CTR_HI_rstb}} & GEN_FREQ_CTR_HI) |
	  ({8{BC_TACH0_CTR_HI_rstb}} & BC_TACH0_CTR_HI) |
	  ({8{BC_TACH0_CTR_LO_rstb}} & BC_TACH0_CTR_LO) |
	  ({8{BC_TACH1_CTR_HI_rstb}} & BC_TACH1_CTR_HI) |
	  ({8{BC_TACH1_CTR_LO_rstb}} & BC_TACH1_CTR_LO) |
	  ({8{MAINT_MON_rstb}} & {6'h00, MAINT_FALLING, MAINT_RISING}) |
	  ({8{V48_ON_rstb}} & {7'h00, V48_ON}) |
	  ({8{K1_ON_rstb}} & {7'h00, K1_ON}) |
	  ({8{V0_LOCK_OUT_rstb}} & {7'h00, v0_lock_out}) |
	  ({8{I1_LOCK_OUT_rstb}} & {6'h00, i1_lock_out, 1'b0}) |
	  ({8{I2_LOCK_OUT_rstb}} & {5'h00, i2_lock_out, 2'b00}) |
	  ({8{MAIN_LOCK_OUT_rstb}} & {4'h0, main_lock_out, 3'h0}) |
	  ({8{GEN_FREQ_LOCK_OUT_rstb}} & {3'h0, gen_freq_lock_out, 4'h0}) |
	  ({8{BC_TACH0_LOCK_OUT_rstb}} & {2'h0, tach0_lock_out, 5'h0}) |
	  ({8{BC_TACH1_LOCK_OUT_rstb}} & {1'h0, tach1_lock_out, 6'h0}) |
	  ({8{ID_REV_rstb}} & {ID_CONST, REV_CONST}) | 
	({8{SMC_MON_PDU_K1_rstb}} & {7'h00, I_SMC_MON_PDU_K1}) |
	({8{SMC_MON_DC90_OUTPUT_FAULT_rstb}} & {7'h00, I_SMC_MON_DC90_OUTPUT_FAULT}) | 
	({8{SMC_MON_DC90_AC_PWR_FAULT_rstb}} & {6'h00, I_SMC_MON_DC90_AC_PWR_FAULT, 1'h0}) | 
	({8{SMC_MON_DC90_OVR_TMP_rstb}} & {5'h00, I_SMC_MON_DC90_OVR_TMP, 2'h0}) | 
	({8{SMC_MON_DC90_48V_ON_rstb}} & {4'h0, I_SMC_MON_DC90_48V_ON, 3'h0}) |  
	({8{SMC_MON_BC_OUTPUT_FAULT_rstb}} & {7'h00, I_SMC_MON_BC_OUTPUT_FAULT}) | 
	({8{SMC_MON_BC_AC_PWR_FAULT_rstb}} & {6'h00, I_SMC_MON_BC_AC_PWR_FAULT, 1'h0}) | 
	({8{SMC_MON_BC_OVR_TMP_rstb}} & {5'h00, I_SMC_MON_BC_OVR_TMP, 2'h0}) | 
	({8{SMC_MON_BC_PHASE_LOSS_rstb}} & {4'h0, I_SMC_MON_BC_PHASE_LOSS, 3'h0}) | 
	({8{SMC_MON_BC_AC_ON_rstb}} & {7'h00, I_SMC_MON_BC_AC_ON}) | 
	({8{SMC_MON_PDU_JAG_48V_LVL_ON_rstb}} & {7'h00, I_SMC_MON_PDU_JAG_48V_LVL_ON}) | 
	({8{SMC_MON_PDU_JAG_THERMAL_FAULT_rstb}} & {7'h00, I_SMC_MON_PDU_JAG_THERMAL_FAULT}) |
	({8{SMC_MON_PDU_JAG_48V_GOOD_rstb}} & {7'h00, I_SMC_MON_PDU_JAG_48V_GOOD}) | 
	({8{SMC_MON_BC_FAN0_STATE_rstb}} & {7'h00, I_SMC_MON_BC_FAN0_STATE}) | 
	({8{SMC_MON_BC_FAN1_STATE_rstb}} & {6'h00, I_SMC_MON_BC_FAN1_STATE, 1'h0}) |
	({8{SMC_CNTRL_JAG_48VDC_ON_rstb}} & {7'h00, SMC_CNTRL_JAG_48VDC_ON}) |
	({8{SMC_CNTRL_JAG_SWITCHED_AC_rstb}} & {7'h00, SMC_CNTRL_JAG_SWITCHED_AC}) |
	({8{B_SMC_CNTRL_BC_SWITCHED_AC_rstb}} & {7'h00, B_SMC_CNTRL_BC_SWITCHED_AC}) |
	({8{B_CNTRL_BC_48VDC_DC90_rstb}} & {7'h00, B_CNTRL_BC_48VDC_DC90}) |
	({8{B_CNTRL_BC_48VDC_rstb}} & {7'h00, B_CNTRL_BC_48VDC})
   ;

   // create lock out signals for readback of counters. Once the HI
   // register has been read, set the lock out signal until the LO
   // register is read as well (or the MID and LO register for the
   // gen_freq_ctr). This way, the holding register is not updated
   // until software has gotten all bytes of data from the holding 
   // register.
   // The lock out signals are set by the HI rstb, and cleared by 
   // the LO rstb. The lock out states can be read back via IDL. 
   // The lock outs can also be cleared by the CLR_LOCK_OUT reset bit.
   edgesr v0_sr (.edgesrout(v0_lock_out), 
		 .setedge(V0_HI_rstb),
		 .resetedge(~V0_LO_rstb), 
		 .reset((~I_reset_N | CLR_LOCK_OUT)));
   
   edgesr i1_sr (.edgesrout(i1_lock_out), 
		 .setedge(I1_HI_rstb),
		 .resetedge(~I1_LO_rstb), 
		 .reset((~I_reset_N | CLR_LOCK_OUT)));
   
   edgesr i2_sr (.edgesrout(i2_lock_out), 
		 .setedge(I2_HI_rstb),
		 .resetedge(~I2_LO_rstb), 
		 .reset((~I_reset_N | CLR_LOCK_OUT)));
   
   edgesr main_sr (.edgesrout(main_lock_out), 
		   .setedge(MAIN_BLOWER_HI_rstb),
		   .resetedge(~MAIN_BLOWER_LO_rstb), 
		   .reset((~I_reset_N | CLR_LOCK_OUT)));
   
   edgesr gen_freq_sr (.edgesrout(gen_freq_lock_out), 
		       .setedge(GEN_FREQ_CTR_HI_rstb),
		       .resetedge(~GEN_FREQ_CTR_LO_rstb), 
		       .reset((~I_reset_N | CLR_LOCK_OUT)));
   
   edgesr tach0_sr (.edgesrout(tach0_lock_out), 
		   .setedge(BC_TACH0_CTR_HI_rstb),
		   .resetedge(~BC_TACH0_CTR_LO_rstb), 
		   .reset((~I_reset_N | CLR_LOCK_OUT)));
   
   edgesr tach1_sr (.edgesrout(tach1_lock_out), 
		   .setedge(BC_TACH1_CTR_HI_rstb),
		   .resetedge(~BC_TACH1_CTR_LO_rstb), 
		   .reset((~I_reset_N | CLR_LOCK_OUT)));
   
   // implement K1_ON and V48_ON and OC_B_CNTRL_BC_48VDC_DC90, .....//OC_B_CNTRL_BC_48VDC,
// OC_SMC_CNTRL_JAG_SWITCHED_AC,
// OC_SMC_CNTRL_JAG_48VDC_ON, 
// OC_B_SMC_CNTRL_BC_SWITCHED_AC. These are noalloc r/w registers so that
   // we can use K1_ENABLE and V48_ENABLE to force them off when the
   // *_ENABLE signals are deasserted.
   // K1_ON: Derived Clock
   // synopsys async_set_reset "I_reset_N"
   always @ ( K1_ON_wstb or noalloc_wdata or  I_reset_N or K1_ENABLE)
     begin
	if ( I_reset_N == 1'b0 )K1_ON = 1'h0;
	else  if (~K1_ENABLE) // if enable goes low, reset on/off bit
	  begin
	     K1_ON = 1'b0;
	  end
	else if  ( K1_ON_wstb ) // wstb already include enable from IDL code
          begin
             K1_ON = noalloc_wdata[0];
          end
     end

always @ (B_SMC_CNTRL_BC_SWITCHED_AC_wstb or noalloc_wdata or  I_reset_N or K1_ENABLE)
     begin
	if ( I_reset_N == 1'b0 ) B_SMC_CNTRL_BC_SWITCHED_AC = 1'h0;
	else  if (~K1_ENABLE) // if enable goes low, reset on/off bit
	  begin
	 B_SMC_CNTRL_BC_SWITCHED_AC = 1'b0;
	  end
	else if  (B_SMC_CNTRL_BC_SWITCHED_AC_wstb ) // wstb already include enable from IDL code
          begin
          B_SMC_CNTRL_BC_SWITCHED_AC = noalloc_wdata[0];
          end
     end


always @ (SMC_CNTRL_JAG_SWITCHED_AC_wstb or noalloc_wdata or  I_reset_N or K1_ENABLE)
     begin
	if ( I_reset_N == 1'b0 ) SMC_CNTRL_JAG_SWITCHED_AC = 1'h0;
	else  if (~K1_ENABLE) // if enable goes low, reset on/off bit
	  begin
	 SMC_CNTRL_JAG_SWITCHED_AC = 1'b0;
	  end
	else if  (SMC_CNTRL_JAG_SWITCHED_AC_wstb ) // wstb already include enable from IDL code
          begin
          SMC_CNTRL_JAG_SWITCHED_AC = noalloc_wdata[0];
          end
     end

   always @ (B_CNTRL_BC_48VDC_DC90_wstb or noalloc_wdata or  I_reset_N or B_DC90_48V_Enable)
     begin
	if ( I_reset_N == 1'b0 ) B_CNTRL_BC_48VDC_DC90 = 1'h0;
	else  if (~B_DC90_48V_Enable) // if enable goes low, reset on/off bit
	  begin
	 B_CNTRL_BC_48VDC_DC90 = 1'b0;
	  end
	else  if (B_CNTRL_BC_48VDC_DC90_wstb ) // wstb already include enable from IDL code
          begin
 B_CNTRL_BC_48VDC_DC90= noalloc_wdata[0];
          end
     end

   always @ (B_CNTRL_BC_48VDC_wstb or noalloc_wdata or  I_reset_N or V48_ENABLE)
     begin
	if ( I_reset_N == 1'b0 ) B_CNTRL_BC_48VDC = 1'h0;
	else  if (~V48_ENABLE) // if enable goes low, reset on/off bit
	  begin
	 B_CNTRL_BC_48VDC = 1'b0;
	  end
	else  if (B_CNTRL_BC_48VDC_wstb ) // wstb already include enable from IDL code
          begin
          B_CNTRL_BC_48VDC = noalloc_wdata[0];
          end
     end

   always @ (SMC_CNTRL_JAG_48VDC_ON_wstb or noalloc_wdata or  I_reset_N or V48_ENABLE)
     begin
	if ( I_reset_N == 1'b0 ) SMC_CNTRL_JAG_48VDC_ON = 1'h0;
	else  if (~V48_ENABLE) // if enable goes low, reset on/off bit
	  begin
	 SMC_CNTRL_JAG_48VDC_ON = 1'b0;
	  end
	else  if ( SMC_CNTRL_JAG_48VDC_ON_wstb) // wstb already include enable from IDL code
          begin
 SMC_CNTRL_JAG_48VDC_ON = noalloc_wdata[0];
          end
     end


   // V48_ON: Derived Clock
   // synopsys async_set_reset "I_reset_N"
   always @ ( V48_ON_wstb or noalloc_wdata or  I_reset_N or V48_ENABLE)
     begin
	if ( I_reset_N == 1'b0 )V48_ON = 1'h0;
	else  if (~V48_ENABLE) // if enable goes low, reset on/off bit
	  begin
	     V48_ON = 1'b0;
	  end
	else  if ( V48_ON_wstb ) // wstb already include enable from IDL code
          begin
             V48_ON = noalloc_wdata[0];
          end
     end

   // mux monitor inputs that are fed to the general purpose frequency counter. If
   // GEN_FREQ_CTR_MUX[4] is low, use one of the I_monitors inputs. If it is high,
   // use one of the outputs that can be monitored.
   
   // lower four bits select from I_monitors inputs.
   assign mon_freq_ctr_in = I_monitors [GEN_FREQ_CTR_MUX[3:0]];
   
   // select from outputs that can be monitored. Use and/or to avoid priority encoding
   assign io_freq_ctr_in = ((GEN_FREQ_CTR_MUX [3:0] == 4'h0) & OC_48v_on) |
			   ((GEN_FREQ_CTR_MUX [3:0] == 4'h1) & OC_k1_on) |
	                   ((GEN_FREQ_CTR_MUX [3:0] == 4'h2) & I_SMC_MON_BC_FAN0_TACH) |
	                   ((GEN_FREQ_CTR_MUX [3:0] == 4'h3) & I_SMC_MON_BC_FAN1_TACH) ;
//	                   ((GEN_FREQ_CTR_MUX [3:0] == 4'h2) & OC_aux_ctl[0]) |
//	                   ((GEN_FREQ_CTR_MUX [3:0] == 4'h3) & OC_aux_ctl[1]) |
//	                   ((GEN_FREQ_CTR_MUX [3:0] == 4'h4) & OC_aux_ctl[2]) |
//	                   ((GEN_FREQ_CTR_MUX [3:0] == 4'h5) & OC_aux_ctl[3]) ;

   // use GEN_FREQ_CTR_MUX[4] to pick from the two above signals:
   assign gen_freq_ctr_in = GEN_FREQ_CTR_MUX[4] ? mon_freq_ctr_in : io_freq_ctr_in;
      
   freq_ctr #(17) V0_ctr (.I_clk(I_clk),
		    .I_signal(I_V0_mon),
		    .I_enable(CTR_CTL),
		    .I_clr_regs(CLR_REGS),
		    .I_clr_ctrs(CLR_CTRS),
		    .I_lock_out(v0_lock_out),	  
		    .I_reset_N(reset_N),
		    .O_data({V0_HI,
			     V0_LO,
			     ignore_V0}));

   freq_ctr #(17) I1_ctr (.I_clk(I_clk),
		    .I_signal(I_I1_mon),
		    .I_enable(CTR_CTL),
		    .I_clr_regs(CLR_REGS),
		    .I_clr_ctrs(CLR_CTRS),
		    .I_lock_out(i1_lock_out),	  
		    .I_reset_N(reset_N),
		    .O_data({I1_HI,
			     I1_LO,
			     ignore_I1}));
   
   freq_ctr #(17) I2_ctr (.I_clk(I_clk),
			  .I_signal(I_I2_mon),
			  .I_enable(CTR_CTL),
			  .I_clr_regs(CLR_REGS),
			  .I_clr_ctrs(CLR_CTRS),
			  .I_lock_out(i2_lock_out),	  
			  .I_reset_N(reset_N),
			  .O_data({I2_HI,
				   I2_LO,
				   ignore_I2}));
   
   freq_ctr #(23) MAIN_ctr (.I_clk(I_clk),
		      .I_signal(I_main_blower_mon),
		      .I_enable(CTR_CTL),
		      .I_clr_regs(CLR_REGS),
		      .I_clr_ctrs(CLR_CTRS),
 		      .I_lock_out(main_lock_out),	  
		      .I_reset_N(reset_N),
		      .O_data({MAIN_BLOWER_HI,
			       MAIN_BLOWER_LO,
			       ignore_MAIN_BLOWER}));
 

   
   freq_ctr #(24) gen_freq_ctr (.I_clk(I_clk),
			     .I_signal(gen_freq_ctr_in),
			     .I_enable(CTR_CTL),
			     .I_clr_regs(CLR_REGS),
			     .I_clr_ctrs(CLR_CTRS),
			     .I_lock_out(gen_freq_lock_out),	  
			     .I_reset_N(reset_N),
			     .O_data({GEN_FREQ_CTR_HI, 
				      GEN_FREQ_CTR_MID, 
				      GEN_FREQ_CTR_LO}));

   state_mon maint_mon (.I_clk(I_clk),
			.I_signal(I_maint_mon),
			.I_clr(CLR_MAINT_REG),
			.I_reset_N(reset_N),
			.O_rising_data(MAINT_RISING),
			.O_falling_data(MAINT_FALLING));

   tach_freq_ctr tach0_freq_ctr (.I_clk(I_clk), 
				 .I_signal(I_SMC_MON_BC_FAN0_TACH), 
				 .I_enable(CTR_CTL), 
				 .I_clr_regs(CLR_REGS),
				 .I_clr_ctrs(CLR_CTRS),
				 .I_lock_out(tach0_lock_out),
				 .I_reset_N(reset_N),
				 .I_CTL(BC_TACH0_CTL),
				 .O_data({BC_TACH0_CTR_HI, BC_TACH0_CTR_LO}));
   
   tach_freq_ctr tach1_freq_ctr (.I_clk(I_clk), 
				 .I_signal(I_SMC_MON_BC_FAN1_TACH), 
				 .I_enable(CTR_CTL), 
				 .I_clr_regs(CLR_REGS),
				 .I_clr_ctrs(CLR_CTRS),
				 .I_lock_out(tach0_lock_out),
				 .I_reset_N(reset_N),
				 .I_CTL(BC_TACH1_CTL),
				 .O_data({BC_TACH1_CTR_HI, BC_TACH1_CTR_LO}));
   
endmodule // smc_fpga

		      

module freq_ctr (I_clk, 
		 I_signal, 
		 I_enable, 
		 I_clr_regs,
		 I_clr_ctrs,
		 I_lock_out,
		 I_reset_N,
		 O_data);

   parameter CTRWIDTH = 16;
   parameter all_ones =
	     CTRWIDTH == 24 ? 24'hffffff :
	     CTRWIDTH == 16 ? 16'hffff :
	     CTRWIDTH == 17 ? 17'h1ffff :
	     CTRWIDTH == 23 ? 23'h7fffff : 1;
   
	     
   
   input I_clk,
	 I_signal,
	 I_enable,
	 I_reset_N,
	 I_clr_regs,
	 I_clr_ctrs,
	 I_lock_out;
   
   output [CTRWIDTH-1:0] O_data;

   reg [CTRWIDTH-1:0] holding_reg,
		      ctr_reg;
   wire rollover;
   
   wire start_ctr;
   reg [1:0] shft_reg;
   
   wire [CTRWIDTH-1:0] O_data = holding_reg;
   
   // async reset for ctr
   wire ctr_reset = ~I_reset_N;
   // async reset for holding reg
   wire holdreg_reset = ~I_reset_N;

   // create start_ctr signal. This is a one clock tick wide pulse that
   // indicates when to reset the counter and trnsfer the counter data to
   // the holding reg. The start_ctr occurs when the I_signal 
   // has a rising edge. Detect the rising edge by putting I_signal into
   // a two stage shift reg and look for the two stages to be at a 2'b10
   // pattern
   always @(posedge I_clk or negedge I_reset_N) begin
      if (~I_reset_N) shft_reg <= 2'b00;
      else shft_reg <= {shft_reg[0], I_signal};
   end
   assign start_ctr = (shft_reg == 2'b10);
   
   always @(posedge I_clk or posedge ctr_reset) begin
      if (ctr_reset) ctr_reg <= 24'h0000;
      else begin
	 if (start_ctr | ~I_enable | I_clr_ctrs) ctr_reg <= 0;
	 else ctr_reg <= ctr_reg + 1;
      end
   end

   // watch for counter rollover. If it reaches all ones, transfer
   // data to holding reg to indicate that no signal is present.
   assign rollover = (ctr_reg == all_ones);
   
   // update holding reg when signal input seen. If in the middle 
   // of a read sequence (lock out) of the holding register, don;t update
   // the holding reg.
   always @(posedge I_clk or posedge holdreg_reset) begin
      if (holdreg_reset) holding_reg <= 24'h000000;
      else begin
	 if (I_clr_regs) holding_reg <= 24'h000000;
	 else if ((start_ctr | rollover) & ~I_lock_out) holding_reg <= ctr_reg;
      end
   end
   
   
   
endmodule
 
module state_mon (I_clk,
		  I_signal,
		  I_clr,
		  I_reset_N,
		  O_rising_data,
		  O_falling_data);
 
   input I_clk,
	 I_signal,
	 I_clr,
	 I_reset_N;
   
   output O_rising_data,
	  O_falling_data;

   wire I_clk,
	I_signal,
	I_clr,
	I_reset_N;
   
   reg O_rising_data,
	O_falling_data;
   reg [1:0] shft_reg;
   wire falling_edge,
	rising_edge;
   
   // shift input data into shift register to look for changes 
   always @(posedge I_clk or negedge I_reset_N) begin
      if (~I_reset_N) shft_reg <= 2'b00;
      else shft_reg <= {shft_reg[0], I_signal};
   end

   assign falling_edge = (shft_reg == 2'b10);
   assign rising_edge = (shft_reg == 2'b01);
   
   //  latch edges into register and clear with clear_maint signal
   always @(posedge I_clk or negedge I_reset_N) begin
      if (~I_reset_N) begin
	 O_falling_data <= 0;
	 O_rising_data <= 0;
      end
      else begin
	 if (I_clr) begin // synch clear
	    O_falling_data <= 0;
	    O_rising_data <= 0;
	 end
	 else begin // latch new value only if not already set
	    if (~O_falling_data) O_falling_data <= falling_edge;
	    if (~O_rising_data) O_rising_data <= rising_edge;
	 end
      end
   end
   
endmodule // state_mon

// tach_freq_ctr is similar to the normal freq ctr but uses hte I_signal
// to clock the counter. The processor will act as the gate. The I_CTL 
// signal will set the counter back to 0 and transfer the counter value
// to the holding reg
module tach_freq_ctr (I_clk, 
		      I_signal, 
		      I_enable, 
		      I_clr_regs,
		      I_clr_ctrs,
		      I_lock_out,
		      I_reset_N,
		      I_CTL,
		      O_data);
   
   parameter CTRWIDTH = 16;
   parameter all_ones =
	     CTRWIDTH == 24 ? 24'hffffff :
	     CTRWIDTH == 16 ? 16'hffff :
	     CTRWIDTH == 17 ? 17'h1ffff :
	     CTRWIDTH == 23 ? 23'h7fffff : 1;
   
	     
   
   input I_clk,
	 I_signal,
	 I_enable,
	 I_reset_N,
	 I_clr_regs,
	 I_clr_ctrs,
	 I_lock_out,
	 I_CTL;
   
   output [CTRWIDTH-1:0] O_data;

   reg [CTRWIDTH-1:0] holding_reg,
		      ctr_reg;
   wire rollover;
   
   wire start_ctr;
   reg [1:0] shft_reg;
   reg [1:0] ctl_shft_reg;
   
   wire [CTRWIDTH-1:0] O_data = holding_reg;
   
   // async reset for ctr
   wire ctr_reset = ~I_reset_N;
   // async reset for holding reg
   wire holdreg_reset = ~I_reset_N;

   // create start_ctr signal. This is a one clock tick wide pulse that
   // indicates when to reset the counter and trnsfer the counter data to
   // the holding reg. The start_ctr occurs when the I_signal 
   // has a rising edge. Detect the rising edge by putting I_signal into
   // a two stage shift reg and look for the two stages to be at a 2'b10
   // pattern
   always @(posedge I_clk or negedge I_reset_N) begin
      if (~I_reset_N) shft_reg <= 2'b00;
      else shft_reg <= {shft_reg[0], I_signal};
   end

   // shift in I_CTL and llok for rising edge to reset counter
   always @(posedge I_clk or negedge I_reset_N) begin
      if (~I_reset_N) ctl_shft_reg <= 2'b00;
      else ctl_shft_reg <= {ctl_shft_reg[0], I_CTL};
   end
   
   assign start_ctr = (ctl_shft_reg == 2'b01);  //(shft_reg == 2'b10);

   always @(posedge I_clk or posedge ctr_reset) begin
      if (ctr_reset) ctr_reg <= 24'h0000;
      else begin
	 if (start_ctr | ~I_enable | I_clr_ctrs) ctr_reg <= 0;
	 else if (shft_reg == 2'b10) ctr_reg <= ctr_reg + 1;
      end
   end

   // watch for counter rollover. If it reaches all ones, transfer
   // data to holding reg to indicate that no signal is present.
   assign rollover = (ctr_reg == all_ones);
   
   // update holding reg when signal input seen. If in the middle 
   // of a read sequence (lock out) of the holding register, don;t update
   // the holding reg.
   always @(posedge I_clk or posedge holdreg_reset) begin
      if (holdreg_reset) holding_reg <= 24'h000000;
      else begin
	 if (I_clr_regs) holding_reg <= 24'h000000;
	 else if ((start_ctr | rollover) & ~I_lock_out) holding_reg <= ctr_reg;
      end
   end
   
   
   
endmodule
 
