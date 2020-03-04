/****************************************************************************

   BEHAVIORAL VERILOG HEADER FILE FOR INSTRUMENT SMC_FPGA

   PREPARED BY IDL VERSION 2.30e

   DO NOT EDIT THIS FILE - YOU'LL LOSE THE ABILITY TO RETRUN IDL

  %W% %G% Copyright Teradyne, Inc.
****************************************************************************/


`define SMC_FPGA_W_DATA smc_fpga.smc_fpga_idl.I_w_data
`define SMC_FPGA_R_DATA smc_fpga.smc_fpga_idl.O_r_data


/****************************************************************************
    Field SMC_MON_PDU_JAG_48V_LVL_ON ( not generated by IDL ) 
     Used on Jaguar this is feedback for the control Input Signal, On=Low    
****************************************************************************/
`define SMC_FPGA_SMC_MON_PDU_JAG_48V_LVL_ON__MASK          1'h1
`define SMC_FPGA_SMC_MON_PDU_JAG_48V_LVL_ON_rstb smc_fpga.smc_fpga_idl.SMC_MON_PDU_JAG_48V_LVL_ON_rstb


/****************************************************************************
    Field SMC_MON_PDU_JAG_THERMAL_FAULT ( not generated by IDL ) 
    Thermal Fault output from 48V Jag Power Supply                           
****************************************************************************/
`define SMC_FPGA_SMC_MON_PDU_JAG_THERMAL_FAULT__MASK          1'h1
`define SMC_FPGA_SMC_MON_PDU_JAG_THERMAL_FAULT_rstb smc_fpga.smc_fpga_idl.SMC_MON_PDU_JAG_THERMAL_FAULT_rstb


/****************************************************************************
    Field SMC_MON_PDU_JAG_48V_GOOD ( not generated by IDL ) 
    BOBCAT 48V interlock OK = Low, Jag output OK OK = HIGH                   
****************************************************************************/
`define SMC_FPGA_SMC_MON_PDU_JAG_48V_GOOD__MASK          1'h1
`define SMC_FPGA_SMC_MON_PDU_JAG_48V_GOOD_rstb smc_fpga.smc_fpga_idl.SMC_MON_PDU_JAG_48V_GOOD_rstb


/****************************************************************************
    Field SMC_CNTRL_JAG_48VDC_ON ( not generated by IDL ) 
    On/off control bit for Jaguar 48V                                        
****************************************************************************/
`define SMC_FPGA_SMC_CNTRL_JAG_48VDC_ON__MASK          1'h1
`define SMC_FPGA_SMC_CNTRL_JAG_48VDC_ON_ON          1'h1
`define SMC_FPGA_SMC_CNTRL_JAG_48VDC_ON_OFF          1'h0
`define SMC_FPGA_SMC_CNTRL_JAG_48VDC_ON_wstb smc_fpga.smc_fpga_idl.SMC_CNTRL_JAG_48VDC_ON_wstb
`define SMC_FPGA_SMC_CNTRL_JAG_48VDC_ON_rstb smc_fpga.smc_fpga_idl.SMC_CNTRL_JAG_48VDC_ON_rstb


/****************************************************************************
    Field SMC_CNTRL_JAG_SWITCHED_AC ( not generated by IDL ) 
    On/off control bit for Jaguar AC                                         
****************************************************************************/
`define SMC_FPGA_SMC_CNTRL_JAG_SWITCHED_AC__MASK          1'h1
`define SMC_FPGA_SMC_CNTRL_JAG_SWITCHED_AC_ON          1'h1
`define SMC_FPGA_SMC_CNTRL_JAG_SWITCHED_AC_OFF          1'h0
`define SMC_FPGA_SMC_CNTRL_JAG_SWITCHED_AC_wstb smc_fpga.smc_fpga_idl.SMC_CNTRL_JAG_SWITCHED_AC_wstb
`define SMC_FPGA_SMC_CNTRL_JAG_SWITCHED_AC_rstb smc_fpga.smc_fpga_idl.SMC_CNTRL_JAG_SWITCHED_AC_rstb


