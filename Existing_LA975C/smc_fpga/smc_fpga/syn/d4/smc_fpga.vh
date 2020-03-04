module smc_fpga (
  I_ale,
  IN_wr,
  IN_rd,
  IN_psen,
  BI_port0,
  I_port2,
  I_clk,
  I_monitors,
  OC_48v_on,
  OC_k1_on,
  I_main_blower_mon,
  I_V0_mon,
  I_I1_mon,
  I_I2_mon,
  I_maint_mon,
  I_reset_N,
  I_SMC_MON_DC90_OUTPUT_FAULT,
  I_SMC_MON_DC90_AC_PWR_FAULT,
  I_SMC_MON_DC90_OVR_TMP,
  I_SMC_MON_DC90_48V_ON,
  I_SMC_MON_BC_OUTPUT_FAULT,
  I_SMC_MON_BC_AC_PWR_FAULT,
  I_SMC_MON_BC_OVR_TMP,
  I_SMC_MON_BC_PHASE_LOSS,
  I_SMC_MON_BC_AC_ON,
  I_SMC_MON_PDU_JAG_THERMAL_FAULT,
  I_SMC_MON_BC_FAN0_STATE,
  I_SMC_MON_PDU_JAG_48V_GOOD,
  I_SMC_MON_BC_FAN1_STATE,
  I_SMC_MON_BC_FAN0_TACH,
  I_SMC_MON_BC_FAN1_TACH,
  OC_B_CNTRL_BC_48VDC_DC90,
  OC_B_CNTRL_BC_48VDC,
  OC_SMC_CNTRL_JAG_SWITCHED_AC,
  OC_SMC_CNTRL_JAG_48VDC_ON,
  OC_B_SMC_CNTRL_BC_SWITCHED_AC
);
input I_ale ;
input IN_wr ;
input IN_rd ;
input IN_psen ;
inout [7:0] BI_port0 /* synthesis syn_tristate = 1 */;
input [7:0] I_port2 ;
input I_clk ;
input [10:0] I_monitors ;
output OC_48v_on ;
output OC_k1_on ;
input I_main_blower_mon ;
input I_V0_mon ;
input I_I1_mon ;
input I_I2_mon ;
input I_maint_mon ;
input I_reset_N ;
input I_SMC_MON_DC90_OUTPUT_FAULT ;
input I_SMC_MON_DC90_AC_PWR_FAULT ;
input I_SMC_MON_DC90_OVR_TMP ;
input I_SMC_MON_DC90_48V_ON ;
input I_SMC_MON_BC_OUTPUT_FAULT ;
input I_SMC_MON_BC_AC_PWR_FAULT ;
input I_SMC_MON_BC_OVR_TMP ;
input I_SMC_MON_BC_PHASE_LOSS ;
input I_SMC_MON_BC_AC_ON ;
input I_SMC_MON_PDU_JAG_THERMAL_FAULT ;
input I_SMC_MON_BC_FAN0_STATE ;
input I_SMC_MON_PDU_JAG_48V_GOOD ;
input I_SMC_MON_BC_FAN1_STATE ;
input I_SMC_MON_BC_FAN0_TACH ;
input I_SMC_MON_BC_FAN1_TACH ;
output OC_B_CNTRL_BC_48VDC_DC90 ;
output OC_B_CNTRL_BC_48VDC ;
output OC_SMC_CNTRL_JAG_SWITCHED_AC ;
output OC_SMC_CNTRL_JAG_48VDC_ON ;
output OC_B_SMC_CNTRL_BC_SWITCHED_AC ;
