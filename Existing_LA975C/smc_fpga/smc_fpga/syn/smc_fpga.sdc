# Synplicity, Inc. constraint file
# f:\work_area\smc_fpga_orig\syn\smc_fpga.sdc
# Written on Tue Mar 19 14:22:04 2002
# by 6.2.4 Scope Editor

#
# Clocks
#

#
# Clock to Clock
#

#
# Inputs/Outputs
#

#
# Registers
#

#
# Multi-Cycle Paths
#

#
# False Paths
#

#
# Attributes
#
define_attribute          {I_SMC_MON_DC90_AC_PWR_FAULT} ql_placement {io1}
define_attribute          {I_SMC_MON_DC90_OVR_TMP} ql_placement {io2}
define_attribute          {OC_k1_on} ql_placement {io3}

define_attribute          {OC_B_CNTRL_BC_48VDC_DC90} ql_placement {io5}
define_attribute          {I_SMC_MON_DC90_OUTPUT_FAULT} ql_placement {io6}
define_attribute          {I_monitors[8]} ql_placement {io7}
define_attribute          {I_maint_mon} ql_placement {io8}
define_attribute          {I_monitors[5]} ql_placement {io9}

define_attribute          {I_monitors[6]} ql_placement {io12}
define_attribute          {I_I2_mon} ql_placement {io13}
define_attribute          {I_monitors[7]} ql_placement {io14}
define_attribute          {I_monitors[2]} ql_placement {io15}
define_attribute          {I_I1_mon} ql_placement {io16}
define_attribute          {I_V0_mon} ql_placement {io17}
define_attribute          {I_monitors[1]} ql_placement {io18}

define_attribute          {I_SMC_MON_DC90_48V_ON} ql_placement {io20}


define_attribute          {I_main_blower_mon} ql_placement {io27}
define_attribute          {I_monitors[3]} ql_placement {io28}

define_attribute          {I_SMC_MON_BC_AC_PWR_FAULT} ql_placement {io29}
define_attribute          {I_SMC_MON_BC_OVR_TMP} ql_placement {io30}
define_attribute          {OC_B_CNTRL_BC_48VDC} ql_placement {io31}
define_attribute          {I_SMC_MON_BC_OUTPUT_FAULT} ql_placement {io32}

define_attribute          {I_SMC_MON_BC_PHASE_LOSS} ql_placement {io34}

define_attribute          {I_SMC_MON_BC_FAN0_TACH} ql_placement {io35}

define_attribute          {I_SMC_MON_BC_FAN1_TACH} ql_placement {io37}
define_attribute          {I_SMC_MON_BC_FAN0_STATE} ql_placement {io38}
define_attribute          {I_SMC_MON_BC_FAN1_STATE} ql_placement {io39}

define_attribute          {I_monitors[10]} ql_placement {io41}
define_attribute          {I_monitors[4]} ql_placement {io42}
define_attribute          {I_port2[1]} ql_placement {io43}
define_attribute          {I_port2[2]} ql_placement {io44}
define_attribute          {I_port2[7]} ql_placement {io45}

define_attribute          {I_port2[6]} ql_placement {io47}
define_attribute          {I_port2[0]} ql_placement {io48}

define_attribute          {OC_SMC_CNTRL_JAG_SWITCHED_AC} ql_placement {io49}
define_attribute          {OC_SMC_CNTRL_JAG_48VDC_ON} ql_placement {io50}
define_attribute          {I_port2[5]} ql_placement {io51}

define_attribute          {I_monitors[9]} ql_placement {io54}
define_attribute          {I_port2[3]} ql_placement {io55}
define_attribute          {IN_rd} ql_placement {io56}
define_attribute          {I_port2[4]} ql_placement {io57}
define_attribute          {BI_port0[7]} ql_placement {io58}
define_attribute          {BI_port0[6]} ql_placement {io59}
define_attribute          {BI_port0[5]} ql_placement {io60}

define_attribute          {BI_port0[2]} ql_placement {io62}


define_attribute          {BI_port0[4]} ql_placement {io68}
define_attribute          {BI_port0[0]} ql_placement {io69}
define_attribute          {BI_port0[3]} ql_placement {io70}
define_attribute          {BI_port0[1]} ql_placement {io71}
define_attribute          {IN_wr} ql_placement {io72}
define_attribute          {I_SMC_MON_PDU_JAG_48V_GOOD} ql_placement {io73}
define_attribute          {I_SMC_MON_PDU_JAG_THERMAL_FAULT} ql_placement {io74}

define_attribute          {I_SMC_MON_BC_AC_ON} ql_placement {io78}

define_attribute          {OC_B_SMC_CNTRL_BC_SWITCHED_AC} ql_placement {io80}
define_attribute          {IN_psen} ql_placement {io81}

define_attribute          {OC_48v_on} ql_placement {io83}
define_attribute          {I_monitors[0]} ql_placement {io84}



#hdrive
define_attribute          {I_reset_N} ql_placement {io64}

#clock
define_attribute          {I_ale} ql_placement {io66}

#clock
define_attribute          {I_clk} ql_placement {io22}

define_attribute          {I_ale} ql_padtype {CLOCK}
define_attribute          {I_reset_N} ql_padtype {INPUT}


#
# Other Constraints
#