/****************************************************************************
    Field SMC_MON_BC_FAN1_STATE ( not generated by IDL ) 
     Input the state of the multiSpeed fan bit 1                             
****************************************************************************/
`define SMC_FPGA_SMC_MON_BC_FAN1_STATE__MASK          1'h1
`define SMC_FPGA_SMC_MON_BC_FAN1_STATE_rstb smc_fpga.smc_fpga_idl.SMC_MON_BC_FAN1_STATE_rstb


/****************************************************************************
    Field SMC_MON_BC_FAN0_STATE ( not generated by IDL ) 
    Input the state of the multiSpeed fan bit 0                              
****************************************************************************/
`define SMC_FPGA_SMC_MON_BC_FAN0_STATE__MASK          1'h1
`define SMC_FPGA_SMC_MON_BC_FAN0_STATE_rstb smc_fpga.smc_fpga_idl.SMC_MON_BC_FAN0_STATE_rstb


/****************************************************************************
    Field SMC_MON_BC_AC_ON ( not generated by IDL ) 
    On/off control readback bit for K1                                       
****************************************************************************/
`define SMC_FPGA_SMC_MON_BC_AC_ON__MASK          1'h1
`define SMC_FPGA_SMC_MON_BC_AC_ON_rstb smc_fpga.smc_fpga_idl.SMC_MON_BC_AC_ON_rstb


/****************************************************************************
    Field SMC_MON_BC_PHASE_LOSS ( not generated by IDL ) 
    Phase Loss signal Bobcat 48V supply Low Active                           
****************************************************************************/
`define SMC_FPGA_SMC_MON_BC_PHASE_LOSS__MASK          1'h1
`define SMC_FPGA_SMC_MON_BC_PHASE_LOSS_rstb smc_fpga.smc_fpga_idl.SMC_MON_BC_PHASE_LOSS_rstb


/****************************************************************************
    Field SMC_MON_BC_OVR_TMP ( not generated by IDL ) 
    Overtemperature signal Bobcat 48V supply Low Active                      
****************************************************************************/
`define SMC_FPGA_SMC_MON_BC_OVR_TMP__MASK          1'h1
`define SMC_FPGA_SMC_MON_BC_OVR_TMP_rstb smc_fpga.smc_fpga_idl.SMC_MON_BC_OVR_TMP_rstb


/****************************************************************************
    Field SMC_MON_BC_AC_PWR_FAULT ( not generated by IDL ) 
    AC power fault Bobcat 48V supply Low Active                              
****************************************************************************/
`define SMC_FPGA_SMC_MON_BC_AC_PWR_FAULT__MASK          1'h1
`define SMC_FPGA_SMC_MON_BC_AC_PWR_FAULT_rstb smc_fpga.smc_fpga_idl.SMC_MON_BC_AC_PWR_FAULT_rstb


/****************************************************************************
    Field SMC_MON_BC_OUTPUT_FAULT ( not generated by IDL ) 
    Output bad Bobcat 48V supply Low Active                                  
****************************************************************************/
`define SMC_FPGA_SMC_MON_BC_OUTPUT_FAULT__MASK          1'h1
`define SMC_FPGA_SMC_MON_BC_OUTPUT_FAULT_rstb smc_fpga.smc_fpga_idl.SMC_MON_BC_OUTPUT_FAULT_rstb


/****************************************************************************
    Field SMC_MON_DC90_48V_ON ( not generated by IDL ) 
    Feedback from the control side of the opto re: the PS state On = High    
****************************************************************************/
`define SMC_FPGA_SMC_MON_DC90_48V_ON__MASK          1'h1
`define SMC_FPGA_SMC_MON_DC90_48V_ON_rstb smc_fpga.smc_fpga_idl.SMC_MON_DC90_48V_ON_rstb


/****************************************************************************
    Field SMC_MON_DC90_OVR_TMP ( not generated by IDL ) 
    Overtemperature signal DC90 supply Low Active                            
****************************************************************************/
`define SMC_FPGA_SMC_MON_DC90_OVR_TMP__MASK          1'h1
`define SMC_FPGA_SMC_MON_DC90_OVR_TMP_rstb smc_fpga.smc_fpga_idl.SMC_MON_DC90_OVR_TMP_rstb


/****************************************************************************
    Field SMC_MON_DC90_AC_PWR_FAULT ( not generated by IDL ) 
    AC input fault DC90 supply Low Active                                    
****************************************************************************/
`define SMC_FPGA_SMC_MON_DC90_AC_PWR_FAULT__MASK          1'h1
`define SMC_FPGA_SMC_MON_DC90_AC_PWR_FAULT_rstb smc_fpga.smc_fpga_idl.SMC_MON_DC90_AC_PWR_FAULT_rstb


/****************************************************************************
    Field SMC_MON_DC90_OUTPUT_FAULT ( not generated by IDL ) 
    Output bad DC90 supply Low Active                                        
****************************************************************************/
`define SMC_FPGA_SMC_MON_DC90_OUTPUT_FAULT__MASK          1'h1
`define SMC_FPGA_SMC_MON_DC90_OUTPUT_FAULT_rstb smc_fpga.smc_fpga_idl.SMC_MON_DC90_OUTPUT_FAULT_rstb


/****************************************************************************
    Field BC_TACH0_LOCK_OUT ( not generated by IDL ) 
    Lock out state of the GEN_FREQ counter readback                          
****************************************************************************/
`define SMC_FPGA_BC_TACH0_LOCK_OUT__MASK          1'h1
`define SMC_FPGA_BC_TACH0_LOCK_OUT_rstb smc_fpga.smc_fpga_idl.BC_TACH0_LOCK_OUT_rstb


/****************************************************************************
    Field BC_TACH1_LOCK_OUT ( not generated by IDL ) 
    Lock out state of the GEN_FREQ counter readback                          
****************************************************************************/
`define SMC_FPGA_BC_TACH1_LOCK_OUT__MASK          1'h1
`define SMC_FPGA_BC_TACH1_LOCK_OUT_rstb smc_fpga.smc_fpga_idl.BC_TACH1_LOCK_OUT_rstb


/****************************************************************************
    Field GEN_FREQ_LOCK_OUT ( not generated by IDL ) 
    Lock out state of the GEN_FREQ counter readback                          
****************************************************************************/
`define SMC_FPGA_GEN_FREQ_LOCK_OUT__MASK          1'h1
`define SMC_FPGA_GEN_FREQ_LOCK_OUT_rstb smc_fpga.smc_fpga_idl.GEN_FREQ_LOCK_OUT_rstb


/****************************************************************************
    Field MAIN_LOCK_OUT ( not generated by IDL ) 
    Lock out state of the MAIN_BLOWER counter readback                       
****************************************************************************/
`define SMC_FPGA_MAIN_LOCK_OUT__MASK            1'h1
`define SMC_FPGA_MAIN_LOCK_OUT_rstb smc_fpga.smc_fpga_idl.MAIN_LOCK_OUT_rstb


/****************************************************************************
    Field I2_LOCK_OUT ( not generated by IDL ) 
    Lock out state of the I2 counter readback                                
****************************************************************************/
`define SMC_FPGA_I2_LOCK_OUT__MASK              1'h1
`define SMC_FPGA_I2_LOCK_OUT_rstb smc_fpga.smc_fpga_idl.I2_LOCK_OUT_rstb


/****************************************************************************
    Field I1_LOCK_OUT ( not generated by IDL ) 
    Lock out state of the I1 counter readback                                
****************************************************************************/
`define SMC_FPGA_I1_LOCK_OUT__MASK              1'h1
`define SMC_FPGA_I1_LOCK_OUT_rstb smc_fpga.smc_fpga_idl.I1_LOCK_OUT_rstb


/****************************************************************************
    Field V0_LOCK_OUT ( not generated by IDL ) 
    Lock out state of the V0 counter readback                                
****************************************************************************/
`define SMC_FPGA_V0_LOCK_OUT__MASK              1'h1
`define SMC_FPGA_V0_LOCK_OUT_rstb smc_fpga.smc_fpga_idl.V0_LOCK_OUT_rstb


/****************************************************************************
    Field MAINT_MON ( not generated by IDL ) 
    Maintainence signal monitor readback                                     
****************************************************************************/
`define SMC_FPGA_MAINT_MON__MASK                2'h3
`define SMC_FPGA_MAINT_MON_rstb smc_fpga.smc_fpga_idl.MAINT_MON_rstb


/****************************************************************************
    Field ID_REV ( not generated by IDL ) 
    ID and revision of FPGA                                                  
****************************************************************************/
`define SMC_FPGA_ID_REV__MASK                  8'hff
`define SMC_FPGA_ID_REV_rstb smc_fpga.smc_fpga_idl.ID_REV_rstb


/****************************************************************************
    Field BC_TACH1_CTL ( in module idl_beh.v ) 
****This field does not retain data... it is active high pulse
     Control bit for TACH1 counters                                          
****************************************************************************/
`define SMC_FPGA_BC_TACH1_CTL__MASK             1'h1
`define SMC_FPGA_BC_TACH1_CTL smc_fpga.smc_fpga_idl.BC_TACH1_CTL


/****************************************************************************
    Field BC_TACH0_CTL ( in module idl_beh.v ) 
****This field does not retain data... it is active high pulse
     Control bit for TACH0 counters                                          
****************************************************************************/
`define SMC_FPGA_BC_TACH0_CTL__MASK             1'h1
`define SMC_FPGA_BC_TACH0_CTL smc_fpga.smc_fpga_idl.BC_TACH0_CTL


/****************************************************************************
    Field BC_TACH1_CTR_HI ( not generated by IDL ) 
    Readback for upper 8 bits of Bobcat fan 1 frequency counter              
****************************************************************************/
`define SMC_FPGA_BC_TACH1_CTR_HI__MASK         8'hff
`define SMC_FPGA_BC_TACH1_CTR_HI_rstb smc_fpga.smc_fpga_idl.BC_TACH1_CTR_HI_rstb


/****************************************************************************
    Field BC_TACH1_CTR_LO ( not generated by IDL ) 
    Readback for upper 8 bits of Bobcat fan 1 frequency counter              
****************************************************************************/
`define SMC_FPGA_BC_TACH1_CTR_LO__MASK         8'hff
`define SMC_FPGA_BC_TACH1_CTR_LO_rstb smc_fpga.smc_fpga_idl.BC_TACH1_CTR_LO_rstb


/****************************************************************************
    Field BC_TACH0_CTR_HI ( not generated by IDL ) 
    Readback for upper 8 bits of Bobcat fan 0 frequency counter              
****************************************************************************/
`define SMC_FPGA_BC_TACH0_CTR_HI__MASK         8'hff
`define SMC_FPGA_BC_TACH0_CTR_HI_rstb smc_fpga.smc_fpga_idl.BC_TACH0_CTR_HI_rstb


/****************************************************************************
    Field BC_TACH0_CTR_LO ( not generated by IDL ) 
    Readback for upper 8 bits of Bobcat fan 0 frequency counter              
****************************************************************************/
`define SMC_FPGA_BC_TACH0_CTR_LO__MASK         8'hff
`define SMC_FPGA_BC_TACH0_CTR_LO_rstb smc_fpga.smc_fpga_idl.BC_TACH0_CTR_LO_rstb


/****************************************************************************
    Field GEN_FREQ_CTR_HI ( not generated by IDL ) 
    Readback for upper 8 bits of general purpose frequency counter           
****************************************************************************/
`define SMC_FPGA_GEN_FREQ_CTR_HI__MASK         8'hff
`define SMC_FPGA_GEN_FREQ_CTR_HI_rstb smc_fpga.smc_fpga_idl.GEN_FREQ_CTR_HI_rstb


/****************************************************************************
    Field GEN_FREQ_CTR_MID ( not generated by IDL ) 
    Readback for middle 8 bits of the general purpose frequency counter      
****************************************************************************/
`define SMC_FPGA_GEN_FREQ_CTR_MID__MASK         8'hff
`define SMC_FPGA_GEN_FREQ_CTR_MID_rstb smc_fpga.smc_fpga_idl.GEN_FREQ_CTR_MID_rstb


/****************************************************************************
    Field GEN_FREQ_CTR_LO ( not generated by IDL ) 
    Readback for upper 8 bits of the general purpose frequency counter       
****************************************************************************/
`define SMC_FPGA_GEN_FREQ_CTR_LO__MASK         8'hff
`define SMC_FPGA_GEN_FREQ_CTR_LO_rstb smc_fpga.smc_fpga_idl.GEN_FREQ_CTR_LO_rstb


/****************************************************************************
    Field MAIN_BLOWER_HI ( not generated by IDL ) 
    Readback for upper 8 bits of main blower frequency counter               
****************************************************************************/
`define SMC_FPGA_MAIN_BLOWER_HI__MASK          8'hff
`define SMC_FPGA_MAIN_BLOWER_HI_rstb smc_fpga.smc_fpga_idl.MAIN_BLOWER_HI_rstb


/****************************************************************************
    Field MAIN_BLOWER_LO ( not generated by IDL ) 
    Readback for upper 8 bits of main blower frequency counter               
****************************************************************************/
`define SMC_FPGA_MAIN_BLOWER_LO__MASK          8'hff
`define SMC_FPGA_MAIN_BLOWER_LO_rstb smc_fpga.smc_fpga_idl.MAIN_BLOWER_LO_rstb


/****************************************************************************
    Field I2_HI ( not generated by IDL ) 
    Readback for upper 8 bits of I2 frequency counter                        
****************************************************************************/
`define SMC_FPGA_I2_HI__MASK                   8'hff
`define SMC_FPGA_I2_HI_rstb smc_fpga.smc_fpga_idl.I2_HI_rstb


/****************************************************************************
    Field I2_LO ( not generated by IDL ) 
    Readback for low 8 bits of I2 frequency counter                          
****************************************************************************/
`define SMC_FPGA_I2_LO__MASK                   8'hff
`define SMC_FPGA_I2_LO_rstb smc_fpga.smc_fpga_idl.I2_LO_rstb


/****************************************************************************
    Field I1_HI ( not generated by IDL ) 
    Readback for upper 8 bits of I1 frequency counter                        
****************************************************************************/
`define SMC_FPGA_I1_HI__MASK                   8'hff
`define SMC_FPGA_I1_HI_rstb smc_fpga.smc_fpga_idl.I1_HI_rstb


/****************************************************************************
    Field I1_LO ( not generated by IDL ) 
    Readback for low 8 bits of I1 frequency counter                          
****************************************************************************/
`define SMC_FPGA_I1_LO__MASK                   8'hff
`define SMC_FPGA_I1_LO_rstb smc_fpga.smc_fpga_idl.I1_LO_rstb


/****************************************************************************
    Field V0_HI ( not generated by IDL ) 
    Readback for upper 8 bits of V0 frequency counter                        
****************************************************************************/
`define SMC_FPGA_V0_HI__MASK                   8'hff
`define SMC_FPGA_V0_HI_rstb smc_fpga.smc_fpga_idl.V0_HI_rstb


/****************************************************************************
    Field V0_LO ( not generated by IDL ) 
    Readback for low 8 bits of V0 frequency counter                          
****************************************************************************/
`define SMC_FPGA_V0_LO__MASK                   8'hff
`define SMC_FPGA_V0_LO_rstb smc_fpga.smc_fpga_idl.V0_LO_rstb


/****************************************************************************
    Field GEN_FREQ_CTR_MUX ( in module idl_beh.v ) 
    General purpose frequency counter input select                           
****************************************************************************/
`define SMC_FPGA_GEN_FREQ_CTR_MUX__MASK         5'h1f
`define SMC_FPGA_GEN_FREQ_CTR_MUX_SC_FAN         5'h10
`define SMC_FPGA_GEN_FREQ_CTR_MUX_PDU_V1         5'h11
`define SMC_FPGA_GEN_FREQ_CTR_MUX_PDU_V2         5'h12
`define SMC_FPGA_GEN_FREQ_CTR_MUX_PDU_K1_ON         5'h13
`define SMC_FPGA_GEN_FREQ_CTR_MUX_SPU_FAN         5'h14
`define SMC_FPGA_GEN_FREQ_CTR_MUX_PDU_VAB         5'h15
`define SMC_FPGA_GEN_FREQ_CTR_MUX_PDU_VAC         5'h16
`define SMC_FPGA_GEN_FREQ_CTR_MUX_PDU_VBC         5'h17
`define SMC_FPGA_GEN_FREQ_CTR_MUX_PDU_FREQ         5'h18
`define SMC_FPGA_GEN_FREQ_CTR_MUX_PDU_48V_ON         5'h19
`define SMC_FPGA_GEN_FREQ_CTR_MUX_SMC_SPR2_FAN_IN_MON         5'h1a
`define SMC_FPGA_GEN_FREQ_CTR_MUX_FPGA_48V_ON         5'h00  // <=PWRCLR           
`define SMC_FPGA_GEN_FREQ_CTR_MUX_FPGA_K1_ON         5'h01
`define SMC_FPGA_GEN_FREQ_CTR_MUX_BC_FAN0_TACH         5'h02
`define SMC_FPGA_GEN_FREQ_CTR_MUX_BC_FAN1_TACH         5'h03
`define SMC_FPGA_GEN_FREQ_CTR_MUX_FPGA_AUX2         5'h04
`define SMC_FPGA_GEN_FREQ_CTR_MUX_FPGA_AUX3         5'h05
`define SMC_FPGA_GEN_FREQ_CTR_MUX smc_fpga.smc_fpga_idl.GEN_FREQ_CTR_MUX
`define SMC_FPGA_GEN_FREQ_CTR_MUX_wstb smc_fpga.smc_fpga_idl.GEN_FREQ_CTR_MUX_wstb


/****************************************************************************
    Field CTR_CTL ( in module idl_beh.v ) 
    frequency counter enable                                                 
****************************************************************************/
`define SMC_FPGA_CTR_CTL__MASK                  1'h1
`define SMC_FPGA_CTR_CTL_ENABLE                 1'h1
`define SMC_FPGA_CTR_CTL_DISABLE                1'h0  // <=PWRCLR           
`define SMC_FPGA_CTR_CTL smc_fpga.smc_fpga_idl.CTR_CTL


/****************************************************************************
    Field CLR_LOCK_OUT ( in module idl_beh.v ) 
    Reset lock_out signals for all counters                                  
****************************************************************************/
`define SMC_FPGA_CLR_LOCK_OUT__MASK             1'h1
`define SMC_FPGA_CLR_LOCK_OUT_CLR               1'h1
`define SMC_FPGA_CLR_LOCK_OUT_NORMAL            1'h0  // <=PWRCLR           
`define SMC_FPGA_CLR_LOCK_OUT smc_fpga.smc_fpga_idl.CLR_LOCK_OUT


/****************************************************************************
    Field CLR_REGS ( in module idl_beh.v ) 
    Reset all frequency counter output registers                             
****************************************************************************/
`define SMC_FPGA_CLR_REGS__MASK                 1'h1
`define SMC_FPGA_CLR_REGS_CLR                   1'h1
`define SMC_FPGA_CLR_REGS_COUNT                 1'h0  // <=PWRCLR           
`define SMC_FPGA_CLR_REGS smc_fpga.smc_fpga_idl.CLR_REGS


/****************************************************************************
    Field CLR_CTRS ( in module idl_beh.v ) 
    Reset all frequency counters                                             
****************************************************************************/
`define SMC_FPGA_CLR_CTRS__MASK                 1'h1
`define SMC_FPGA_CLR_CTRS_CLR                   1'h1
`define SMC_FPGA_CLR_CTRS_COUNT                 1'h0  // <=PWRCLR           
`define SMC_FPGA_CLR_CTRS smc_fpga.smc_fpga_idl.CLR_CTRS


/****************************************************************************
    Field CLR_MAINT_REG ( in module idl_beh.v ) 
    Reset Maint signal change register                                       
****************************************************************************/
`define SMC_FPGA_CLR_MAINT_REG__MASK            1'h1
`define SMC_FPGA_CLR_MAINT_REG_CLR              1'h1
`define SMC_FPGA_CLR_MAINT_REG_NORMAL           1'h0  // <=PWRCLR           
`define SMC_FPGA_CLR_MAINT_REG smc_fpga.smc_fpga_idl.CLR_MAINT_REG


/****************************************************************************
    Field AUX_3_CTL ( in module idl_beh.v ) 
    On/off control bits for Auxiliary 3 output                               
****************************************************************************/
`define SMC_FPGA_AUX_3_CTL__MASK                2'h3
`define SMC_FPGA_AUX_3_CTL_ON                   2'h1
`define SMC_FPGA_AUX_3_CTL_OFF                  2'h0  // <=PWRCLR           
`define SMC_FPGA_AUX_3_CTL_LOW                  2'h3
`define SMC_FPGA_AUX_3_CTL smc_fpga.smc_fpga_idl.AUX_3_CTL


/****************************************************************************
    Field AUX_2_CTL ( in module idl_beh.v ) 
    On/off control bits for Auxiliary 2 output                               
****************************************************************************/
`define SMC_FPGA_AUX_2_CTL__MASK                2'h3
`define SMC_FPGA_AUX_2_CTL_ON                   2'h1
`define SMC_FPGA_AUX_2_CTL_OFF                  2'h0  // <=PWRCLR           
`define SMC_FPGA_AUX_2_CTL_LOW                  2'h3
`define SMC_FPGA_AUX_2_CTL smc_fpga.smc_fpga_idl.AUX_2_CTL


/****************************************************************************
    Field AUX_1_CTL ( in module idl_beh.v ) 
    On/off control bits for Auxiliary 1 output                               
****************************************************************************/
`define SMC_FPGA_AUX_1_CTL__MASK                2'h3
`define SMC_FPGA_AUX_1_CTL_ON                   2'h1
`define SMC_FPGA_AUX_1_CTL_OFF                  2'h0  // <=PWRCLR           
`define SMC_FPGA_AUX_1_CTL_LOW                  2'h3
`define SMC_FPGA_AUX_1_CTL smc_fpga.smc_fpga_idl.AUX_1_CTL


/****************************************************************************
    Field AUX_0_CTL ( in module idl_beh.v ) 
    On/off control bits for Auxiliary 0 output                               
****************************************************************************/
`define SMC_FPGA_AUX_0_CTL__MASK                2'h3
`define SMC_FPGA_AUX_0_CTL_ON                   2'h1
`define SMC_FPGA_AUX_0_CTL_OFF                  2'h0  // <=PWRCLR           
`define SMC_FPGA_AUX_0_CTL_LOW                  2'h3
`define SMC_FPGA_AUX_0_CTL smc_fpga.smc_fpga_idl.AUX_0_CTL


/****************************************************************************
    Field AUX_FAN_CTL ( in module idl_beh.v ) 
    On/off control bits for Auxiliary fan output                             
****************************************************************************/
`define SMC_FPGA_AUX_FAN_CTL__MASK              2'h3
`define SMC_FPGA_AUX_FAN_CTL_ON                 2'h1
`define SMC_FPGA_AUX_FAN_CTL_OFF                2'h0  // <=PWRCLR           
`define SMC_FPGA_AUX_FAN_CTL_LOW                2'h3
`define SMC_FPGA_AUX_FAN_CTL smc_fpga.smc_fpga_idl.AUX_FAN_CTL


/****************************************************************************
    Field K1_ENABLE ( in module idl_beh.v ) 
    Enable for On/off control bit for K1                                     
****************************************************************************/
`define SMC_FPGA_K1_ENABLE__MASK                1'h1
`define SMC_FPGA_K1_ENABLE_ENABLE               1'h1
`define SMC_FPGA_K1_ENABLE_DISABLE              1'h0  // <=PWRCLR           
`define SMC_FPGA_K1_ENABLE smc_fpga.smc_fpga_idl.K1_ENABLE


/****************************************************************************
    Field B_DC90_48V_Enable ( in module idl_beh.v ) 
    Enable for On/off control bit for Bobcat DC90 48V                        
****************************************************************************/
`define SMC_FPGA_B_DC90_48V_Enable__MASK          1'h1
`define SMC_FPGA_B_DC90_48V_Enable_ENABLE          1'h1
`define SMC_FPGA_B_DC90_48V_Enable_DISABLE          1'h0  // <=PWRCLR           
`define SMC_FPGA_B_DC90_48V_Enable smc_fpga.smc_fpga_idl.B_DC90_48V_Enable


/****************************************************************************
    Field V48_ENABLE ( in module idl_beh.v ) 
    Enable for On/off control bit for 48V                                    
****************************************************************************/
`define SMC_FPGA_V48_ENABLE__MASK               1'h1
`define SMC_FPGA_V48_ENABLE_ENABLE              1'h1
`define SMC_FPGA_V48_ENABLE_DISABLE             1'h0  // <=PWRCLR           
`define SMC_FPGA_V48_ENABLE smc_fpga.smc_fpga_idl.V48_ENABLE


/****************************************************************************
    Field SMC_MON_PDU_K1 ( not generated by IDL ) 
    On/off control readback bit for K1                                       
****************************************************************************/
`define SMC_FPGA_SMC_MON_PDU_K1__MASK           1'h1
`define SMC_FPGA_SMC_MON_PDU_K1_CLR             1'h0
`define SMC_FPGA_SMC_MON_PDU_K1_rstb smc_fpga.smc_fpga_idl.SMC_MON_PDU_K1_rstb


/****************************************************************************
    Field K1_ON ( not generated by IDL ) 
    On/off control bit for K1                                                
****************************************************************************/
`define SMC_FPGA_K1_ON__MASK                    1'h1
`define SMC_FPGA_K1_ON_ON                       1'h1
`define SMC_FPGA_K1_ON_OFF                      1'h0
`define SMC_FPGA_K1_ON_wstb smc_fpga.smc_fpga_idl.K1_ON_wstb
`define SMC_FPGA_K1_ON_rstb smc_fpga.smc_fpga_idl.K1_ON_rstb


/****************************************************************************
    Field B_SMC_CNTRL_BC_SWITCHED_AC ( not generated by IDL ) 
    On/off control bit for Bobcat AC                                         
****************************************************************************/
`define SMC_FPGA_B_SMC_CNTRL_BC_SWITCHED_AC__MASK          1'h1
`define SMC_FPGA_B_SMC_CNTRL_BC_SWITCHED_AC_ON          1'h1
`define SMC_FPGA_B_SMC_CNTRL_BC_SWITCHED_AC_OFF          1'h0
`define SMC_FPGA_B_SMC_CNTRL_BC_SWITCHED_AC_wstb smc_fpga.smc_fpga_idl.B_SMC_CNTRL_BC_SWITCHED_AC_wstb
`define SMC_FPGA_B_SMC_CNTRL_BC_SWITCHED_AC_rstb smc_fpga.smc_fpga_idl.B_SMC_CNTRL_BC_SWITCHED_AC_rstb


/****************************************************************************
    Field B_CNTRL_BC_48VDC_DC90 ( not generated by IDL ) 
    On/off control bit for Bobcat 48V                                        
****************************************************************************/
`define SMC_FPGA_B_CNTRL_BC_48VDC_DC90__MASK          1'h1
`define SMC_FPGA_B_CNTRL_BC_48VDC_DC90_ON          1'h1
`define SMC_FPGA_B_CNTRL_BC_48VDC_DC90_OFF          1'h0
`define SMC_FPGA_B_CNTRL_BC_48VDC_DC90_wstb smc_fpga.smc_fpga_idl.B_CNTRL_BC_48VDC_DC90_wstb
`define SMC_FPGA_B_CNTRL_BC_48VDC_DC90_rstb smc_fpga.smc_fpga_idl.B_CNTRL_BC_48VDC_DC90_rstb


/****************************************************************************
    Field B_CNTRL_BC_48VDC ( not generated by IDL ) 
    On/off control bit for Bobcat 48V                                        
****************************************************************************/
`define SMC_FPGA_B_CNTRL_BC_48VDC__MASK          1'h1
`define SMC_FPGA_B_CNTRL_BC_48VDC_ON            1'h1
`define SMC_FPGA_B_CNTRL_BC_48VDC_OFF           1'h0
`define SMC_FPGA_B_CNTRL_BC_48VDC_wstb smc_fpga.smc_fpga_idl.B_CNTRL_BC_48VDC_wstb
`define SMC_FPGA_B_CNTRL_BC_48VDC_rstb smc_fpga.smc_fpga_idl.B_CNTRL_BC_48VDC_rstb


/****************************************************************************
    Field V48_ON ( not generated by IDL ) 
    On/off control bit for 48V                                               
****************************************************************************/
`define SMC_FPGA_V48_ON__MASK                   1'h1
`define SMC_FPGA_V48_ON_ON                      1'h1
`define SMC_FPGA_V48_ON_OFF                     1'h0
`define SMC_FPGA_V48_ON_wstb smc_fpga.smc_fpga_idl.V48_ON_wstb
`define SMC_FPGA_V48_ON_rstb smc_fpga.smc_fpga_idl.V48_ON_rstb
