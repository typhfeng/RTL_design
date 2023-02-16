`include "REG_LIST_RTL.h"

module sys_ctrl(
    input             reset_n                   ,
    input             reset_n_pad               ,
    input             test_mode                 ,
    input             clk_sys_1uS_tick          ,
    input             clk_sys_10uS_tick         ,
    input             clk_sys_100uS_tick        ,
    input             PCLK                      ,
    input      [11:0] PADDR                     ,
    input             PWRITE                    ,
    input             PENABLE                   ,
    input      [31:0] PWDATA                    ,
    input       [9:0] PUSER                     ,
    input       [2:0] PPROT                     ,
    input             PSEL                      ,
    output reg [31:0] PRDATA                    ,
    output reg        PREADY                    ,
    output            PSLVERR                   ,

    input      [15:0] poc_sig_store             ,
    input      [31:0] sts_sec_alert             ,
    output reg [31:0] reg_alert_enable          ,
    output reg [31:0] reg_osc_ring_ctrl0        ,
    output reg [31:0] reg_osc_ring_ctrl1        ,
    output reg [31:0] reg_osc_ring_ctrl2        ,
    output reg        reg_hdmirxpll_test_ctrl   ,
    output reg [31:0] reg_am2axi_ctrl0          ,
    output reg [31:0] reg_am2axi_ctrl1          ,
    output reg [31:0] reg_dos_axi_pipe_ctrl0    ,
    input      [31:0] reg_dos_axi_pipe_sts0     ,
    output reg [31:0] reg_axi_pipe_ctrl0        ,
    output reg [31:0] reg_axi_pipe_ctrl1        ,
    output reg [31:0] reg_axi_pipe_ctrl2        ,
    output reg [31:0] reg_axi_pipe_ctrl3        ,
    output reg [31:0] reg_axi_pipe_ctrl4        ,
    output reg [31:0] reg_axi_pipe_ctrl5        ,
    output reg [31:0] reg_axi_pipe_ctrl6        ,
    output reg [31:0] reg_axi_pipe_ctrl7        ,
    output reg [31:0] reg_axi_pipe_ctrl8        ,
    output reg [31:0] reg_axi_pipe_ctrl9        ,
    output reg [31:0] reg_axi_pipe_ctrl10       ,
    output reg [31:0] reg_axi_pipe_ctrl11       ,
    output reg [31:0] reg_axi_pipe_ctrl12       ,
    output reg [31:0] reg_axi_pipe_ctrl13       ,
    output reg [31:0] reg_axi_pipe_ctrl14       ,
    output reg [31:0] reg_axi_pipe_ctrl15       ,    
    input      [31:0] reg_axi_pipe_sts0         ,
    input      [31:0] reg_axi_pipe_sts1         ,
    input      [31:0] reg_axi_pipe_sts2         ,
    input      [31:0] reg_axi_pipe_sts3         ,
    input      [31:0] reg_axi_pipe_sts4         ,
    input      [31:0] reg_axi_pipe_sts5         ,
    input      [31:0] reg_axi_pipe_sts6         ,
    input      [31:0] reg_axi_pipe_sts7         ,
    input      [31:0] reg_axi_pipe_sts8         ,
    input      [31:0] reg_axi_pipe_sts9         ,
    input      [31:0] reg_axi_pipe_sts10        ,
    input      [31:0] reg_axi_pipe_sts11        ,
    input      [31:0] reg_axi_pipe_sts12        ,
    input      [31:0] reg_axi_pipe_sts13        ,
    input      [31:0] reg_axi_pipe_sts14        ,
    input      [31:0] reg_axi_pipe_sts15        ,    
    output reg [31:0] reg_axi_sram_cfg0        ,
    output reg [31:0] reg_vpu_secure0    ,
    output reg [31:0] reg_vpu_secure1    ,
//    output reg [31:0] sys_clk_vpu_en     ,
    output reg [31:0] reg_cmpr_secure    ,
    output reg [31:0] reg_frc_secure    ,
    //output reg [31:0] reg_dewarpa_secure        ,
    //output reg [31:0] reg_dewarpb_secure        ,
    //output reg [31:0] reg_dewarpc_secure        ,
    //output reg [31:0] reg_mopa_ctrl             ,
    //output reg [31:0] reg_mopb_ctrl             ,
    output reg [31:0] reg_bus_cfg0              ,
    output reg [31:0] reg_bus_cfg1              ,
    output reg [31:0] reg_bus_cfg2              ,
    output reg [31:0] reg_bus_cfg3              ,
    output reg [31:0] reg_bus_cfg4              ,
    output reg [31:0] reg_bus_cfg5              ,
    output reg [31:0] reg_bus_cfg6              ,
    output reg [31:0] reg_bus_cfg7              ,
    output reg [31:0] reg_bus_cfg8              ,
    output reg [31:0] reg_bus_cfg9              ,
    output reg [31:0] reg_bus_cfg10             ,
    output reg [31:0] reg_bus_cfg11             ,
    output reg [31:0] reg_bus_cfg12             ,
    output reg [31:0] reg_bus_cfg13             ,
    output reg [31:0] reg_bus_cfg14             ,
    output reg [31:0] reg_bus_cfg15             ,
    output reg [31:0] reg_bus_cfg16             ,
    output reg [31:0] reg_bus_cfg17             ,
    output reg [31:0] reg_bus_cfg18             ,
    output reg [31:0] reg_bus_cfg19             ,
    output reg [31:0] reg_bus_cfg20             ,
    output reg [31:0] reg_bus_cfg21             ,
    output reg [31:0] reg_bus_cfg22             ,
    output reg [31:0] reg_bus_cfg23             ,
    output reg [31:0] reg_bus_cfg24             ,
    output reg [31:0] reg_bus_cfg25             ,
    output reg [31:0] reg_bus_cfg26             ,
    output reg [31:0] reg_bus_cfg27             ,
    output reg [31:0] reg_bus_cfg28             ,
    output reg [31:0] reg_bus_cfg29             ,
    output reg [31:0] reg_bus_cfg30             ,
    output reg [31:0] reg_bus_cfg31             ,
    output reg [31:0] reg_spicc_ctrl0           ,
    output reg [31:0] reg_mali_texfmtenable     ,
    output reg [31:0] reg_mali_config           ,
    output reg [31:0] reg_tvfe_ft_test0         ,
    output reg [31:0] reg_tvfe_ft_test1         ,
    output reg [31:0] reg_tvfe_ft_test2         ,
    output reg [31:0] reg_sys_spi_trig0         ,
    output reg [31:0] reg_sys_spi_trig1         ,
    output reg [31:0] reg_sys_spi_trig2         ,
    output reg [31:0] reg_sys_spi_trig3         ,
    output reg [31:0] reg_sys_spi_trig4         ,
    output reg [31:0] reg_sys_spi_trig5         ,
    input      [31:0] reg_bus_sts0              ,    
    input      [31:0] reg_bus_sts1              ,
    input      [31:0] reg_bus_sts2              ,
    input      [31:0] sts_am2axi                ,
    input      [31:0] reg_ddrphy_sts            ,
    output            timerA_irq                ,
    output            timerB_irq                ,
    output            timerC_irq                ,
    output            timerD_irq                ,
    output            timerG_irq                ,
    output            timerH_irq                ,
    output            timerI_irq                ,
    output            timerJ_irq                ,
    output            sec_timerA_irq            ,
    output            h2tmr_int                 ,
    output            enable_spifc              ,
    input      [67:0] metal_rev
);

`include "REG_ACCESS_LIST.v"
//=====================================================================================
// gate the clock
reg         r_psel;
always @(posedge PCLK or negedge reset_n)
  if( ~reset_n )
    r_psel   <= 1'b0;
  else
    r_psel   <= PSEL;
wire        c_gclk;
gated_clk_sync u_gclk_regs( .QCK(c_gclk), .E(PSEL | r_psel), .TE(test_mode), .CK(PCLK) );
wire [7:0]  id_mapped;
id_map u_id_map(
    .user       (PUSER          ),
    .id_mapped0 (               ),
    .id_mapped1 (id_mapped      ));

//=====================================================================================
//sticky register
reg [31:0] writeonce_reg0;
reg [31:0] writeonce_reg1;
reg [31:0] writeonce_sticky_reg0;
reg [31:0] writeonce_sticky_reg1;
reg [31:0] writeonce_sec_reg0;
reg [31:0] writeonce_sticky_sec_reg0;
reg [31:0] writeonce1_reg0;
reg [31:0] writeonce1_sticky_reg0;
reg [31:0] writeonce1_sec_reg0;
reg [31:0] writeonce1_sticky_sec_reg0;
reg [31:0] status_reg0;
reg [31:0] status_reg1;
reg [31:0] status_reg2;
reg [31:0] status_reg3;
reg [31:0] status_reg4;
reg [31:0] status_reg5;
reg [31:0] status_reg6;
reg [31:0] status_reg7;
reg [31:0] sec_status_reg0 ;
reg [31:0] sec_status_reg1 ;
reg [31:0] sec_status_reg2 ;
reg [31:0] sec_status_reg3 ;
reg [31:0] sec_status_reg4 ;
reg [31:0] sec_status_reg5 ;
reg [31:0] sec_status_reg6 ;
reg [31:0] sec_status_reg7 ;
reg [31:0] sec_status_reg8 ;
reg [31:0] sec_status_reg9 ;
reg [31:0] sec_status_reg10;
reg [31:0] sec_status_reg11;
reg [31:0] sec_status_reg12;
reg [31:0] sec_status_reg13;
reg [31:0] sec_status_reg14;
reg [31:0] sec_status_reg15;
reg [31:0] sec_status_reg16;
reg [31:0] sec_status_reg17;
reg [31:0] sec_status_reg18;
reg [31:0] sec_status_reg19;
reg [31:0] sec_status_reg20;
reg [31:0] sec_status_reg21;
reg [31:0] sec_status_reg22;
reg [31:0] sec_status_reg23;
reg [31:0] sec_status_reg24;
reg [31:0] sec_status_reg25;
reg [31:0] sec_status_reg26;
reg [31:0] sec_status_reg27;
reg [31:0] sec_status_reg28;
reg [31:0] sec_status_reg29;
reg [31:0] sec_status_reg30;
reg [31:0] sec_status_reg31;
reg [31:0] sticky_reg0;
reg [31:0] sticky_reg1;
reg [31:0] sticky_reg2;
reg [31:0] sticky_reg3;
reg [31:0] sticky_reg4;
reg [31:0] sticky_reg5;
reg [31:0] sticky_reg6;
reg [31:0] sticky_reg7;
reg [31:0] sec_sticky_reg0;
reg [31:0] sec_sticky_reg1;
reg [31:0] sec_sticky_reg2;
reg [31:0] sec_sticky_reg3;
reg [31:0] sec_sticky_reg4;
reg [31:0] sec_sticky_reg5;
reg [31:0] sec_sticky_reg6;
reg [31:0] sec_sticky_reg7;
reg [15:0] msg_index0_sticky;
reg [15:0] msg_index1_sticky;
reg [15:0] msg_index2_sticky;
reg [15:0] msg_index3_sticky;
reg [31:0] cec_sticky_reg0;
reg [31:0] cec_sticky_reg1;
reg [31:0] cec_sticky_reg2;
reg [31:0] cec_sticky_reg3;
reg [31:0] cec_sticky_reg4;
reg [31:0] cec_sticky_reg5;
reg [31:0] cec_sticky_reg6;
reg [31:0] cec_sticky_reg7;
reg [7:0]  reg_enable_spifc;
reg  writeonce_sticky_reg0_lock;
reg  writeonce_sticky_reg1_lock;
reg  writeonce_sticky_sec_reg0_lock;
assign  enable_spifc = reg_enable_spifc == 8'hA5;

//=====================================================================================
// write register sticky
always @(posedge c_gclk or negedge reset_n_pad)
  if(!reset_n_pad)
    begin
    writeonce_sticky_reg0               <=   0;
    writeonce_sticky_reg1               <=   0;
    writeonce_sticky_sec_reg0           <=   0;
    writeonce1_sticky_reg0              <=   0;
    writeonce1_sticky_sec_reg0          <=   0;
    sticky_reg0                         <=   0;
    sticky_reg1                         <=   0;
    sticky_reg2                         <=   0;
    sticky_reg3                         <=   0;
    sticky_reg4                         <=   0;
    sticky_reg5                         <=   0;
    sticky_reg6                         <=   0;
    sticky_reg7                         <=   0;
    sec_sticky_reg0                     <=   0;
    sec_sticky_reg1                     <=   0;
    sec_sticky_reg2                     <=   0;
    sec_sticky_reg3                     <=   0;
    sec_sticky_reg4                     <=   0;
    sec_sticky_reg5                     <=   0;
    sec_sticky_reg6                     <=   0;
    sec_sticky_reg7                     <=   0;
    cec_sticky_reg0                     <=   0;
    cec_sticky_reg1                     <=   0;
    cec_sticky_reg2                     <=   0;
    cec_sticky_reg3                     <=   0;
    cec_sticky_reg4                     <=   0;
    cec_sticky_reg5                     <=   0;
    cec_sticky_reg6                     <=   0;
    cec_sticky_reg7                     <=   0;
    reg_alert_enable                    <=   32'h00000000;
    reg_vpu_secure0                     <=  'h0;
    reg_vpu_secure1                     <=  'h0;
    //sys_clk_vpu_en                      <=  'h0;
    reg_cmpr_secure                     <=  'h0;
    reg_frc_secure                      <=  'h0;
    //reg_mopa_ctrl               <=   32'h80000000;
    //reg_mopb_ctrl               <=   32'h80000000;
    //reg_dewarpa_secure                  <=   0;
    //reg_dewarpb_secure                  <=   0;
    //reg_dewarpc_secure                  <=   0;
    writeonce_sticky_reg0_lock          <=   0;
    writeonce_sticky_reg1_lock          <=   0;
    writeonce_sticky_sec_reg0_lock      <=   0;
    end
  else if(PSEL && PWRITE && PENABLE)
    begin
    case({1'b1,PADDR[11:2]})
    {(|(id_mapped&A_SYSCTRL_WRITEONCE_STICKY_REG0     [15:8])),`SYSCTRL_WRITEONCE_STICKY_REG0      }: begin   writeonce_sticky_reg0       <=   writeonce_sticky_reg0_lock ? writeonce_sticky_reg0 : PWDATA;
                                                                                                              writeonce_sticky_reg0_lock  <=   1'b1; end
    {(|(id_mapped&A_SYSCTRL_WRITEONCE_STICKY_REG1     [15:8])),`SYSCTRL_WRITEONCE_STICKY_REG1      }: begin   writeonce_sticky_reg1       <=   writeonce_sticky_reg1_lock ? writeonce_sticky_reg1 : PWDATA;
                                                                                                              writeonce_sticky_reg1_lock  <=   1'b1; end
    {(|(id_mapped&A_SYSCTRL_WRITEONCE_STICKY_SEC_REG0 [15:8])),`SYSCTRL_WRITEONCE_STICKY_SEC_REG0  }: begin   writeonce_sticky_sec_reg0   <=   writeonce_sticky_sec_reg0_lock ? writeonce_sticky_sec_reg0 : PWDATA;
                                                                                                              writeonce_sticky_sec_reg0_lock  <=   1'b1; end
    {(|(id_mapped&A_SYSCTRL_WRITEONCE1_STICKY_REG0    [15:8])),`SYSCTRL_WRITEONCE1_STICKY_REG0     }:         writeonce1_sticky_reg0      <=   PWDATA | writeonce1_sticky_reg0;
    {(|(id_mapped&A_SYSCTRL_WRITEONCE1_STICKY_SEC_REG0[15:8])),`SYSCTRL_WRITEONCE1_STICKY_SEC_REG0 }:         writeonce1_sticky_sec_reg0  <=   PWDATA | writeonce1_sticky_sec_reg0;
    {(|(id_mapped&A_SYSCTRL_STICKY_REG0               [15:8])),`SYSCTRL_STICKY_REG0                }:         sticky_reg0                 <=   PWDATA;
    {(|(id_mapped&A_SYSCTRL_STICKY_REG1               [15:8])),`SYSCTRL_STICKY_REG1                }:         sticky_reg1                 <=   PWDATA;
    {(|(id_mapped&A_SYSCTRL_STICKY_REG2               [15:8])),`SYSCTRL_STICKY_REG2                }:         sticky_reg2                 <=   PWDATA;
    {(|(id_mapped&A_SYSCTRL_STICKY_REG3               [15:8])),`SYSCTRL_STICKY_REG3                }:         sticky_reg3                 <=   PWDATA;
    {(|(id_mapped&A_SYSCTRL_STICKY_REG4               [15:8])),`SYSCTRL_STICKY_REG4                }:         sticky_reg4                 <=   PWDATA;
    {(|(id_mapped&A_SYSCTRL_STICKY_REG5               [15:8])),`SYSCTRL_STICKY_REG5                }:         sticky_reg5                 <=   PWDATA;
    {(|(id_mapped&A_SYSCTRL_STICKY_REG6               [15:8])),`SYSCTRL_STICKY_REG6                }:         sticky_reg6                 <=   PWDATA;
    {(|(id_mapped&A_SYSCTRL_STICKY_REG7               [15:8])),`SYSCTRL_STICKY_REG7                }:         sticky_reg7                 <=   PWDATA;
    {(|(id_mapped&A_SYSCTRL_SEC_STICKY_REG0           [15:8])),`SYSCTRL_SEC_STICKY_REG0            }:         sec_sticky_reg0             <=   PWDATA;
    {(|(id_mapped&A_SYSCTRL_SEC_STICKY_REG1           [15:8])),`SYSCTRL_SEC_STICKY_REG1            }:         sec_sticky_reg1             <=   PWDATA;
    {(|(id_mapped&A_SYSCTRL_SEC_STICKY_REG2           [15:8])),`SYSCTRL_SEC_STICKY_REG2            }:         sec_sticky_reg2             <=   PWDATA;
    {(|(id_mapped&A_SYSCTRL_SEC_STICKY_REG3           [15:8])),`SYSCTRL_SEC_STICKY_REG3            }:         sec_sticky_reg3             <=   PWDATA;
    {(|(id_mapped&A_SYSCTRL_SEC_STICKY_REG4           [15:8])),`SYSCTRL_SEC_STICKY_REG4            }:         sec_sticky_reg4             <=   PWDATA;
    {(|(id_mapped&A_SYSCTRL_SEC_STICKY_REG5           [15:8])),`SYSCTRL_SEC_STICKY_REG5            }:         sec_sticky_reg5             <=   PWDATA;
    {(|(id_mapped&A_SYSCTRL_SEC_STICKY_REG6           [15:8])),`SYSCTRL_SEC_STICKY_REG6            }:         sec_sticky_reg6             <=   PWDATA;
    {(|(id_mapped&A_SYSCTRL_SEC_STICKY_REG7           [15:8])),`SYSCTRL_SEC_STICKY_REG7            }:         sec_sticky_reg7             <=   PWDATA;
    {(|(id_mapped&A_SYSCTRL_CEC_STICKY_REG0           [15:8])),`SYSCTRL_CEC_STICKY_REG0            }:         cec_sticky_reg0             <=   PWDATA;
    {(|(id_mapped&A_SYSCTRL_CEC_STICKY_REG1           [15:8])),`SYSCTRL_CEC_STICKY_REG1            }:         cec_sticky_reg1             <=   PWDATA;
    {(|(id_mapped&A_SYSCTRL_CEC_STICKY_REG2           [15:8])),`SYSCTRL_CEC_STICKY_REG2            }:         cec_sticky_reg2             <=   PWDATA;
    {(|(id_mapped&A_SYSCTRL_CEC_STICKY_REG3           [15:8])),`SYSCTRL_CEC_STICKY_REG3            }:         cec_sticky_reg3             <=   PWDATA;
    {(|(id_mapped&A_SYSCTRL_CEC_STICKY_REG4           [15:8])),`SYSCTRL_CEC_STICKY_REG4            }:         cec_sticky_reg4             <=   PWDATA;
    {(|(id_mapped&A_SYSCTRL_CEC_STICKY_REG5           [15:8])),`SYSCTRL_CEC_STICKY_REG5            }:         cec_sticky_reg5             <=   PWDATA;
    {(|(id_mapped&A_SYSCTRL_CEC_STICKY_REG6           [15:8])),`SYSCTRL_CEC_STICKY_REG6            }:         cec_sticky_reg6             <=   PWDATA;
    {(|(id_mapped&A_SYSCTRL_CEC_STICKY_REG7           [15:8])),`SYSCTRL_CEC_STICKY_REG7            }:         cec_sticky_reg7             <=   PWDATA;
    {(|(id_mapped&A_SYSCTRL_ALERT_ENABLE              [15:8])),`SYSCTRL_ALERT_ENABLE               }:         reg_alert_enable            <=   reg_alert_enable | PWDATA;
    {(|(id_mapped&A_SYSCTRL_REG_VPU_SECURE0          [15:8])),`SYSCTRL_REG_VPU_SECURE0            }:          reg_vpu_secure0          <=   PWDATA;
    {(|(id_mapped&A_SYSCTRL_REG_VPU_SECURE1          [15:8])),`SYSCTRL_REG_VPU_SECURE1            }:          reg_vpu_secure1          <=   PWDATA;
//    {(|(id_mapped&A_SYSCTRL_SYS_CLK_VPU_EN           [15:8])),`SYSCTRL_SYS_CLK_VPU_EN             }:          sys_clk_vpu_en           <=   PWDATA;
    {(|(id_mapped&A_SYSCTRL_REG_CMPR_SECURE          [15:8])),`SYSCTRL_REG_CMPR_SECURE            }:          reg_cmpr_secure          <=   PWDATA;
    {(|(id_mapped&A_SYSCTRL_REG_FRC_SECURE           [15:8])),`SYSCTRL_REG_FRC_SECURE             }:          reg_frc_secure          <=   PWDATA;
    //{(|(id_mapped&A_SYSCTRL_DEWARPA_SECURE_REG        [15:8])),`SYSCTRL_DEWARPA_SECURE_REG         }:         reg_dewarpa_secure          <=   PWDATA;
    //{(|(id_mapped&A_SYSCTRL_DEWARPB_SECURE_REG        [15:8])),`SYSCTRL_DEWARPB_SECURE_REG         }:         reg_dewarpb_secure          <=   PWDATA;
    //{(|(id_mapped&A_SYSCTRL_DEWARPC_SECURE_REG        [15:8])),`SYSCTRL_DEWARPC_SECURE_REG         }:         reg_dewarpc_secure          <=   PWDATA;
    default                  : begin end
    endcase
    end
always @(posedge c_gclk or negedge reset_n_pad)
    if( !reset_n_pad )
        msg_index0_sticky   <=     0;
    else if(PSEL && PWRITE && PENABLE& (PADDR[11:2] == `SYSCTRL_MSG_INDEX0_STICKY) && (|(id_mapped&A_SYSCTRL_MSG_INDEX0_STICKY[15:8])))
        msg_index0_sticky   <= PWDATA[31] ?  PWDATA[15:0] : msg_index0_sticky + 1;
always @(posedge c_gclk or negedge reset_n_pad)
    if( !reset_n_pad )
        msg_index1_sticky   <=     0;
    else if(PSEL && PWRITE && PENABLE& (PADDR[11:2] == `SYSCTRL_MSG_INDEX1_STICKY) && (|(id_mapped&A_SYSCTRL_MSG_INDEX1_STICKY[15:8])))
        msg_index1_sticky   <= PWDATA[31] ?  PWDATA[15:0] : msg_index1_sticky + 1;
always @(posedge c_gclk or negedge reset_n_pad)
    if( !reset_n_pad )
        msg_index2_sticky   <=     0;
    else if(PSEL && PWRITE && PENABLE& (PADDR[11:2] == `SYSCTRL_MSG_INDEX2_STICKY) && (|(id_mapped&A_SYSCTRL_MSG_INDEX2_STICKY[15:8])))
        msg_index2_sticky   <= PWDATA[31] ?  PWDATA[15:0] : msg_index2_sticky + 1;
always @(posedge c_gclk or negedge reset_n_pad)
    if( !reset_n_pad )
        msg_index3_sticky   <=     0;
    else if(PSEL && PWRITE && PENABLE& (PADDR[11:2] == `SYSCTRL_MSG_INDEX3_STICKY) && (|(id_mapped&A_SYSCTRL_MSG_INDEX3_STICKY[15:8])))
        msg_index3_sticky   <= PWDATA[31] ?  PWDATA[15:0] : msg_index3_sticky + 1;

//=====================================================================================
//write register
reg [31:0] debug_reg0;
reg [31:0] debug_reg1;
reg [31:0] debug_reg2;
reg [31:0] debug_reg3;
reg [31:0] debug_reg4;
reg [31:0] debug_reg5;
reg [31:0] debug_reg6;
reg [31:0] debug_reg7;
reg [15:0] timerA_cnt_init;
reg [7:0]  timerA_ctrl;
reg [15:0] timerB_cnt_init;
reg [7:0]  timerB_ctrl;
reg [15:0] timerC_cnt_init;
reg [7:0]  timerC_ctrl;
reg [15:0] timerD_cnt_init;
reg [7:0]  timerD_ctrl;
reg [7:0]  timerE_ctrl;
reg [7:0]  timerF_ctrl;
reg [15:0] timerG_cnt_init;
reg [7:0]  timerG_ctrl;
reg [15:0] timerH_cnt_init;
reg [7:0]  timerH_ctrl;
reg [15:0] timerI_cnt_init;
reg [7:0]  timerI_ctrl;
reg [15:0] timerJ_cnt_init;
reg [7:0]  timerJ_ctrl;
reg [15:0] sec_timerA_cnt_init;
reg [7:0]  sec_timerA_ctrl;
reg [7:0]  sec_timerE_ctrl;
reg  writeonce_reg0_lock;
reg  writeonce_reg1_lock;
reg  writeonce_sec_reg0_lock;
reg [15:0]  timer90k_div;
reg [15:0]  pg_timer;         //program timer -> 90hz x timer 
reg [63:0]  reg_bus_cfg_lock;
reg [63:0]  reg_bus_cfg_prot;
wire[63:0]  bus_cfg_locked = reg_bus_cfg_lock | reg_bus_cfg_prot;
always @(posedge c_gclk or negedge reset_n)
  if(!reset_n)
    begin
    pg_timer                    <=   16'h0;
    timer90k_div                <=   16'h384;
    reg_dos_axi_pipe_ctrl0      <=   32'h6666_6666;
    reg_axi_pipe_ctrl0          <=   32'h6666_6666;
    reg_axi_pipe_ctrl1          <=   32'h6666_6666;
    reg_axi_pipe_ctrl2          <=   32'h6666_6666;
    reg_axi_pipe_ctrl3          <=   32'h6666_6666;
    reg_axi_pipe_ctrl4          <=   32'h6666_6666;
    reg_axi_pipe_ctrl5          <=   32'h6666_6666;
    reg_axi_pipe_ctrl6          <=   32'h6666_6666;
    reg_axi_pipe_ctrl7          <=   32'h6666_6666;
    reg_axi_pipe_ctrl8          <=   32'h6666_6666;
    reg_axi_pipe_ctrl9          <=   32'h6666_6666;
    reg_axi_pipe_ctrl10         <=   32'h6666_6666;
    reg_axi_pipe_ctrl11         <=   32'h6666_6666;
    reg_axi_pipe_ctrl12         <=   32'h6666_6666;
    reg_axi_pipe_ctrl13         <=   32'h6666_6666;
    reg_axi_pipe_ctrl14         <=   32'h6666_6666;
    reg_axi_pipe_ctrl15         <=   32'h6666_6666;    
    reg_axi_sram_cfg0           <=   32'h0;
    reg_bus_cfg0                <=   32'h00000000;
    reg_bus_cfg1                <=   32'h00000000;
    reg_bus_cfg2                <=   32'h00000000;
    reg_bus_cfg3                <=   32'h00000000;
    reg_bus_cfg4                <=   32'hffffffff;//axcache
    reg_bus_cfg5                <=   32'h00000000;
    reg_bus_cfg6                <=   32'h00000000;
    reg_bus_cfg7                <=   32'hffffffff;//axcache
    reg_bus_cfg8                <=   32'h00000000;
    reg_bus_cfg9                <=   32'h00000000;
    reg_bus_cfg10               <=   32'h00000000;
    reg_bus_cfg11               <=   32'h00000000;
    reg_bus_cfg12               <=   32'h00000000;
    reg_bus_cfg13               <=   32'h00000000;
    reg_bus_cfg14               <=   32'h00000000;
    reg_bus_cfg15               <=   32'h00000000;
    reg_bus_cfg16               <=   32'h00000000;
    reg_bus_cfg17               <=   32'h00000000;
    reg_bus_cfg18               <=   32'h00000000;
    reg_bus_cfg19               <=   32'h00000000;
    reg_bus_cfg20               <=   32'h00000000;
    reg_bus_cfg21               <=   32'h00000000;
    reg_bus_cfg22               <=   32'h00000000;
    reg_bus_cfg23               <=   32'h00000000;
    reg_bus_cfg24               <=   32'h00000000;
    reg_bus_cfg25               <=   32'hffffffff;//axcache
    reg_bus_cfg26               <=   32'h00000012;
    reg_bus_cfg27               <=   32'h00000000;
    reg_bus_cfg28               <=   32'hffffffff;//axcache
    reg_bus_cfg29               <=   32'h00000000;
    reg_bus_cfg30               <=   32'h00000000;
    reg_bus_cfg31               <=   32'h00000000;
    reg_spicc_ctrl0             <=   32'h00000000;
    reg_mali_config             <=   32'h00000000;
    reg_mali_texfmtenable       <=   32'hFFFFFFFF;
    reg_bus_cfg_lock            <=   64'h0;
    reg_bus_cfg_prot            <=   64'h0;
//    vipnanoq_ctrl0              <=   1;
    writeonce_reg0              <=   0;
    writeonce_reg1              <=   0;
    writeonce_sec_reg0          <=   0;
    writeonce1_reg0             <=   0;
    writeonce1_sec_reg0         <=   0;
    status_reg0                 <=   0;
    status_reg1                 <=   0;
    status_reg2                 <=   0;
    status_reg3                 <=   0;
    status_reg4                 <=   0;
    status_reg5                 <=   0;
    status_reg6                 <=   0;
    status_reg7                 <=   0;
    sec_status_reg0             <=   0;
    sec_status_reg1             <=   0;
    sec_status_reg2             <=   0;
    sec_status_reg3             <=   0;
    sec_status_reg4             <=   0;
    sec_status_reg5             <=   0;
    sec_status_reg6             <=   0;
    sec_status_reg7             <=   0;
    sec_status_reg8             <=   0;
    sec_status_reg9             <=   0;
    sec_status_reg10            <=   0;
    sec_status_reg11            <=   0;
    sec_status_reg12            <=   0;
    sec_status_reg13            <=   0;
    sec_status_reg14            <=   0;
    sec_status_reg15            <=   0;
    sec_status_reg16            <=   0;
    sec_status_reg17            <=   0;
    sec_status_reg18            <=   0;
    sec_status_reg19            <=   0;
    sec_status_reg20            <=   0;
    sec_status_reg21            <=   0;
    sec_status_reg22            <=   0;
    sec_status_reg23            <=   0;
    sec_status_reg24            <=   0;
    sec_status_reg25            <=   0;
    sec_status_reg26            <=   0;
    sec_status_reg27            <=   0;
    sec_status_reg28            <=   0;
    sec_status_reg29            <=   0;
    sec_status_reg30            <=   0;
    sec_status_reg31            <=   0;
    debug_reg0                  <=   0;
    debug_reg1                  <=   0;
    debug_reg2                  <=   0;
    debug_reg3                  <=   0;
    debug_reg4                  <=   0;
    debug_reg5                  <=   0;
    debug_reg6                  <=   0;
    debug_reg7                  <=   0;
    timerA_ctrl                 <=   8'hc0;
    timerB_ctrl                 <=   0;
    timerC_ctrl                 <=   0;
    timerD_ctrl                 <=   0;
    timerE_ctrl                 <=   8'h81;
    timerF_ctrl                 <=   8'hc0;
    timerG_ctrl                 <=   0;
    timerH_ctrl                 <=   0;
    timerI_ctrl                 <=   0;
    timerJ_ctrl                 <=   0;
    timerA_cnt_init             <=   0;
    timerB_cnt_init             <=   0;
    timerC_cnt_init             <=   0;
    timerD_cnt_init             <=   0;
    timerG_cnt_init             <=   0;
    timerH_cnt_init             <=   0;
    timerI_cnt_init             <=   0;
    timerJ_cnt_init             <=   0;
    sec_timerA_ctrl             <=   8'hc0;
    sec_timerA_cnt_init         <=   0;
    sec_timerE_ctrl             <=   8'h81;
    writeonce_reg0_lock         <=   0;
    writeonce_reg1_lock         <=   0;
    writeonce_sec_reg0_lock     <=   0;
    reg_osc_ring_ctrl0          <=   0;
    reg_osc_ring_ctrl1          <=   0;
    reg_osc_ring_ctrl2          <=   0;
    reg_hdmirxpll_test_ctrl     <=   0;
    reg_am2axi_ctrl0            <=   32'h33000dff;
    reg_am2axi_ctrl1            <=   32'h00000dff;
    reg_enable_spifc                    <=   8'hA5;
    reg_tvfe_ft_test0           <=   0;
    reg_tvfe_ft_test1           <=   0;
    reg_tvfe_ft_test2           <=   0;
    reg_sys_spi_trig0           <=   0;
    reg_sys_spi_trig1           <=   0;
    reg_sys_spi_trig2           <=   0;
    reg_sys_spi_trig3           <=   0;
    reg_sys_spi_trig4           <=   0;
    reg_sys_spi_trig5           <=   0;
    end
  else if(PSEL && PWRITE && PENABLE)
    begin
    case({1'b1,PADDR[11:2]})
    {(|(id_mapped&A_SYSCTRL_TIMER90K           [15:8] )),`SYSCTRL_TIMER90K               } :         timer90k_div           <=   PWDATA[15:0];
    {(|(id_mapped&A_SYSCTRL_HPG_TIMER          [15:8] )),`SYSCTRL_HPG_TIMER              } :         pg_timer               <=   PWDATA[15:0];

    {(|(id_mapped&A_SYSCTRL_AXI_PIPE_CTRL0     [15:8] )),`SYSCTRL_AXI_PIPE_CTRL0         } :         reg_axi_pipe_ctrl0     <=   bus_cfg_locked[32] ? reg_axi_pipe_ctrl0 : PWDATA;
    {(|(id_mapped&A_SYSCTRL_AXI_PIPE_CTRL1     [15:8] )),`SYSCTRL_AXI_PIPE_CTRL1         } :         reg_axi_pipe_ctrl1     <=   bus_cfg_locked[33] ? reg_axi_pipe_ctrl1 : PWDATA;
    {(|(id_mapped&A_SYSCTRL_AXI_PIPE_CTRL2     [15:8] )),`SYSCTRL_AXI_PIPE_CTRL2         } :         reg_axi_pipe_ctrl2     <=   bus_cfg_locked[34] ? reg_axi_pipe_ctrl2 : PWDATA;
    {(|(id_mapped&A_SYSCTRL_AXI_PIPE_CTRL3     [15:8] )),`SYSCTRL_AXI_PIPE_CTRL3         } :         reg_axi_pipe_ctrl3     <=   bus_cfg_locked[35] ? reg_axi_pipe_ctrl3 : PWDATA;
    {(|(id_mapped&A_SYSCTRL_AXI_PIPE_CTRL4     [15:8] )),`SYSCTRL_AXI_PIPE_CTRL4         } :         reg_axi_pipe_ctrl4     <=   bus_cfg_locked[36] ? reg_axi_pipe_ctrl4 : PWDATA;
    {(|(id_mapped&A_SYSCTRL_AXI_PIPE_CTRL5     [15:8] )),`SYSCTRL_AXI_PIPE_CTRL5         } :         reg_axi_pipe_ctrl5     <=   bus_cfg_locked[37] ? reg_axi_pipe_ctrl5 : PWDATA;
    {(|(id_mapped&A_SYSCTRL_AXI_PIPE_CTRL6     [15:8] )),`SYSCTRL_AXI_PIPE_CTRL6         } :         reg_axi_pipe_ctrl6     <=   bus_cfg_locked[38] ? reg_axi_pipe_ctrl6 : PWDATA;
    {(|(id_mapped&A_SYSCTRL_AXI_PIPE_CTRL7     [15:8] )),`SYSCTRL_AXI_PIPE_CTRL7         } :         reg_axi_pipe_ctrl7     <=   bus_cfg_locked[39] ? reg_axi_pipe_ctrl7 : PWDATA;
    {(|(id_mapped&A_SYSCTRL_AXI_PIPE_CTRL8     [15:8] )),`SYSCTRL_AXI_PIPE_CTRL8         } :         reg_axi_pipe_ctrl8     <=   bus_cfg_locked[40] ? reg_axi_pipe_ctrl8 : PWDATA;
    {(|(id_mapped&A_SYSCTRL_AXI_PIPE_CTRL9     [15:8] )),`SYSCTRL_AXI_PIPE_CTRL9         } :         reg_axi_pipe_ctrl9     <=   bus_cfg_locked[41] ? reg_axi_pipe_ctrl9 : PWDATA;
    {(|(id_mapped&A_SYSCTRL_AXI_PIPE_CTRL10    [15:8] )),`SYSCTRL_AXI_PIPE_CTRL10        } :         reg_axi_pipe_ctrl10    <=   bus_cfg_locked[42] ? reg_axi_pipe_ctrl10: PWDATA;
    {(|(id_mapped&A_SYSCTRL_AXI_PIPE_CTRL11    [15:8] )),`SYSCTRL_AXI_PIPE_CTRL11        } :         reg_axi_pipe_ctrl11    <=   bus_cfg_locked[43] ? reg_axi_pipe_ctrl11: PWDATA;
    {(|(id_mapped&A_SYSCTRL_AXI_PIPE_CTRL12    [15:8] )),`SYSCTRL_AXI_PIPE_CTRL12        } :         reg_axi_pipe_ctrl12    <=   bus_cfg_locked[44] ? reg_axi_pipe_ctrl12: PWDATA;
    {(|(id_mapped&A_SYSCTRL_AXI_PIPE_CTRL13    [15:8] )),`SYSCTRL_AXI_PIPE_CTRL13        } :         reg_axi_pipe_ctrl13    <=   bus_cfg_locked[45] ? reg_axi_pipe_ctrl13: PWDATA;
    {(|(id_mapped&A_SYSCTRL_AXI_PIPE_CTRL14    [15:8] )),`SYSCTRL_AXI_PIPE_CTRL14        } :         reg_axi_pipe_ctrl14    <=   bus_cfg_locked[46] ? reg_axi_pipe_ctrl14: PWDATA;
    {(|(id_mapped&A_SYSCTRL_AXI_PIPE_CTRL15    [15:8] )),`SYSCTRL_AXI_PIPE_CTRL15        } :         reg_axi_pipe_ctrl15    <=   bus_cfg_locked[47] ? reg_axi_pipe_ctrl15: PWDATA;    
    {(|(id_mapped&A_SYSCTRL_DOS_AXI_PIPE_CTRL0 [15:8] )),`SYSCTRL_DOS_AXI_PIPE_CTRL0     } :         reg_dos_axi_pipe_ctrl0 <=   bus_cfg_locked[48] ? reg_dos_axi_pipe_ctrl0 : PWDATA;
    {(|(id_mapped&A_SYSCTRL_SPICC_CTRL0        [15:8] )),`SYSCTRL_SPICC_CTRL0            } :         reg_spicc_ctrl0        <=   bus_cfg_locked[49] ? reg_spicc_ctrl0 : PWDATA;
    {(|(id_mapped&A_SYSCTRL_AXISRAM_CFG0       [15:8] )),`SYSCTRL_AXISRAM_CFG0           } :         reg_axi_sram_cfg0      <=   PWDATA;
    {(|(id_mapped&A_SYSCTRL_BUS_CFG0           [15:8] )),`SYSCTRL_BUS_CFG0               } :         reg_bus_cfg0           <=   bus_cfg_locked[ 0] ? reg_bus_cfg0  : PWDATA;
    {(|(id_mapped&A_SYSCTRL_BUS_CFG1           [15:8] )),`SYSCTRL_BUS_CFG1               } :         reg_bus_cfg1           <=   bus_cfg_locked[ 1] ? reg_bus_cfg1  : PWDATA;
    {(|(id_mapped&A_SYSCTRL_BUS_CFG2           [15:8] )),`SYSCTRL_BUS_CFG2               } :         reg_bus_cfg2           <=   bus_cfg_locked[ 2] ? reg_bus_cfg2  : PWDATA;
    {(|(id_mapped&A_SYSCTRL_BUS_CFG3           [15:8] )),`SYSCTRL_BUS_CFG3               } :         reg_bus_cfg3           <=   bus_cfg_locked[ 3] ? reg_bus_cfg3  : PWDATA;
    {(|(id_mapped&A_SYSCTRL_BUS_CFG4           [15:8] )),`SYSCTRL_BUS_CFG4               } :         reg_bus_cfg4           <=   bus_cfg_locked[ 4] ? reg_bus_cfg4  : PWDATA;
    {(|(id_mapped&A_SYSCTRL_BUS_CFG5           [15:8] )),`SYSCTRL_BUS_CFG5               } :         reg_bus_cfg5           <=   bus_cfg_locked[ 5] ? reg_bus_cfg5  : PWDATA;
    {(|(id_mapped&A_SYSCTRL_BUS_CFG6           [15:8] )),`SYSCTRL_BUS_CFG6               } :         reg_bus_cfg6           <=   bus_cfg_locked[ 6] ? reg_bus_cfg6  : PWDATA;
    {(|(id_mapped&A_SYSCTRL_BUS_CFG7           [15:8] )),`SYSCTRL_BUS_CFG7               } :         reg_bus_cfg7           <=   bus_cfg_locked[ 7] ? reg_bus_cfg7  : PWDATA;
    {(|(id_mapped&A_SYSCTRL_BUS_CFG8           [15:8] )),`SYSCTRL_BUS_CFG8               } :         reg_bus_cfg8           <=   bus_cfg_locked[ 8] ? reg_bus_cfg8  : PWDATA;
    {(|(id_mapped&A_SYSCTRL_BUS_CFG9           [15:8] )),`SYSCTRL_BUS_CFG9               } :         reg_bus_cfg9           <=   bus_cfg_locked[ 9] ? reg_bus_cfg9  : PWDATA;
    {(|(id_mapped&A_SYSCTRL_BUS_CFG10          [15:8] )),`SYSCTRL_BUS_CFG10              } :         reg_bus_cfg10          <=   bus_cfg_locked[10] ? reg_bus_cfg10 : PWDATA;
    {(|(id_mapped&A_SYSCTRL_BUS_CFG11          [15:8] )),`SYSCTRL_BUS_CFG11              } :         reg_bus_cfg11          <=   bus_cfg_locked[11] ? reg_bus_cfg11 : PWDATA;
    {(|(id_mapped&A_SYSCTRL_BUS_CFG12          [15:8] )),`SYSCTRL_BUS_CFG12              } :         reg_bus_cfg12          <=   bus_cfg_locked[12] ? reg_bus_cfg12 : PWDATA;
    {(|(id_mapped&A_SYSCTRL_BUS_CFG13          [15:8] )),`SYSCTRL_BUS_CFG13              } :         reg_bus_cfg13          <=   bus_cfg_locked[13] ? reg_bus_cfg13 : PWDATA;
    {(|(id_mapped&A_SYSCTRL_BUS_CFG14          [15:8] )),`SYSCTRL_BUS_CFG14              } :         reg_bus_cfg14          <=   bus_cfg_locked[14] ? reg_bus_cfg14 : PWDATA;
    {(|(id_mapped&A_SYSCTRL_BUS_CFG15          [15:8] )),`SYSCTRL_BUS_CFG15              } :         reg_bus_cfg15          <=   bus_cfg_locked[15] ? reg_bus_cfg15 : PWDATA;
    {(|(id_mapped&A_SYSCTRL_BUS_CFG16          [15:8] )),`SYSCTRL_BUS_CFG16              } :         reg_bus_cfg16          <=   bus_cfg_locked[16] ? reg_bus_cfg16 : PWDATA;
    {(|(id_mapped&A_SYSCTRL_BUS_CFG17          [15:8] )),`SYSCTRL_BUS_CFG17              } :         reg_bus_cfg17          <=   bus_cfg_locked[17] ? reg_bus_cfg17 : PWDATA;
    {(|(id_mapped&A_SYSCTRL_BUS_CFG18          [15:8] )),`SYSCTRL_BUS_CFG18              } :         reg_bus_cfg18          <=   bus_cfg_locked[18] ? reg_bus_cfg18 : PWDATA;
    {(|(id_mapped&A_SYSCTRL_BUS_CFG19          [15:8] )),`SYSCTRL_BUS_CFG19              } :         reg_bus_cfg19          <=   bus_cfg_locked[19] ? reg_bus_cfg19 : PWDATA;
    {(|(id_mapped&A_SYSCTRL_BUS_CFG20          [15:8] )),`SYSCTRL_BUS_CFG20              } :         reg_bus_cfg20          <=   bus_cfg_locked[20] ? reg_bus_cfg20 : PWDATA;
    {(|(id_mapped&A_SYSCTRL_BUS_CFG21          [15:8] )),`SYSCTRL_BUS_CFG21              } :         reg_bus_cfg21          <=   bus_cfg_locked[21] ? reg_bus_cfg21 : PWDATA;
    {(|(id_mapped&A_SYSCTRL_BUS_CFG22          [15:8] )),`SYSCTRL_BUS_CFG22              } :         reg_bus_cfg22          <=   bus_cfg_locked[22] ? reg_bus_cfg22 : PWDATA;
    {(|(id_mapped&A_SYSCTRL_BUS_CFG23          [15:8] )),`SYSCTRL_BUS_CFG23              } :         reg_bus_cfg23          <=   bus_cfg_locked[23] ? reg_bus_cfg23 : PWDATA;
    {(|(id_mapped&A_SYSCTRL_BUS_CFG24          [15:8] )),`SYSCTRL_BUS_CFG24              } :         reg_bus_cfg24          <=   bus_cfg_locked[24] ? reg_bus_cfg24 : PWDATA;
    {(|(id_mapped&A_SYSCTRL_BUS_CFG25          [15:8] )),`SYSCTRL_BUS_CFG25              } :         reg_bus_cfg25          <=   bus_cfg_locked[25] ? reg_bus_cfg25 : PWDATA;
    {(|(id_mapped&A_SYSCTRL_BUS_CFG26          [15:8] )),`SYSCTRL_BUS_CFG26              } :         reg_bus_cfg26          <=   bus_cfg_locked[26] ? reg_bus_cfg26 : PWDATA;
    {(|(id_mapped&A_SYSCTRL_BUS_CFG27          [15:8] )),`SYSCTRL_BUS_CFG27              } :         reg_bus_cfg27          <=   bus_cfg_locked[27] ? reg_bus_cfg27 : PWDATA;
    {(|(id_mapped&A_SYSCTRL_BUS_CFG28          [15:8] )),`SYSCTRL_BUS_CFG28              } :         reg_bus_cfg28          <=   bus_cfg_locked[28] ? reg_bus_cfg28 : PWDATA;
    {(|(id_mapped&A_SYSCTRL_BUS_CFG29          [15:8] )),`SYSCTRL_BUS_CFG29              } :         reg_bus_cfg29          <=   bus_cfg_locked[29] ? reg_bus_cfg29 : PWDATA;
    {(|(id_mapped&A_SYSCTRL_BUS_CFG30          [15:8] )),`SYSCTRL_BUS_CFG30              } :         reg_bus_cfg30          <=   bus_cfg_locked[30] ? reg_bus_cfg30 : PWDATA;
    {(|(id_mapped&A_SYSCTRL_BUS_CFG31          [15:8] )),`SYSCTRL_BUS_CFG31              } :         reg_bus_cfg31          <=   bus_cfg_locked[31] ? reg_bus_cfg31 : PWDATA;
    {(|(id_mapped&A_SYSCTRL_MALI_TEXFMTENABLE  [15:8] )),`SYSCTRL_MALI_TEXFMTENABLE      } :         reg_mali_texfmtenable  <=   PWDATA;
    {(|(id_mapped&A_SYSCTRL_MALI_CONFIG        [15:8] )),`SYSCTRL_MALI_CONFIG            } :         reg_mali_config        <=   PWDATA;
    {(|(id_mapped&A_SYSCTRL_LOCK_BUS_CFG0      [15:8] )),`SYSCTRL_LOCK_BUS_CFG0          } :         reg_bus_cfg_lock[31: 0]<=   reg_bus_cfg_lock[31: 0] | PWDATA;
    {(|(id_mapped&A_SYSCTRL_LOCK_BUS_CFG1      [15:8] )),`SYSCTRL_LOCK_BUS_CFG1          } :         reg_bus_cfg_lock[63:32]<=   reg_bus_cfg_lock[63:32] | PWDATA;
    {(|(id_mapped&A_SYSCTRL_PROT_BUS_CFG0      [15:8] )),`SYSCTRL_PROT_BUS_CFG0          } :         reg_bus_cfg_prot[31: 0]<=   PWDATA;
    {(|(id_mapped&A_SYSCTRL_PROT_BUS_CFG1      [15:8] )),`SYSCTRL_PROT_BUS_CFG1          } :         reg_bus_cfg_prot[63:32]<=   PWDATA;
    {(|(id_mapped&A_SYSCTRL_WRITEONCE_REG0     [15:8] )),`SYSCTRL_WRITEONCE_REG0         } : begin   writeonce_reg0         <=   writeonce_reg0_lock ? writeonce_reg0 : PWDATA;
                                                                                                     writeonce_reg0_lock    <=   1'b1; end
    {(|(id_mapped&A_SYSCTRL_WRITEONCE_REG1     [15:8] )),`SYSCTRL_WRITEONCE_REG1         } : begin   writeonce_reg1         <=   writeonce_reg1_lock ? writeonce_reg1 : PWDATA;
                                                                                                     writeonce_reg1_lock    <=   1'b1; end
    {(|(id_mapped&A_SYSCTRL_WRITEONCE_SEC_REG0 [15:8] )),`SYSCTRL_WRITEONCE_SEC_REG0     } : begin   writeonce_sec_reg0     <=   writeonce_sec_reg0_lock ? writeonce_sec_reg0 : PWDATA;
                                                                                                     writeonce_sec_reg0_lock<=   1'b1; end
    {(|(id_mapped&A_SYSCTRL_WRITEONCE1_REG0    [15:8] )),`SYSCTRL_WRITEONCE1_REG0        } :         writeonce1_reg0        <=   writeonce1_reg0 | PWDATA;
    {(|(id_mapped&A_SYSCTRL_WRITEONCE1_SEC_REG0[15:8] )),`SYSCTRL_WRITEONCE1_SEC_REG0    } :         writeonce1_sec_reg0    <=   writeonce1_sec_reg0 | PWDATA;
    {(|(id_mapped&A_SYSCTRL_STATUS_REG0        [15:8] )),`SYSCTRL_STATUS_REG0            } :         status_reg0            <=   PWDATA;
    {(|(id_mapped&A_SYSCTRL_STATUS_REG1        [15:8] )),`SYSCTRL_STATUS_REG1            } :         status_reg1            <=   PWDATA;
    {(|(id_mapped&A_SYSCTRL_STATUS_REG2        [15:8] )),`SYSCTRL_STATUS_REG2            } :         status_reg2            <=   PWDATA;
    {(|(id_mapped&A_SYSCTRL_STATUS_REG3        [15:8] )),`SYSCTRL_STATUS_REG3            } :         status_reg3            <=   PWDATA;
    {(|(id_mapped&A_SYSCTRL_STATUS_REG4        [15:8] )),`SYSCTRL_STATUS_REG4            } :         status_reg4            <=   PWDATA;
    {(|(id_mapped&A_SYSCTRL_STATUS_REG5        [15:8] )),`SYSCTRL_STATUS_REG5            } :         status_reg5            <=   PWDATA;
    {(|(id_mapped&A_SYSCTRL_STATUS_REG6        [15:8] )),`SYSCTRL_STATUS_REG6            } :         status_reg6            <=   PWDATA;
    {(|(id_mapped&A_SYSCTRL_STATUS_REG7        [15:8] )),`SYSCTRL_STATUS_REG7            } :         status_reg7            <=   PWDATA;
    {(|(id_mapped&A_SYSCTRL_SEC_STATUS_REG0    [15:8] )),`SYSCTRL_SEC_STATUS_REG0        } :         sec_status_reg0        <=   PWDATA;
    {(|(id_mapped&A_SYSCTRL_SEC_STATUS_REG1    [15:8] )),`SYSCTRL_SEC_STATUS_REG1        } :         sec_status_reg1        <=   PWDATA;
    {(|(id_mapped&A_SYSCTRL_SEC_STATUS_REG2    [15:8] )),`SYSCTRL_SEC_STATUS_REG2        } :         sec_status_reg2        <=   PWDATA;
    {(|(id_mapped&A_SYSCTRL_SEC_STATUS_REG3    [15:8] )),`SYSCTRL_SEC_STATUS_REG3        } :         sec_status_reg3        <=   PWDATA;
    {(|(id_mapped&A_SYSCTRL_SEC_STATUS_REG4    [15:8] )),`SYSCTRL_SEC_STATUS_REG4        } :         sec_status_reg4        <=   PWDATA;
    {(|(id_mapped&A_SYSCTRL_SEC_STATUS_REG5    [15:8] )),`SYSCTRL_SEC_STATUS_REG5        } :         sec_status_reg5        <=   PWDATA;
    {(|(id_mapped&A_SYSCTRL_SEC_STATUS_REG6    [15:8] )),`SYSCTRL_SEC_STATUS_REG6        } :         sec_status_reg6        <=   PWDATA;
    {(|(id_mapped&A_SYSCTRL_SEC_STATUS_REG7    [15:8] )),`SYSCTRL_SEC_STATUS_REG7        } :         sec_status_reg7        <=   PWDATA;
    {(|(id_mapped&A_SYSCTRL_SEC_STATUS_REG8    [15:8] )),`SYSCTRL_SEC_STATUS_REG8        } :         sec_status_reg8        <=   PWDATA;
    {(|(id_mapped&A_SYSCTRL_SEC_STATUS_REG9    [15:8] )),`SYSCTRL_SEC_STATUS_REG9        } :         sec_status_reg9        <=   PWDATA;
    {(|(id_mapped&A_SYSCTRL_SEC_STATUS_REG10   [15:8] )),`SYSCTRL_SEC_STATUS_REG10       } :         sec_status_reg10       <=   PWDATA;
    {(|(id_mapped&A_SYSCTRL_SEC_STATUS_REG11   [15:8] )),`SYSCTRL_SEC_STATUS_REG11       } :         sec_status_reg11       <=   PWDATA;
    {(|(id_mapped&A_SYSCTRL_SEC_STATUS_REG12   [15:8] )),`SYSCTRL_SEC_STATUS_REG12       } :         sec_status_reg12       <=   PWDATA;
    {(|(id_mapped&A_SYSCTRL_SEC_STATUS_REG13   [15:8] )),`SYSCTRL_SEC_STATUS_REG13       } :         sec_status_reg13       <=   PWDATA;
    {(|(id_mapped&A_SYSCTRL_SEC_STATUS_REG14   [15:8] )),`SYSCTRL_SEC_STATUS_REG14       } :         sec_status_reg14       <=   PWDATA;
    {(|(id_mapped&A_SYSCTRL_SEC_STATUS_REG15   [15:8] )),`SYSCTRL_SEC_STATUS_REG15       } :         sec_status_reg15       <=   PWDATA;
    {(|(id_mapped&A_SYSCTRL_SEC_STATUS_REG16   [15:8] )),`SYSCTRL_SEC_STATUS_REG16       } :         sec_status_reg16       <=   PWDATA;
    {(|(id_mapped&A_SYSCTRL_SEC_STATUS_REG17   [15:8] )),`SYSCTRL_SEC_STATUS_REG17       } :         sec_status_reg17       <=   PWDATA;
    {(|(id_mapped&A_SYSCTRL_SEC_STATUS_REG18   [15:8] )),`SYSCTRL_SEC_STATUS_REG18       } :         sec_status_reg18       <=   PWDATA;
    {(|(id_mapped&A_SYSCTRL_SEC_STATUS_REG19   [15:8] )),`SYSCTRL_SEC_STATUS_REG19       } :         sec_status_reg19       <=   PWDATA;
    {(|(id_mapped&A_SYSCTRL_SEC_STATUS_REG20   [15:8] )),`SYSCTRL_SEC_STATUS_REG20       } :         sec_status_reg20       <=   PWDATA;
    {(|(id_mapped&A_SYSCTRL_SEC_STATUS_REG21   [15:8] )),`SYSCTRL_SEC_STATUS_REG21       } :         sec_status_reg21       <=   PWDATA;
    {(|(id_mapped&A_SYSCTRL_SEC_STATUS_REG22   [15:8] )),`SYSCTRL_SEC_STATUS_REG22       } :         sec_status_reg22       <=   PWDATA;
    {(|(id_mapped&A_SYSCTRL_SEC_STATUS_REG23   [15:8] )),`SYSCTRL_SEC_STATUS_REG23       } :         sec_status_reg23       <=   PWDATA;
    {(|(id_mapped&A_SYSCTRL_SEC_STATUS_REG24   [15:8] )),`SYSCTRL_SEC_STATUS_REG24       } :         sec_status_reg24       <=   PWDATA;
    {(|(id_mapped&A_SYSCTRL_SEC_STATUS_REG25   [15:8] )),`SYSCTRL_SEC_STATUS_REG25       } :         sec_status_reg25       <=   PWDATA;
    {(|(id_mapped&A_SYSCTRL_SEC_STATUS_REG26   [15:8] )),`SYSCTRL_SEC_STATUS_REG26       } :         sec_status_reg26       <=   PWDATA;
    {(|(id_mapped&A_SYSCTRL_SEC_STATUS_REG27   [15:8] )),`SYSCTRL_SEC_STATUS_REG27       } :         sec_status_reg27       <=   PWDATA;
    {(|(id_mapped&A_SYSCTRL_SEC_STATUS_REG28   [15:8] )),`SYSCTRL_SEC_STATUS_REG28       } :         sec_status_reg28       <=   PWDATA;
    {(|(id_mapped&A_SYSCTRL_SEC_STATUS_REG29   [15:8] )),`SYSCTRL_SEC_STATUS_REG29       } :         sec_status_reg29       <=   PWDATA;
    {(|(id_mapped&A_SYSCTRL_SEC_STATUS_REG30   [15:8] )),`SYSCTRL_SEC_STATUS_REG30       } :         sec_status_reg30       <=   PWDATA;
    {(|(id_mapped&A_SYSCTRL_SEC_STATUS_REG31   [15:8] )),`SYSCTRL_SEC_STATUS_REG31       } :         sec_status_reg31       <=   PWDATA;
    {(|(id_mapped&A_SYSCTRL_DEBUG_REG0         [15:8] )),`SYSCTRL_DEBUG_REG0             } :         debug_reg0             <=   PWDATA;
    {(|(id_mapped&A_SYSCTRL_DEBUG_REG1         [15:8] )),`SYSCTRL_DEBUG_REG1             } :         debug_reg1             <=   PWDATA;
    {(|(id_mapped&A_SYSCTRL_DEBUG_REG2         [15:8] )),`SYSCTRL_DEBUG_REG2             } :         debug_reg2             <=   PWDATA;
    {(|(id_mapped&A_SYSCTRL_DEBUG_REG3         [15:8] )),`SYSCTRL_DEBUG_REG3             } :         debug_reg3             <=   PWDATA;
    {(|(id_mapped&A_SYSCTRL_DEBUG_REG4         [15:8] )),`SYSCTRL_DEBUG_REG4             } :         debug_reg4             <=   PWDATA;
    {(|(id_mapped&A_SYSCTRL_DEBUG_REG5         [15:8] )),`SYSCTRL_DEBUG_REG5             } :         debug_reg5             <=   PWDATA;
    {(|(id_mapped&A_SYSCTRL_DEBUG_REG6         [15:8] )),`SYSCTRL_DEBUG_REG6             } :         debug_reg6             <=   PWDATA;
    {(|(id_mapped&A_SYSCTRL_DEBUG_REG7         [15:8] )),`SYSCTRL_DEBUG_REG7             } :         debug_reg7             <=   PWDATA;
    {(|(id_mapped&A_SYSCTRL_TIMERA_CTRL        [15:8] )),`SYSCTRL_TIMERA_CTRL            } :         timerA_ctrl            <=   PWDATA[7:0];
    {(|(id_mapped&A_SYSCTRL_TIMERB_CTRL        [15:8] )),`SYSCTRL_TIMERB_CTRL            } :         timerB_ctrl            <=   PWDATA[7:0];
    {(|(id_mapped&A_SYSCTRL_TIMERC_CTRL        [15:8] )),`SYSCTRL_TIMERC_CTRL            } :         timerC_ctrl            <=   PWDATA[7:0];
    {(|(id_mapped&A_SYSCTRL_TIMERD_CTRL        [15:8] )),`SYSCTRL_TIMERD_CTRL            } :         timerD_ctrl            <=   PWDATA[7:0];
    {(|(id_mapped&A_SYSCTRL_TIMERE_CTRL        [15:8] )),`SYSCTRL_TIMERE_CTRL            } :         timerE_ctrl            <=   PWDATA[7:0];
    {(|(id_mapped&A_SYSCTRL_TIMERF_CTRL        [15:8] )),`SYSCTRL_TIMERF_CTRL            } :         timerF_ctrl            <=   PWDATA[7:0];
    {(|(id_mapped&A_SYSCTRL_TIMERG_CTRL        [15:8] )),`SYSCTRL_TIMERG_CTRL            } :         timerG_ctrl            <=   PWDATA[7:0];
    {(|(id_mapped&A_SYSCTRL_TIMERH_CTRL        [15:8] )),`SYSCTRL_TIMERH_CTRL            } :         timerH_ctrl            <=   PWDATA[7:0];
    {(|(id_mapped&A_SYSCTRL_TIMERI_CTRL        [15:8] )),`SYSCTRL_TIMERI_CTRL            } :         timerI_ctrl            <=   PWDATA[7:0];
    {(|(id_mapped&A_SYSCTRL_TIMERJ_CTRL        [15:8] )),`SYSCTRL_TIMERJ_CTRL            } :         timerJ_ctrl            <=   PWDATA[7:0];
    {(|(id_mapped&A_SYSCTRL_TIMERA             [15:8] )),`SYSCTRL_TIMERA                 } :         timerA_cnt_init        <=   PWDATA[15:0];
    {(|(id_mapped&A_SYSCTRL_TIMERB             [15:8] )),`SYSCTRL_TIMERB                 } :         timerB_cnt_init        <=   PWDATA[15:0];
    {(|(id_mapped&A_SYSCTRL_TIMERC             [15:8] )),`SYSCTRL_TIMERC                 } :         timerC_cnt_init        <=   PWDATA[15:0];
    {(|(id_mapped&A_SYSCTRL_TIMERD             [15:8] )),`SYSCTRL_TIMERD                 } :         timerD_cnt_init        <=   PWDATA[15:0];
    {(|(id_mapped&A_SYSCTRL_TIMERG             [15:8] )),`SYSCTRL_TIMERG                 } :         timerG_cnt_init        <=   PWDATA[15:0];
    {(|(id_mapped&A_SYSCTRL_TIMERH             [15:8] )),`SYSCTRL_TIMERH                 } :         timerH_cnt_init        <=   PWDATA[15:0];
    {(|(id_mapped&A_SYSCTRL_TIMERI             [15:8] )),`SYSCTRL_TIMERI                 } :         timerI_cnt_init        <=   PWDATA[15:0];
    {(|(id_mapped&A_SYSCTRL_TIMERJ             [15:8] )),`SYSCTRL_TIMERJ                 } :         timerJ_cnt_init        <=   PWDATA[15:0];
    {(|(id_mapped&A_SYSCTRL_SEC_TIMERA_CTRL    [15:8] )),`SYSCTRL_SEC_TIMERA_CTRL        } :         sec_timerA_ctrl        <=   PWDATA[7:0];
    {(|(id_mapped&A_SYSCTRL_SEC_TIMERE_CTRL    [15:8] )),`SYSCTRL_SEC_TIMERE_CTRL        } :         sec_timerE_ctrl        <=   PWDATA[7:0];
    {(|(id_mapped&A_SYSCTRL_SEC_TIMERA         [15:8] )),`SYSCTRL_SEC_TIMERA             } :         sec_timerA_cnt_init    <=   PWDATA[15:0];
    {(|(id_mapped&A_SYSCTRL_OSC_RING_CTRL0     [15:8] )),`SYSCTRL_OSC_RING_CTRL0         } :         reg_osc_ring_ctrl0     <=   PWDATA;
    {(|(id_mapped&A_SYSCTRL_OSC_RING_CTRL1     [15:8] )),`SYSCTRL_OSC_RING_CTRL1         } :         reg_osc_ring_ctrl1     <=   PWDATA;
    {(|(id_mapped&A_SYSCTRL_OSC_RING_CTRL2     [15:8] )),`SYSCTRL_OSC_RING_CTRL2         } :         reg_osc_ring_ctrl2     <=   PWDATA;
    {(|(id_mapped&A_SYSCTRL_HDMIRXPLL_TEST_CTRL[15:8] )),`SYSCTRL_HDMIRXPLL_TEST_CTRL    } :         reg_hdmirxpll_test_ctrl<=   PWDATA[0];    
	{(|(id_mapped&A_SYSCTRL_AM2AXI_CTRL0       [15:8] )),`SYSCTRL_AM2AXI_CTRL0           } :         reg_am2axi_ctrl0       <=   PWDATA;
    {(|(id_mapped&A_SYSCTRL_AM2AXI_CTRL1       [15:8] )),`SYSCTRL_AM2AXI_CTRL1           } :         reg_am2axi_ctrl1       <=   PWDATA;
    {(|(id_mapped&A_SYSCTRL_ENABLE_SPIFC       [15:8] )),`SYSCTRL_ENABLE_SPIFC           } :         reg_enable_spifc       <=   (reg_enable_spifc==8'hA5) ? PWDATA[7:0] : reg_enable_spifc;
    {(|(id_mapped&A_SYSCTRL_TVFE_FT_TEST0      [15:8] )),`SYSCTRL_TVFE_FT_TEST0          } :         reg_tvfe_ft_test0      <=   PWDATA;
    {(|(id_mapped&A_SYSCTRL_TVFE_FT_TEST1      [15:8] )),`SYSCTRL_TVFE_FT_TEST1          } :         reg_tvfe_ft_test1      <=   PWDATA;
    {(|(id_mapped&A_SYSCTRL_TVFE_FT_TEST2      [15:8] )),`SYSCTRL_TVFE_FT_TEST2          } :         reg_tvfe_ft_test2      <=   PWDATA;
    {(|(id_mapped&A_SYSCTRL_SPI_TRIG0          [15:8] )),`SYSCTRL_SPI_TRIG0              } :         reg_sys_spi_trig0      <=   PWDATA;
    {(|(id_mapped&A_SYSCTRL_SPI_TRIG1          [15:8] )),`SYSCTRL_SPI_TRIG1              } :         reg_sys_spi_trig1      <=   PWDATA;
    {(|(id_mapped&A_SYSCTRL_SPI_TRIG2          [15:8] )),`SYSCTRL_SPI_TRIG2              } :         reg_sys_spi_trig2      <=   PWDATA;
    {(|(id_mapped&A_SYSCTRL_SPI_TRIG3          [15:8] )),`SYSCTRL_SPI_TRIG3              } :         reg_sys_spi_trig3      <=   PWDATA;
    {(|(id_mapped&A_SYSCTRL_SPI_TRIG4          [15:8] )),`SYSCTRL_SPI_TRIG4              } :         reg_sys_spi_trig4      <=   PWDATA;
    {(|(id_mapped&A_SYSCTRL_SPI_TRIG5          [15:8] )),`SYSCTRL_SPI_TRIG5              } :         reg_sys_spi_trig5      <=   PWDATA;
    default                 : begin end
    endcase
    end

//=====================================================================================
// read register

wire    [15:0]  timerA_cnt;
wire    [15:0]  timerB_cnt;
wire    [15:0]  timerC_cnt;
wire    [15:0]  timerD_cnt;
wire    [63:0]  timerE_cnt;
wire    [63:0]  timerF_cnt;
wire    [63:32] timerE_cnt_hi;
wire    [63:32] timerF_cnt_hi;
wire    [15:0]  timerG_cnt;
wire    [15:0]  timerH_cnt;
wire    [15:0]  timerI_cnt;
wire    [15:0]  timerJ_cnt;
wire    [15:0]  sec_timerA_cnt;
wire    [63:0]  sec_timerE_cnt;
wire    [63:32] sec_timerE_cnt_hi;
wire [31:0] reg_axi_pipe_ctrl0_new= {
reg_axi_pipe_sts0[31],reg_axi_pipe_ctrl0[30:28],
reg_axi_pipe_sts0[27],reg_axi_pipe_ctrl0[26:24],
reg_axi_pipe_sts0[23],reg_axi_pipe_ctrl0[22:20],
reg_axi_pipe_sts0[19],reg_axi_pipe_ctrl0[18:16],
reg_axi_pipe_sts0[15],reg_axi_pipe_ctrl0[14:12],
reg_axi_pipe_sts0[11],reg_axi_pipe_ctrl0[10:8],
reg_axi_pipe_sts0[7] ,reg_axi_pipe_ctrl0[6:4],
reg_axi_pipe_sts0[3] ,reg_axi_pipe_ctrl0[2:0] };

wire [31:0] reg_axi_pipe_ctrl1_new= {
reg_axi_pipe_sts1[31],reg_axi_pipe_ctrl1[30:28],
reg_axi_pipe_sts1[27],reg_axi_pipe_ctrl1[26:24],
reg_axi_pipe_sts1[23],reg_axi_pipe_ctrl1[22:20],
reg_axi_pipe_sts1[19],reg_axi_pipe_ctrl1[18:16],
reg_axi_pipe_sts1[15],reg_axi_pipe_ctrl1[14:12],
reg_axi_pipe_sts1[11],reg_axi_pipe_ctrl1[10:8],
reg_axi_pipe_sts1[ 7],reg_axi_pipe_ctrl1[6:4],
reg_axi_pipe_sts1[ 3],reg_axi_pipe_ctrl1[2:0] };

wire [31:0] reg_axi_pipe_ctrl2_new= {
reg_axi_pipe_sts2[31],reg_axi_pipe_ctrl2[30:28],
reg_axi_pipe_sts2[27],reg_axi_pipe_ctrl2[26:24],
reg_axi_pipe_sts2[23],reg_axi_pipe_ctrl2[22:20],
reg_axi_pipe_sts2[19],reg_axi_pipe_ctrl2[18:16],
reg_axi_pipe_sts2[15],reg_axi_pipe_ctrl2[14:12],
reg_axi_pipe_sts2[11],reg_axi_pipe_ctrl2[10:8],
reg_axi_pipe_sts2[ 7],reg_axi_pipe_ctrl2[6:4],
reg_axi_pipe_sts2[ 3],reg_axi_pipe_ctrl2[2:0] };

wire [31:0] reg_axi_pipe_ctrl3_new= {
reg_axi_pipe_sts3[31],reg_axi_pipe_ctrl3[30:28],
reg_axi_pipe_sts3[27],reg_axi_pipe_ctrl3[26:24],
reg_axi_pipe_sts3[23],reg_axi_pipe_ctrl3[22:20],
reg_axi_pipe_sts3[19],reg_axi_pipe_ctrl3[18:16],
reg_axi_pipe_sts3[15],reg_axi_pipe_ctrl3[14:12],
reg_axi_pipe_sts3[11],reg_axi_pipe_ctrl3[10:8],
reg_axi_pipe_sts3[ 7],reg_axi_pipe_ctrl3[6:4],
reg_axi_pipe_sts3[ 3],reg_axi_pipe_ctrl3[2:0] };

wire [31:0] reg_axi_pipe_ctrl4_new= {
reg_axi_pipe_sts4[31],reg_axi_pipe_ctrl4[30:28],
reg_axi_pipe_sts4[27],reg_axi_pipe_ctrl4[26:24],
reg_axi_pipe_sts4[23],reg_axi_pipe_ctrl4[22:20],
reg_axi_pipe_sts4[19],reg_axi_pipe_ctrl4[18:16],
reg_axi_pipe_sts4[15],reg_axi_pipe_ctrl4[14:12],
reg_axi_pipe_sts4[11],reg_axi_pipe_ctrl4[10:8],
reg_axi_pipe_sts4[ 7],reg_axi_pipe_ctrl4[6:4],
reg_axi_pipe_sts4[ 3],reg_axi_pipe_ctrl4[2:0] };

wire [31:0] reg_axi_pipe_ctrl5_new= {
reg_axi_pipe_sts5[31],reg_axi_pipe_ctrl5[30:28],
reg_axi_pipe_sts5[27],reg_axi_pipe_ctrl5[26:24],
reg_axi_pipe_sts5[23],reg_axi_pipe_ctrl5[22:20],
reg_axi_pipe_sts5[19],reg_axi_pipe_ctrl5[18:16],
reg_axi_pipe_sts5[15],reg_axi_pipe_ctrl5[14:12],
reg_axi_pipe_sts5[11],reg_axi_pipe_ctrl5[10:8],
reg_axi_pipe_sts5[ 7],reg_axi_pipe_ctrl5[6:4],
reg_axi_pipe_sts5[ 3],reg_axi_pipe_ctrl5[2:0] };

wire [31:0] reg_axi_pipe_ctrl6_new= {
reg_axi_pipe_sts6[31],reg_axi_pipe_ctrl6[30:28],
reg_axi_pipe_sts6[27],reg_axi_pipe_ctrl6[26:24],
reg_axi_pipe_sts6[23],reg_axi_pipe_ctrl6[22:20],
reg_axi_pipe_sts6[19],reg_axi_pipe_ctrl6[18:16],
reg_axi_pipe_sts6[15],reg_axi_pipe_ctrl6[14:12],
reg_axi_pipe_sts6[11],reg_axi_pipe_ctrl6[10:8],
reg_axi_pipe_sts6[ 7],reg_axi_pipe_ctrl6[6:4],
reg_axi_pipe_sts6[ 3],reg_axi_pipe_ctrl6[2:0] };

wire [31:0] reg_axi_pipe_ctrl7_new= {
reg_axi_pipe_sts7[31],reg_axi_pipe_ctrl7[30:28],
reg_axi_pipe_sts7[27],reg_axi_pipe_ctrl7[26:24],
reg_axi_pipe_sts7[23],reg_axi_pipe_ctrl7[22:20],
reg_axi_pipe_sts7[19],reg_axi_pipe_ctrl7[18:16],
reg_axi_pipe_sts7[15],reg_axi_pipe_ctrl7[14:12],
reg_axi_pipe_sts7[11],reg_axi_pipe_ctrl7[10:8],
reg_axi_pipe_sts7[ 7],reg_axi_pipe_ctrl7[6:4],
reg_axi_pipe_sts7[ 3],reg_axi_pipe_ctrl7[2:0] };

wire [31:0] reg_axi_pipe_ctrl8_new= {
reg_axi_pipe_sts8[31],reg_axi_pipe_ctrl8[30:28],
reg_axi_pipe_sts8[27],reg_axi_pipe_ctrl8[26:24],
reg_axi_pipe_sts8[23],reg_axi_pipe_ctrl8[22:20],
reg_axi_pipe_sts8[19],reg_axi_pipe_ctrl8[18:16],
reg_axi_pipe_sts8[15],reg_axi_pipe_ctrl8[14:12],
reg_axi_pipe_sts8[11],reg_axi_pipe_ctrl8[10:8],
reg_axi_pipe_sts8[7] ,reg_axi_pipe_ctrl8[6:4],
reg_axi_pipe_sts8[3] ,reg_axi_pipe_ctrl8[2:0] };

wire [31:0] reg_axi_pipe_ctrl9_new= {
reg_axi_pipe_sts9[31],reg_axi_pipe_ctrl9[30:28],
reg_axi_pipe_sts9[27],reg_axi_pipe_ctrl9[26:24],
reg_axi_pipe_sts9[23],reg_axi_pipe_ctrl9[22:20],
reg_axi_pipe_sts9[19],reg_axi_pipe_ctrl9[18:16],
reg_axi_pipe_sts9[15],reg_axi_pipe_ctrl9[14:12],
reg_axi_pipe_sts9[11],reg_axi_pipe_ctrl9[10:8],
reg_axi_pipe_sts9[ 7],reg_axi_pipe_ctrl9[6:4],
reg_axi_pipe_sts9[ 3],reg_axi_pipe_ctrl9[2:0] };

wire [31:0] reg_axi_pipe_ctrl10_new= {
reg_axi_pipe_sts10[31],reg_axi_pipe_ctrl10[30:28],
reg_axi_pipe_sts10[27],reg_axi_pipe_ctrl10[26:24],
reg_axi_pipe_sts10[23],reg_axi_pipe_ctrl10[22:20],
reg_axi_pipe_sts10[19],reg_axi_pipe_ctrl10[18:16],
reg_axi_pipe_sts10[15],reg_axi_pipe_ctrl10[14:12],
reg_axi_pipe_sts10[11],reg_axi_pipe_ctrl10[10:8],
reg_axi_pipe_sts10[ 7],reg_axi_pipe_ctrl10[6:4],
reg_axi_pipe_sts10[ 3],reg_axi_pipe_ctrl10[2:0] };

wire [31:0] reg_axi_pipe_ctrl11_new= {
reg_axi_pipe_sts11[31],reg_axi_pipe_ctrl11[30:28],
reg_axi_pipe_sts11[27],reg_axi_pipe_ctrl11[26:24],
reg_axi_pipe_sts11[23],reg_axi_pipe_ctrl11[22:20],
reg_axi_pipe_sts11[19],reg_axi_pipe_ctrl11[18:16],
reg_axi_pipe_sts11[15],reg_axi_pipe_ctrl11[14:12],
reg_axi_pipe_sts11[11],reg_axi_pipe_ctrl11[10:8],
reg_axi_pipe_sts11[ 7],reg_axi_pipe_ctrl11[6:4],
reg_axi_pipe_sts11[ 3],reg_axi_pipe_ctrl11[2:0] };

wire [31:0] reg_axi_pipe_ctrl12_new= {
reg_axi_pipe_sts12[31],reg_axi_pipe_ctrl12[30:28],
reg_axi_pipe_sts12[27],reg_axi_pipe_ctrl12[26:24],
reg_axi_pipe_sts12[23],reg_axi_pipe_ctrl12[22:20],
reg_axi_pipe_sts12[19],reg_axi_pipe_ctrl12[18:16],
reg_axi_pipe_sts12[15],reg_axi_pipe_ctrl12[14:12],
reg_axi_pipe_sts12[11],reg_axi_pipe_ctrl12[10:8],
reg_axi_pipe_sts12[ 7],reg_axi_pipe_ctrl12[6:4],
reg_axi_pipe_sts12[ 3],reg_axi_pipe_ctrl12[2:0] };

wire [31:0] reg_axi_pipe_ctrl13_new= {
reg_axi_pipe_sts13[31],reg_axi_pipe_ctrl13[30:28],
reg_axi_pipe_sts13[27],reg_axi_pipe_ctrl13[26:24],
reg_axi_pipe_sts13[23],reg_axi_pipe_ctrl13[22:20],
reg_axi_pipe_sts13[19],reg_axi_pipe_ctrl13[18:16],
reg_axi_pipe_sts13[15],reg_axi_pipe_ctrl13[14:12],
reg_axi_pipe_sts13[11],reg_axi_pipe_ctrl13[10:8],
reg_axi_pipe_sts13[ 7],reg_axi_pipe_ctrl13[6:4],
reg_axi_pipe_sts13[ 3],reg_axi_pipe_ctrl13[2:0] };

wire [31:0] reg_axi_pipe_ctrl14_new= {
reg_axi_pipe_sts14[31],reg_axi_pipe_ctrl14[30:28],
reg_axi_pipe_sts14[27],reg_axi_pipe_ctrl14[26:24],
reg_axi_pipe_sts14[23],reg_axi_pipe_ctrl14[22:20],
reg_axi_pipe_sts14[19],reg_axi_pipe_ctrl14[18:16],
reg_axi_pipe_sts14[15],reg_axi_pipe_ctrl14[14:12],
reg_axi_pipe_sts14[11],reg_axi_pipe_ctrl14[10:8],
reg_axi_pipe_sts14[ 7],reg_axi_pipe_ctrl14[6:4],
reg_axi_pipe_sts14[ 3],reg_axi_pipe_ctrl14[2:0] };

wire [31:0] reg_axi_pipe_ctrl15_new= {
reg_axi_pipe_sts15[31],reg_axi_pipe_ctrl15[30:28],
reg_axi_pipe_sts15[27],reg_axi_pipe_ctrl15[26:24],
reg_axi_pipe_sts15[23],reg_axi_pipe_ctrl15[22:20],
reg_axi_pipe_sts15[19],reg_axi_pipe_ctrl15[18:16],
reg_axi_pipe_sts15[15],reg_axi_pipe_ctrl15[14:12],
reg_axi_pipe_sts15[11],reg_axi_pipe_ctrl15[10:8],
reg_axi_pipe_sts15[ 7],reg_axi_pipe_ctrl15[6:4],
reg_axi_pipe_sts15[ 3],reg_axi_pipe_ctrl15[2:0] };

wire [31:0] reg_dos_axi_pipe_ctrl0_new= {
reg_dos_axi_pipe_sts0[31],reg_dos_axi_pipe_ctrl0[30:28],
reg_dos_axi_pipe_sts0[27],reg_dos_axi_pipe_ctrl0[26:24],
reg_dos_axi_pipe_sts0[23],reg_dos_axi_pipe_ctrl0[22:20],
reg_dos_axi_pipe_sts0[19],reg_dos_axi_pipe_ctrl0[18:16],
reg_dos_axi_pipe_sts0[15],reg_dos_axi_pipe_ctrl0[14:12],
reg_dos_axi_pipe_sts0[11],reg_dos_axi_pipe_ctrl0[10:8],
reg_dos_axi_pipe_sts0[7] ,reg_dos_axi_pipe_ctrl0[6:4],
reg_dos_axi_pipe_sts0[3] ,reg_dos_axi_pipe_ctrl0[2:0] };

reg [31:0]      scr_value;
reg [15:0]      scr_cnt;
reg             h2tmr_int_d1;    //delay 1 cycle timer expire hit
reg [15:0]      timer_cnt;      //timer cnter

always @(posedge PCLK or negedge reset_n)
    if (~reset_n)
        scr_value   <= 0;
    else if (PSEL && PWRITE && PENABLE && (PADDR[11:2]==`SYSCTRL_SCR) && (|(id_mapped&A_SYSCTRL_SCR[15:8])))
        scr_value   <= PWDATA;
    else if (scr_cnt == timer90k_div)
         scr_value  <= scr_value +1;     // synopsys label scr_value_add
    else
      scr_value <= scr_value;
always @(posedge PCLK or negedge reset_n)
    if (~reset_n)
        scr_cnt <= 0;
    else if (PSEL && PWRITE && PENABLE && (PADDR[11:2]==`SYSCTRL_SCR)&& (|(id_mapped&A_SYSCTRL_SCR[15:8])))
        scr_cnt <= 0;
    else if (scr_cnt == timer90k_div)
        scr_cnt <= 0;
    else
        scr_cnt <= scr_cnt + 1;
always @(posedge PCLK or negedge reset_n)
    if (~reset_n)
        timer_cnt    <=  16'h0;
    else if (timer_cnt == pg_timer)
        timer_cnt   <=  16'h0;
    else if (scr_cnt == timer90k_div)  //pg_timer_intp = pg_timer x scr_cnt 
       timer_cnt <= timer_cnt +1;
    else
       timer_cnt   <=  timer_cnt;
wire h2tmr_int_n = timer_cnt == pg_timer;
always @(posedge PCLK or negedge reset_n)
     if (~reset_n)
         h2tmr_int_d1    <=  1'b0;
     else 
         h2tmr_int_d1    <= h2tmr_int_n;
assign h2tmr_int = h2tmr_int_n && ~h2tmr_int_d1;  //timer intp to cpu pulse
reg [31:0] r_alert_sts;
always @(posedge PCLK or negedge reset_n_pad)
  if(!reset_n_pad)
    r_alert_sts <= 0;
  else
    r_alert_sts <= r_alert_sts | sts_sec_alert;
always @(posedge c_gclk or negedge reset_n)
  if(!reset_n)
    PRDATA     <=   0;
  else if(PSEL && !PWRITE && PENABLE)
    case({1'b1,PADDR[11:2]})
    {(|(id_mapped&A_SYSCTRL_SCR                        [7:0])),`SYSCTRL_SCR                        }: PRDATA <=  scr_value;
    {(|(id_mapped&A_SYSCTRL_TIMER90K                   [7:0])),`SYSCTRL_TIMER90K                   }: PRDATA <=  {16'd0,timer90k_div};
    {(|(id_mapped&A_SYSCTRL_HPG_TIMER                  [7:0])),`SYSCTRL_HPG_TIMER                  }: PRDATA <=  {16'd0,pg_timer};
    {(|(id_mapped&A_SYSCTRL_AXI_PIPE_CTRL0             [7:0])),`SYSCTRL_AXI_PIPE_CTRL0             }: PRDATA <=  reg_axi_pipe_ctrl0_new;
    {(|(id_mapped&A_SYSCTRL_AXI_PIPE_CTRL1             [7:0])),`SYSCTRL_AXI_PIPE_CTRL1             }: PRDATA <=  reg_axi_pipe_ctrl1_new;
    {(|(id_mapped&A_SYSCTRL_AXI_PIPE_CTRL2             [7:0])),`SYSCTRL_AXI_PIPE_CTRL2             }: PRDATA <=  reg_axi_pipe_ctrl2_new;
    {(|(id_mapped&A_SYSCTRL_AXI_PIPE_CTRL3             [7:0])),`SYSCTRL_AXI_PIPE_CTRL3             }: PRDATA <=  reg_axi_pipe_ctrl3_new;
    {(|(id_mapped&A_SYSCTRL_AXI_PIPE_CTRL4             [7:0])),`SYSCTRL_AXI_PIPE_CTRL4             }: PRDATA <=  reg_axi_pipe_ctrl4_new;
    {(|(id_mapped&A_SYSCTRL_AXI_PIPE_CTRL5             [7:0])),`SYSCTRL_AXI_PIPE_CTRL5             }: PRDATA <=  reg_axi_pipe_ctrl5_new;
    {(|(id_mapped&A_SYSCTRL_AXI_PIPE_CTRL6             [7:0])),`SYSCTRL_AXI_PIPE_CTRL6             }: PRDATA <=  reg_axi_pipe_ctrl6_new;
    {(|(id_mapped&A_SYSCTRL_AXI_PIPE_CTRL7             [7:0])),`SYSCTRL_AXI_PIPE_CTRL7             }: PRDATA <=  reg_axi_pipe_ctrl7_new;
    {(|(id_mapped&A_SYSCTRL_AXI_PIPE_CTRL8             [7:0])),`SYSCTRL_AXI_PIPE_CTRL8             }: PRDATA <=  reg_axi_pipe_ctrl8_new;
    {(|(id_mapped&A_SYSCTRL_AXI_PIPE_CTRL9             [7:0])),`SYSCTRL_AXI_PIPE_CTRL9             }: PRDATA <=  reg_axi_pipe_ctrl9_new;
    {(|(id_mapped&A_SYSCTRL_AXI_PIPE_CTRL10            [7:0])),`SYSCTRL_AXI_PIPE_CTRL10            }: PRDATA <=  reg_axi_pipe_ctrl10_new;
    {(|(id_mapped&A_SYSCTRL_AXI_PIPE_CTRL11            [7:0])),`SYSCTRL_AXI_PIPE_CTRL11            }: PRDATA <=  reg_axi_pipe_ctrl11_new;
    {(|(id_mapped&A_SYSCTRL_AXI_PIPE_CTRL12            [7:0])),`SYSCTRL_AXI_PIPE_CTRL12            }: PRDATA <=  reg_axi_pipe_ctrl12_new;
    {(|(id_mapped&A_SYSCTRL_AXI_PIPE_CTRL13            [7:0])),`SYSCTRL_AXI_PIPE_CTRL13            }: PRDATA <=  reg_axi_pipe_ctrl13_new;
    {(|(id_mapped&A_SYSCTRL_AXI_PIPE_CTRL14            [7:0])),`SYSCTRL_AXI_PIPE_CTRL14            }: PRDATA <=  reg_axi_pipe_ctrl14_new;
    {(|(id_mapped&A_SYSCTRL_AXI_PIPE_CTRL15            [7:0])),`SYSCTRL_AXI_PIPE_CTRL15            }: PRDATA <=  reg_axi_pipe_ctrl15_new;
    {(|(id_mapped&A_SYSCTRL_DOS_AXI_PIPE_CTRL0         [7:0])),`SYSCTRL_DOS_AXI_PIPE_CTRL0         }: PRDATA <=  reg_dos_axi_pipe_ctrl0_new;
    {(|(id_mapped&A_SYSCTRL_SPICC_CTRL0                [7:0])),`SYSCTRL_SPICC_CTRL0                }: PRDATA <=  reg_spicc_ctrl0;
    {(|(id_mapped&A_SYSCTRL_AXISRAM_CFG0               [7:0])),`SYSCTRL_AXISRAM_CFG0               }: PRDATA <=  reg_axi_sram_cfg0;
    {(|(id_mapped&A_SYSCTRL_BUS_CFG0                   [7:0])),`SYSCTRL_BUS_CFG0                   }: PRDATA <=  reg_bus_cfg0;
    {(|(id_mapped&A_SYSCTRL_BUS_CFG1                   [7:0])),`SYSCTRL_BUS_CFG1                   }: PRDATA <=  reg_bus_cfg1;
    {(|(id_mapped&A_SYSCTRL_BUS_CFG2                   [7:0])),`SYSCTRL_BUS_CFG2                   }: PRDATA <=  reg_bus_cfg2;
    {(|(id_mapped&A_SYSCTRL_BUS_CFG3                   [7:0])),`SYSCTRL_BUS_CFG3                   }: PRDATA <=  reg_bus_cfg3;
    {(|(id_mapped&A_SYSCTRL_BUS_CFG4                   [7:0])),`SYSCTRL_BUS_CFG4                   }: PRDATA <=  reg_bus_cfg4;
    {(|(id_mapped&A_SYSCTRL_BUS_CFG5                   [7:0])),`SYSCTRL_BUS_CFG5                   }: PRDATA <=  reg_bus_cfg5;
    {(|(id_mapped&A_SYSCTRL_BUS_CFG6                   [7:0])),`SYSCTRL_BUS_CFG6                   }: PRDATA <=  reg_bus_cfg6;
    {(|(id_mapped&A_SYSCTRL_BUS_CFG7                   [7:0])),`SYSCTRL_BUS_CFG7                   }: PRDATA <=  reg_bus_cfg7;
    {(|(id_mapped&A_SYSCTRL_BUS_CFG8                   [7:0])),`SYSCTRL_BUS_CFG8                   }: PRDATA <=  reg_bus_cfg8;
    {(|(id_mapped&A_SYSCTRL_BUS_CFG9                   [7:0])),`SYSCTRL_BUS_CFG9                   }: PRDATA <=  reg_bus_cfg9;
    {(|(id_mapped&A_SYSCTRL_BUS_CFG10                  [7:0])),`SYSCTRL_BUS_CFG10                  }: PRDATA <=  reg_bus_cfg10;
    {(|(id_mapped&A_SYSCTRL_BUS_CFG11                  [7:0])),`SYSCTRL_BUS_CFG11                  }: PRDATA <=  reg_bus_cfg11;
    {(|(id_mapped&A_SYSCTRL_BUS_CFG12                  [7:0])),`SYSCTRL_BUS_CFG12                  }: PRDATA <=  reg_bus_cfg12;
    {(|(id_mapped&A_SYSCTRL_BUS_CFG13                  [7:0])),`SYSCTRL_BUS_CFG13                  }: PRDATA <=  reg_bus_cfg13;
    {(|(id_mapped&A_SYSCTRL_BUS_CFG14                  [7:0])),`SYSCTRL_BUS_CFG14                  }: PRDATA <=  reg_bus_cfg14;
    {(|(id_mapped&A_SYSCTRL_BUS_CFG15                  [7:0])),`SYSCTRL_BUS_CFG15                  }: PRDATA <=  reg_bus_cfg15;
    {(|(id_mapped&A_SYSCTRL_BUS_CFG16                  [7:0])),`SYSCTRL_BUS_CFG16                  }: PRDATA <=  reg_bus_cfg16;
    {(|(id_mapped&A_SYSCTRL_BUS_CFG17                  [7:0])),`SYSCTRL_BUS_CFG17                  }: PRDATA <=  reg_bus_cfg17;
    {(|(id_mapped&A_SYSCTRL_BUS_CFG18                  [7:0])),`SYSCTRL_BUS_CFG18                  }: PRDATA <=  reg_bus_cfg18;
    {(|(id_mapped&A_SYSCTRL_BUS_CFG19                  [7:0])),`SYSCTRL_BUS_CFG19                  }: PRDATA <=  reg_bus_cfg19;
    {(|(id_mapped&A_SYSCTRL_BUS_CFG20                  [7:0])),`SYSCTRL_BUS_CFG20                  }: PRDATA <=  reg_bus_cfg20;
    {(|(id_mapped&A_SYSCTRL_BUS_CFG21                  [7:0])),`SYSCTRL_BUS_CFG21                  }: PRDATA <=  reg_bus_cfg21;
    {(|(id_mapped&A_SYSCTRL_BUS_CFG22                  [7:0])),`SYSCTRL_BUS_CFG22                  }: PRDATA <=  reg_bus_cfg22;
    {(|(id_mapped&A_SYSCTRL_BUS_CFG23                  [7:0])),`SYSCTRL_BUS_CFG23                  }: PRDATA <=  reg_bus_cfg23;
    {(|(id_mapped&A_SYSCTRL_BUS_CFG24                  [7:0])),`SYSCTRL_BUS_CFG24                  }: PRDATA <=  reg_bus_cfg24;
    {(|(id_mapped&A_SYSCTRL_BUS_CFG25                  [7:0])),`SYSCTRL_BUS_CFG25                  }: PRDATA <=  reg_bus_cfg25;
    {(|(id_mapped&A_SYSCTRL_BUS_CFG26                  [7:0])),`SYSCTRL_BUS_CFG26                  }: PRDATA <=  reg_bus_cfg26;
    {(|(id_mapped&A_SYSCTRL_BUS_CFG27                  [7:0])),`SYSCTRL_BUS_CFG27                  }: PRDATA <=  reg_bus_cfg27;
    {(|(id_mapped&A_SYSCTRL_BUS_CFG28                  [7:0])),`SYSCTRL_BUS_CFG28                  }: PRDATA <=  reg_bus_cfg28;
    {(|(id_mapped&A_SYSCTRL_BUS_CFG29                  [7:0])),`SYSCTRL_BUS_CFG29                  }: PRDATA <=  reg_bus_cfg29;
    {(|(id_mapped&A_SYSCTRL_BUS_CFG30                  [7:0])),`SYSCTRL_BUS_CFG30                  }: PRDATA <=  reg_bus_cfg30;
    {(|(id_mapped&A_SYSCTRL_BUS_CFG31                  [7:0])),`SYSCTRL_BUS_CFG31                  }: PRDATA <=  reg_bus_cfg31;    
    {(|(id_mapped&A_SYSCTRL_MALI_TEXFMTENABLE          [7:0])),`SYSCTRL_MALI_TEXFMTENABLE          }: PRDATA <=  reg_mali_texfmtenable;
    {(|(id_mapped&A_SYSCTRL_MALI_CONFIG                [7:0])),`SYSCTRL_MALI_CONFIG                }: PRDATA <=  reg_mali_config;
    {(|(id_mapped&A_SYSCTRL_BUS_STS0                   [7:0])),`SYSCTRL_BUS_STS0                   }: PRDATA <=  reg_bus_sts0;
    {(|(id_mapped&A_SYSCTRL_BUS_STS1                   [7:0])),`SYSCTRL_BUS_STS1                   }: PRDATA <=  reg_bus_sts1;
    {(|(id_mapped&A_SYSCTRL_BUS_STS2                   [7:0])),`SYSCTRL_BUS_STS2                   }: PRDATA <=  reg_bus_sts2;
    {(|(id_mapped&A_SYSCTRL_DDRPHY_STS                 [7:0])),`SYSCTRL_DDRPHY_STS                 }: PRDATA <=  reg_ddrphy_sts;
    {(|(id_mapped&A_SYSCTRL_LOCK_BUS_CFG0              [7:0])),`SYSCTRL_LOCK_BUS_CFG0              }: PRDATA <=  reg_bus_cfg_lock[31: 0];
    {(|(id_mapped&A_SYSCTRL_LOCK_BUS_CFG1              [7:0])),`SYSCTRL_LOCK_BUS_CFG1              }: PRDATA <=  reg_bus_cfg_lock[63:32];
    {(|(id_mapped&A_SYSCTRL_PROT_BUS_CFG0              [7:0])),`SYSCTRL_PROT_BUS_CFG0              }: PRDATA <=  reg_bus_cfg_prot[31: 0];
    {(|(id_mapped&A_SYSCTRL_PROT_BUS_CFG1              [7:0])),`SYSCTRL_PROT_BUS_CFG1              }: PRDATA <=  reg_bus_cfg_prot[63:32];
    {(|(id_mapped&A_SYSCTRL_CHIP_ID                    [7:0])),`SYSCTRL_CHIP_ID                    }: PRDATA <=  32'h42;
    {(|(id_mapped&A_SYSCTRL_POC                        [7:0])),`SYSCTRL_POC                        }: PRDATA <=  {16'd0,poc_sig_store[15:0]};
    {(|(id_mapped&A_SYSCTRL_DEBUG_REG0                 [7:0])),`SYSCTRL_DEBUG_REG0                 }: PRDATA <=  debug_reg0 ;
    {(|(id_mapped&A_SYSCTRL_DEBUG_REG1                 [7:0])),`SYSCTRL_DEBUG_REG1                 }: PRDATA <=  debug_reg1 ;
    {(|(id_mapped&A_SYSCTRL_DEBUG_REG2                 [7:0])),`SYSCTRL_DEBUG_REG2                 }: PRDATA <=  debug_reg2 ;
    {(|(id_mapped&A_SYSCTRL_DEBUG_REG3                 [7:0])),`SYSCTRL_DEBUG_REG3                 }: PRDATA <=  debug_reg3 ;
    {(|(id_mapped&A_SYSCTRL_DEBUG_REG4                 [7:0])),`SYSCTRL_DEBUG_REG4                 }: PRDATA <=  debug_reg4 ;
    {(|(id_mapped&A_SYSCTRL_DEBUG_REG5                 [7:0])),`SYSCTRL_DEBUG_REG5                 }: PRDATA <=  debug_reg5 ;
    {(|(id_mapped&A_SYSCTRL_DEBUG_REG6                 [7:0])),`SYSCTRL_DEBUG_REG6                 }: PRDATA <=  debug_reg6 ;
    {(|(id_mapped&A_SYSCTRL_DEBUG_REG7                 [7:0])),`SYSCTRL_DEBUG_REG7                 }: PRDATA <=  debug_reg7 ;
    {(|(id_mapped&A_SYSCTRL_METAL_REV0                 [7:0])),`SYSCTRL_METAL_REV0                 }: PRDATA <=  metal_rev[31:0]  ;
    {(|(id_mapped&A_SYSCTRL_METAL_REV1                 [7:0])),`SYSCTRL_METAL_REV1                 }: PRDATA <=  metal_rev[63:32] ;
    {(|(id_mapped&A_SYSCTRL_METAL_REV2                 [7:0])),`SYSCTRL_METAL_REV2                 }: PRDATA <=  {28'd0,metal_rev[67:64]} ;
    {(|(id_mapped&A_SYSCTRL_WRITEONCE_REG0             [7:0])),`SYSCTRL_WRITEONCE_REG0             }: PRDATA <=  writeonce_reg0;
    {(|(id_mapped&A_SYSCTRL_WRITEONCE_REG1             [7:0])),`SYSCTRL_WRITEONCE_REG1             }: PRDATA <=  writeonce_reg1;
    {(|(id_mapped&A_SYSCTRL_WRITEONCE_SEC_REG0         [7:0])),`SYSCTRL_WRITEONCE_SEC_REG0         }: PRDATA <=  writeonce_sec_reg0;
    {(|(id_mapped&A_SYSCTRL_WRITEONCE1_REG0            [7:0])),`SYSCTRL_WRITEONCE1_REG0            }: PRDATA <=  writeonce1_reg0;
    {(|(id_mapped&A_SYSCTRL_WRITEONCE1_SEC_REG0        [7:0])),`SYSCTRL_WRITEONCE1_SEC_REG0        }: PRDATA <=  writeonce1_sec_reg0;
    {(|(id_mapped&A_SYSCTRL_STATUS_REG0                [7:0])),`SYSCTRL_STATUS_REG0                }: PRDATA <=  status_reg0;
    {(|(id_mapped&A_SYSCTRL_STATUS_REG1                [7:0])),`SYSCTRL_STATUS_REG1                }: PRDATA <=  status_reg1;
    {(|(id_mapped&A_SYSCTRL_STATUS_REG2                [7:0])),`SYSCTRL_STATUS_REG2                }: PRDATA <=  status_reg2;
    {(|(id_mapped&A_SYSCTRL_STATUS_REG3                [7:0])),`SYSCTRL_STATUS_REG3                }: PRDATA <=  status_reg3;
    {(|(id_mapped&A_SYSCTRL_STATUS_REG4                [7:0])),`SYSCTRL_STATUS_REG4                }: PRDATA <=  status_reg4;
    {(|(id_mapped&A_SYSCTRL_STATUS_REG5                [7:0])),`SYSCTRL_STATUS_REG5                }: PRDATA <=  status_reg5;
    {(|(id_mapped&A_SYSCTRL_STATUS_REG6                [7:0])),`SYSCTRL_STATUS_REG6                }: PRDATA <=  status_reg6;
    {(|(id_mapped&A_SYSCTRL_STATUS_REG7                [7:0])),`SYSCTRL_STATUS_REG7                }: PRDATA <=  status_reg7;
    {(|(id_mapped&A_SYSCTRL_WRITEONCE_STICKY_REG0      [7:0])),`SYSCTRL_WRITEONCE_STICKY_REG0      }: PRDATA <=  writeonce_sticky_reg0;
    {(|(id_mapped&A_SYSCTRL_WRITEONCE_STICKY_REG1      [7:0])),`SYSCTRL_WRITEONCE_STICKY_REG1      }: PRDATA <=  writeonce_sticky_reg1;
    {(|(id_mapped&A_SYSCTRL_WRITEONCE_STICKY_SEC_REG0  [7:0])),`SYSCTRL_WRITEONCE_STICKY_SEC_REG0  }: PRDATA <=  writeonce_sticky_sec_reg0;
    {(|(id_mapped&A_SYSCTRL_WRITEONCE1_STICKY_REG0     [7:0])),`SYSCTRL_WRITEONCE1_STICKY_REG0     }: PRDATA <=  writeonce1_sticky_reg0;
    {(|(id_mapped&A_SYSCTRL_WRITEONCE1_STICKY_SEC_REG0 [7:0])),`SYSCTRL_WRITEONCE1_STICKY_SEC_REG0 }: PRDATA <=  writeonce1_sticky_sec_reg0;
    {(|(id_mapped&A_SYSCTRL_STICKY_REG0                [7:0])),`SYSCTRL_STICKY_REG0                }: PRDATA <=  sticky_reg0;
    {(|(id_mapped&A_SYSCTRL_STICKY_REG1                [7:0])),`SYSCTRL_STICKY_REG1                }: PRDATA <=  sticky_reg1;
    {(|(id_mapped&A_SYSCTRL_STICKY_REG2                [7:0])),`SYSCTRL_STICKY_REG2                }: PRDATA <=  sticky_reg2;
    {(|(id_mapped&A_SYSCTRL_STICKY_REG3                [7:0])),`SYSCTRL_STICKY_REG3                }: PRDATA <=  sticky_reg3;
    {(|(id_mapped&A_SYSCTRL_STICKY_REG4                [7:0])),`SYSCTRL_STICKY_REG4                }: PRDATA <=  sticky_reg4;
    {(|(id_mapped&A_SYSCTRL_STICKY_REG5                [7:0])),`SYSCTRL_STICKY_REG5                }: PRDATA <=  sticky_reg5;
    {(|(id_mapped&A_SYSCTRL_STICKY_REG6                [7:0])),`SYSCTRL_STICKY_REG6                }: PRDATA <=  sticky_reg6;
    {(|(id_mapped&A_SYSCTRL_STICKY_REG7                [7:0])),`SYSCTRL_STICKY_REG7                }: PRDATA <=  sticky_reg7;
    {(|(id_mapped&A_SYSCTRL_SEC_STATUS_REG0            [7:0])),`SYSCTRL_SEC_STATUS_REG0            }: PRDATA <=  sec_status_reg0 ;
    {(|(id_mapped&A_SYSCTRL_SEC_STATUS_REG1            [7:0])),`SYSCTRL_SEC_STATUS_REG1            }: PRDATA <=  sec_status_reg1 ;
    {(|(id_mapped&A_SYSCTRL_SEC_STATUS_REG2            [7:0])),`SYSCTRL_SEC_STATUS_REG2            }: PRDATA <=  sec_status_reg2 ;
    {(|(id_mapped&A_SYSCTRL_SEC_STATUS_REG3            [7:0])),`SYSCTRL_SEC_STATUS_REG3            }: PRDATA <=  sec_status_reg3 ;
    {(|(id_mapped&A_SYSCTRL_SEC_STATUS_REG4            [7:0])),`SYSCTRL_SEC_STATUS_REG4            }: PRDATA <=  sec_status_reg4 ;
    {(|(id_mapped&A_SYSCTRL_SEC_STATUS_REG5            [7:0])),`SYSCTRL_SEC_STATUS_REG5            }: PRDATA <=  sec_status_reg5 ;
    {(|(id_mapped&A_SYSCTRL_SEC_STATUS_REG6            [7:0])),`SYSCTRL_SEC_STATUS_REG6            }: PRDATA <=  sec_status_reg6 ;
    {(|(id_mapped&A_SYSCTRL_SEC_STATUS_REG7            [7:0])),`SYSCTRL_SEC_STATUS_REG7            }: PRDATA <=  sec_status_reg7 ;
    {(|(id_mapped&A_SYSCTRL_SEC_STATUS_REG8            [7:0])),`SYSCTRL_SEC_STATUS_REG8            }: PRDATA <=  sec_status_reg8 ;
    {(|(id_mapped&A_SYSCTRL_SEC_STATUS_REG9            [7:0])),`SYSCTRL_SEC_STATUS_REG9            }: PRDATA <=  sec_status_reg9 ;
    {(|(id_mapped&A_SYSCTRL_SEC_STATUS_REG10           [7:0])),`SYSCTRL_SEC_STATUS_REG10           }: PRDATA <=  sec_status_reg10;
    {(|(id_mapped&A_SYSCTRL_SEC_STATUS_REG11           [7:0])),`SYSCTRL_SEC_STATUS_REG11           }: PRDATA <=  sec_status_reg11;
    {(|(id_mapped&A_SYSCTRL_SEC_STATUS_REG12           [7:0])),`SYSCTRL_SEC_STATUS_REG12           }: PRDATA <=  sec_status_reg12;
    {(|(id_mapped&A_SYSCTRL_SEC_STATUS_REG13           [7:0])),`SYSCTRL_SEC_STATUS_REG13           }: PRDATA <=  sec_status_reg13;
    {(|(id_mapped&A_SYSCTRL_SEC_STATUS_REG14           [7:0])),`SYSCTRL_SEC_STATUS_REG14           }: PRDATA <=  sec_status_reg14;
    {(|(id_mapped&A_SYSCTRL_SEC_STATUS_REG15           [7:0])),`SYSCTRL_SEC_STATUS_REG15           }: PRDATA <=  sec_status_reg15;
    {(|(id_mapped&A_SYSCTRL_SEC_STATUS_REG16           [7:0])),`SYSCTRL_SEC_STATUS_REG16           }: PRDATA <=  sec_status_reg16;
    {(|(id_mapped&A_SYSCTRL_SEC_STATUS_REG17           [7:0])),`SYSCTRL_SEC_STATUS_REG17           }: PRDATA <=  sec_status_reg17;
    {(|(id_mapped&A_SYSCTRL_SEC_STATUS_REG18           [7:0])),`SYSCTRL_SEC_STATUS_REG18           }: PRDATA <=  sec_status_reg18;
    {(|(id_mapped&A_SYSCTRL_SEC_STATUS_REG19           [7:0])),`SYSCTRL_SEC_STATUS_REG19           }: PRDATA <=  sec_status_reg19;
    {(|(id_mapped&A_SYSCTRL_SEC_STATUS_REG20           [7:0])),`SYSCTRL_SEC_STATUS_REG20           }: PRDATA <=  sec_status_reg20;
    {(|(id_mapped&A_SYSCTRL_SEC_STATUS_REG21           [7:0])),`SYSCTRL_SEC_STATUS_REG21           }: PRDATA <=  sec_status_reg21;
    {(|(id_mapped&A_SYSCTRL_SEC_STATUS_REG22           [7:0])),`SYSCTRL_SEC_STATUS_REG22           }: PRDATA <=  sec_status_reg22;
    {(|(id_mapped&A_SYSCTRL_SEC_STATUS_REG23           [7:0])),`SYSCTRL_SEC_STATUS_REG23           }: PRDATA <=  sec_status_reg23;
    {(|(id_mapped&A_SYSCTRL_SEC_STATUS_REG24           [7:0])),`SYSCTRL_SEC_STATUS_REG24           }: PRDATA <=  sec_status_reg24;
    {(|(id_mapped&A_SYSCTRL_SEC_STATUS_REG25           [7:0])),`SYSCTRL_SEC_STATUS_REG25           }: PRDATA <=  sec_status_reg25;
    {(|(id_mapped&A_SYSCTRL_SEC_STATUS_REG26           [7:0])),`SYSCTRL_SEC_STATUS_REG26           }: PRDATA <=  sec_status_reg26;
    {(|(id_mapped&A_SYSCTRL_SEC_STATUS_REG27           [7:0])),`SYSCTRL_SEC_STATUS_REG27           }: PRDATA <=  sec_status_reg27;
    {(|(id_mapped&A_SYSCTRL_SEC_STATUS_REG28           [7:0])),`SYSCTRL_SEC_STATUS_REG28           }: PRDATA <=  sec_status_reg28;
    {(|(id_mapped&A_SYSCTRL_SEC_STATUS_REG29           [7:0])),`SYSCTRL_SEC_STATUS_REG29           }: PRDATA <=  sec_status_reg29;
    {(|(id_mapped&A_SYSCTRL_SEC_STATUS_REG30           [7:0])),`SYSCTRL_SEC_STATUS_REG30           }: PRDATA <=  sec_status_reg30;
    {(|(id_mapped&A_SYSCTRL_SEC_STATUS_REG31           [7:0])),`SYSCTRL_SEC_STATUS_REG31           }: PRDATA <=  sec_status_reg31;
    {(|(id_mapped&A_SYSCTRL_SEC_STICKY_REG0            [7:0])),`SYSCTRL_SEC_STICKY_REG0            }: PRDATA <=  sec_sticky_reg0;
    {(|(id_mapped&A_SYSCTRL_SEC_STICKY_REG1            [7:0])),`SYSCTRL_SEC_STICKY_REG1            }: PRDATA <=  sec_sticky_reg1;
    {(|(id_mapped&A_SYSCTRL_SEC_STICKY_REG2            [7:0])),`SYSCTRL_SEC_STICKY_REG2            }: PRDATA <=  sec_sticky_reg2;
    {(|(id_mapped&A_SYSCTRL_SEC_STICKY_REG3            [7:0])),`SYSCTRL_SEC_STICKY_REG3            }: PRDATA <=  sec_sticky_reg3;
    {(|(id_mapped&A_SYSCTRL_SEC_STICKY_REG4            [7:0])),`SYSCTRL_SEC_STICKY_REG4            }: PRDATA <=  sec_sticky_reg4;
    {(|(id_mapped&A_SYSCTRL_SEC_STICKY_REG5            [7:0])),`SYSCTRL_SEC_STICKY_REG5            }: PRDATA <=  sec_sticky_reg5;
    {(|(id_mapped&A_SYSCTRL_SEC_STICKY_REG6            [7:0])),`SYSCTRL_SEC_STICKY_REG6            }: PRDATA <=  sec_sticky_reg6;
    {(|(id_mapped&A_SYSCTRL_SEC_STICKY_REG7            [7:0])),`SYSCTRL_SEC_STICKY_REG7            }: PRDATA <=  sec_sticky_reg7;
    {(|(id_mapped&A_SYSCTRL_CEC_STICKY_REG0            [7:0])),`SYSCTRL_CEC_STICKY_REG0            }: PRDATA <=  cec_sticky_reg0;
    {(|(id_mapped&A_SYSCTRL_CEC_STICKY_REG1            [7:0])),`SYSCTRL_CEC_STICKY_REG1            }: PRDATA <=  cec_sticky_reg1;
    {(|(id_mapped&A_SYSCTRL_CEC_STICKY_REG2            [7:0])),`SYSCTRL_CEC_STICKY_REG2            }: PRDATA <=  cec_sticky_reg2;
    {(|(id_mapped&A_SYSCTRL_CEC_STICKY_REG3            [7:0])),`SYSCTRL_CEC_STICKY_REG3            }: PRDATA <=  cec_sticky_reg3;
    {(|(id_mapped&A_SYSCTRL_CEC_STICKY_REG4            [7:0])),`SYSCTRL_CEC_STICKY_REG4            }: PRDATA <=  cec_sticky_reg4;
    {(|(id_mapped&A_SYSCTRL_CEC_STICKY_REG5            [7:0])),`SYSCTRL_CEC_STICKY_REG5            }: PRDATA <=  cec_sticky_reg5;
    {(|(id_mapped&A_SYSCTRL_CEC_STICKY_REG6            [7:0])),`SYSCTRL_CEC_STICKY_REG6            }: PRDATA <=  cec_sticky_reg6;
    {(|(id_mapped&A_SYSCTRL_CEC_STICKY_REG7            [7:0])),`SYSCTRL_CEC_STICKY_REG7            }: PRDATA <=  cec_sticky_reg7;
    {(|(id_mapped&A_SYSCTRL_ENABLE_SPIFC               [7:0])),`SYSCTRL_ENABLE_SPIFC               }: PRDATA <=  {24'd0,reg_enable_spifc[7:0]};
    {(|(id_mapped&A_SYSCTRL_TVFE_FT_TEST0              [7:0])),`SYSCTRL_TVFE_FT_TEST0              }: PRDATA <=  reg_tvfe_ft_test0;
    {(|(id_mapped&A_SYSCTRL_TVFE_FT_TEST1              [7:0])),`SYSCTRL_TVFE_FT_TEST1              }: PRDATA <=  reg_tvfe_ft_test1;
    {(|(id_mapped&A_SYSCTRL_TVFE_FT_TEST2              [7:0])),`SYSCTRL_TVFE_FT_TEST2              }: PRDATA <=  reg_tvfe_ft_test2;
    {(|(id_mapped&A_SYSCTRL_SPI_TRIG0                  [7:0])),`SYSCTRL_SPI_TRIG0                  }: PRDATA <=  reg_sys_spi_trig0;
    {(|(id_mapped&A_SYSCTRL_SPI_TRIG1                  [7:0])),`SYSCTRL_SPI_TRIG1                  }: PRDATA <=  reg_sys_spi_trig1;
    {(|(id_mapped&A_SYSCTRL_SPI_TRIG2                  [7:0])),`SYSCTRL_SPI_TRIG2                  }: PRDATA <=  reg_sys_spi_trig2;
    {(|(id_mapped&A_SYSCTRL_SPI_TRIG3                  [7:0])),`SYSCTRL_SPI_TRIG3                  }: PRDATA <=  reg_sys_spi_trig3;
    {(|(id_mapped&A_SYSCTRL_SPI_TRIG4                  [7:0])),`SYSCTRL_SPI_TRIG4                  }: PRDATA <=  reg_sys_spi_trig4;
    {(|(id_mapped&A_SYSCTRL_SPI_TRIG5                  [7:0])),`SYSCTRL_SPI_TRIG5                  }: PRDATA <=  reg_sys_spi_trig5;
    {(|(id_mapped&A_SYSCTRL_ALERT_STS_STICKY           [7:0])),`SYSCTRL_ALERT_STS_STICKY           }: PRDATA <=  r_alert_sts;//{vtdd_reset_sts,r_alert_sts[30:0]} ;
    {(|(id_mapped&A_SYSCTRL_ALERT_ENABLE               [7:0])),`SYSCTRL_ALERT_ENABLE               }: PRDATA <=  reg_alert_enable;
    {(|(id_mapped&A_SYSCTRL_REG_VPU_SECURE0            [7:0])),`SYSCTRL_REG_VPU_SECURE0            }: PRDATA <=  reg_vpu_secure0;
    {(|(id_mapped&A_SYSCTRL_REG_VPU_SECURE1            [7:0])),`SYSCTRL_REG_VPU_SECURE1            }: PRDATA <=  reg_vpu_secure1;
//    {(|(id_mapped&A_SYSCTRL_SYS_CLK_VPU_EN             [7:0])),`SYSCTRL_SYS_CLK_VPU_EN             }: PRDATA <=  sys_clk_vpu_en ;
    {(|(id_mapped&A_SYSCTRL_REG_CMPR_SECURE            [7:0])),`SYSCTRL_REG_CMPR_SECURE            }: PRDATA <=  reg_cmpr_secure;
    {(|(id_mapped&A_SYSCTRL_REG_FRC_SECURE             [7:0])),`SYSCTRL_REG_FRC_SECURE             }: PRDATA <=  reg_frc_secure;
    //{(|(id_mapped&A_SYSCTRL_MOPA_CTRL                  [7:0])),`SYSCTRL_MOPA_CTRL                  }: PRDATA <=  reg_mopa_ctrl;
    //{(|(id_mapped&A_SYSCTRL_MOPB_CTRL                  [7:0])),`SYSCTRL_MOPB_CTRL                  }: PRDATA <=  reg_mopb_ctrl;
    //{(|(id_mapped&A_SYSCTRL_DEWARPA_SECURE_REG         [7:0])),`SYSCTRL_DEWARPA_SECURE_REG         }: PRDATA <=  reg_dewarpa_secure;
    //{(|(id_mapped&A_SYSCTRL_DEWARPB_SECURE_REG         [7:0])),`SYSCTRL_DEWARPB_SECURE_REG         }: PRDATA <=  reg_dewarpb_secure;
    //{(|(id_mapped&A_SYSCTRL_DEWARPC_SECURE_REG         [7:0])),`SYSCTRL_DEWARPC_SECURE_REG         }: PRDATA <=  reg_dewarpc_secure;
    {(|(id_mapped&A_SYSCTRL_OSC_RING_CTRL0             [7:0])),`SYSCTRL_OSC_RING_CTRL0             }: PRDATA <=  reg_osc_ring_ctrl0;
    {(|(id_mapped&A_SYSCTRL_OSC_RING_CTRL1             [7:0])),`SYSCTRL_OSC_RING_CTRL1             }: PRDATA <=  reg_osc_ring_ctrl1;
    {(|(id_mapped&A_SYSCTRL_OSC_RING_CTRL2             [7:0])),`SYSCTRL_OSC_RING_CTRL2             }: PRDATA <=  reg_osc_ring_ctrl2;
    {(|(id_mapped&A_SYSCTRL_HDMIRXPLL_TEST_CTRL        [7:0])),`SYSCTRL_HDMIRXPLL_TEST_CTRL        }: PRDATA <=  {31'h0,reg_hdmirxpll_test_ctrl};    
	{(|(id_mapped&A_SYSCTRL_AM2AXI_CTRL0               [7:0])),`SYSCTRL_AM2AXI_CTRL0               }: PRDATA <=  reg_am2axi_ctrl0;
    {(|(id_mapped&A_SYSCTRL_AM2AXI_CTRL1               [7:0])),`SYSCTRL_AM2AXI_CTRL1               }: PRDATA <=  reg_am2axi_ctrl1;
    {(|(id_mapped&A_SYSCTRL_AM2AXI_STS                 [7:0])),`SYSCTRL_AM2AXI_STS                 }: PRDATA <=  sts_am2axi;
    {(|(id_mapped&A_SYSCTRL_TIMERA_CTRL                [7:0])),`SYSCTRL_TIMERA_CTRL                }: PRDATA <=  {24'd0,timerA_ctrl};
    {(|(id_mapped&A_SYSCTRL_TIMERB_CTRL                [7:0])),`SYSCTRL_TIMERB_CTRL                }: PRDATA <=  {24'd0,timerB_ctrl};
    {(|(id_mapped&A_SYSCTRL_TIMERC_CTRL                [7:0])),`SYSCTRL_TIMERC_CTRL                }: PRDATA <=  {24'd0,timerC_ctrl};
    {(|(id_mapped&A_SYSCTRL_TIMERD_CTRL                [7:0])),`SYSCTRL_TIMERD_CTRL                }: PRDATA <=  {24'd0,timerD_ctrl};
    {(|(id_mapped&A_SYSCTRL_TIMERE_CTRL                [7:0])),`SYSCTRL_TIMERE_CTRL                }: PRDATA <=  {24'd0,timerE_ctrl};
    {(|(id_mapped&A_SYSCTRL_TIMERF_CTRL                [7:0])),`SYSCTRL_TIMERF_CTRL                }: PRDATA <=  {24'd0,timerF_ctrl};
    {(|(id_mapped&A_SYSCTRL_TIMERG_CTRL                [7:0])),`SYSCTRL_TIMERG_CTRL                }: PRDATA <=  {24'd0,timerG_ctrl};
    {(|(id_mapped&A_SYSCTRL_TIMERH_CTRL                [7:0])),`SYSCTRL_TIMERH_CTRL                }: PRDATA <=  {24'd0,timerH_ctrl};
    {(|(id_mapped&A_SYSCTRL_TIMERI_CTRL                [7:0])),`SYSCTRL_TIMERI_CTRL                }: PRDATA <=  {24'd0,timerI_ctrl};
    {(|(id_mapped&A_SYSCTRL_TIMERJ_CTRL                [7:0])),`SYSCTRL_TIMERJ_CTRL                }: PRDATA <=  {24'd0,timerJ_ctrl};
    {(|(id_mapped&A_SYSCTRL_SEC_TIMERA_CTRL            [7:0])),`SYSCTRL_SEC_TIMERA_CTRL            }: PRDATA <=  {24'd0,sec_timerA_ctrl};
    {(|(id_mapped&A_SYSCTRL_SEC_TIMERE_CTRL            [7:0])),`SYSCTRL_SEC_TIMERE_CTRL            }: PRDATA <=  {24'd0,sec_timerE_ctrl};
    {(|(id_mapped&A_SYSCTRL_TIMERA                     [7:0])),`SYSCTRL_TIMERA                     }: PRDATA <=  {timerA_cnt_init[15:0],timerA_cnt};
    {(|(id_mapped&A_SYSCTRL_TIMERB                     [7:0])),`SYSCTRL_TIMERB                     }: PRDATA <=  {timerB_cnt_init[15:0],timerB_cnt};
    {(|(id_mapped&A_SYSCTRL_TIMERC                     [7:0])),`SYSCTRL_TIMERC                     }: PRDATA <=  {timerC_cnt_init[15:0],timerC_cnt};
    {(|(id_mapped&A_SYSCTRL_TIMERD                     [7:0])),`SYSCTRL_TIMERD                     }: PRDATA <=  {timerD_cnt_init[15:0],timerD_cnt};
    {(|(id_mapped&A_SYSCTRL_TIMERG                     [7:0])),`SYSCTRL_TIMERG                     }: PRDATA <=  {timerG_cnt_init[15:0],timerG_cnt};
    {(|(id_mapped&A_SYSCTRL_TIMERH                     [7:0])),`SYSCTRL_TIMERH                     }: PRDATA <=  {timerH_cnt_init[15:0],timerH_cnt};
    {(|(id_mapped&A_SYSCTRL_TIMERI                     [7:0])),`SYSCTRL_TIMERI                     }: PRDATA <=  {timerI_cnt_init[15:0],timerI_cnt};
    {(|(id_mapped&A_SYSCTRL_TIMERJ                     [7:0])),`SYSCTRL_TIMERJ                     }: PRDATA <=  {timerJ_cnt_init[15:0],timerJ_cnt};
    {(|(id_mapped&A_SYSCTRL_TIMERE                     [7:0])),`SYSCTRL_TIMERE                     }: PRDATA <=  timerE_cnt[31:0];
    {(|(id_mapped&A_SYSCTRL_TIMERE_HI                  [7:0])),`SYSCTRL_TIMERE_HI                  }: PRDATA <=  timerE_cnt_hi;
    {(|(id_mapped&A_SYSCTRL_TIMERF                     [7:0])),`SYSCTRL_TIMERF                     }: PRDATA <=  timerF_cnt[31:0];
    {(|(id_mapped&A_SYSCTRL_TIMERF_HI                  [7:0])),`SYSCTRL_TIMERF_HI                  }: PRDATA <=  timerF_cnt_hi;
    {(|(id_mapped&A_SYSCTRL_SEC_TIMERA                 [7:0])),`SYSCTRL_SEC_TIMERA                 }: PRDATA <=  {sec_timerA_cnt_init[15:0],sec_timerA_cnt};
    {(|(id_mapped&A_SYSCTRL_SEC_TIMERE                 [7:0])),`SYSCTRL_SEC_TIMERE                 }: PRDATA <=  sec_timerE_cnt[31:0];
    {(|(id_mapped&A_SYSCTRL_SEC_TIMERE_HI              [7:0])),`SYSCTRL_SEC_TIMERE_HI              }: PRDATA <=  sec_timerE_cnt_hi;
    {(|(id_mapped&A_SYSCTRL_MSG_INDEX0_STICKY          [7:0])),`SYSCTRL_MSG_INDEX0_STICKY          }: PRDATA <=  {16'd0,msg_index0_sticky};
    {(|(id_mapped&A_SYSCTRL_MSG_INDEX1_STICKY          [7:0])),`SYSCTRL_MSG_INDEX1_STICKY          }: PRDATA <=  {16'd0,msg_index1_sticky};
    {(|(id_mapped&A_SYSCTRL_MSG_INDEX2_STICKY          [7:0])),`SYSCTRL_MSG_INDEX2_STICKY          }: PRDATA <=  {16'd0,msg_index2_sticky};
    {(|(id_mapped&A_SYSCTRL_MSG_INDEX3_STICKY          [7:0])),`SYSCTRL_MSG_INDEX3_STICKY          }: PRDATA <=  {16'd0,msg_index3_sticky};
    default                             :   PRDATA   <=    0;
    endcase
  else
    PRDATA     <=   0;


//=====================================================================================
// pready
always @(posedge c_gclk or negedge reset_n)
  if(!reset_n)
    PREADY     <=   1;
  else if(PSEL && !PENABLE && !PWRITE)
    PREADY     <=   0;
  else
    PREADY     <=   1;
assign PSLVERR =  1'b0;

//=====================================================================================
// Timer A (periodic interrupt timer)
wire      timerA_reg_updt = (PSEL && PWRITE && PENABLE) && (PADDR[11:2]==`SYSCTRL_TIMERA) && (|(id_mapped&A_SYSCTRL_TIMERA[15:8]));
timerA  u_timerA(
  .reg_clk             (c_gclk                  ),
  .free_clk            (PCLK                    ),
  .reset_n             (reset_n                 ),
  .test_mode           (test_mode               ),
  .clk_sys_1uS_tick    (clk_sys_1uS_tick        ),
  .clk_sys_10uS_tick   (clk_sys_10uS_tick       ),
  .clk_sys_100uS_tick  (clk_sys_100uS_tick      ),
  .timerA_ctrl         (timerA_ctrl             ),
  .timerA_reg_updt     (timerA_reg_updt         ),
  .timerA_cnt_init     (timerA_cnt_init         ),
  .timerA_cnt          (timerA_cnt              ),
  .timerA_irq          (timerA_irq              ));


//=====================================================================================
// Timer B (periodic interrupt timer)
wire      timerB_reg_updt = (PSEL && PWRITE && PENABLE) && (PADDR[11:2]==`SYSCTRL_TIMERB)&& (|(id_mapped&A_SYSCTRL_TIMERB[15:8]));
timerA  u_timerB(
  .reg_clk             (c_gclk                  ),
  .free_clk            (PCLK                    ),
  .reset_n             (reset_n                 ),
  .test_mode           (test_mode               ),
  .clk_sys_1uS_tick    (clk_sys_1uS_tick        ),
  .clk_sys_10uS_tick   (clk_sys_10uS_tick       ),
  .clk_sys_100uS_tick  (clk_sys_100uS_tick      ),
  .timerA_ctrl         (timerB_ctrl             ),
  .timerA_reg_updt     (timerB_reg_updt         ),
  .timerA_cnt_init     (timerB_cnt_init         ),
  .timerA_cnt          (timerB_cnt              ),
  .timerA_irq          (timerB_irq              ));

//=====================================================================================
// Timer C (periodic interrupt timer)
wire      timerC_reg_updt = (PSEL && PWRITE && PENABLE) && (PADDR[11:2]==`SYSCTRL_TIMERC)&& (|(id_mapped&A_SYSCTRL_TIMERC[15:8]));
timerA  u_timerC(
  .reg_clk             (c_gclk                  ),
  .free_clk            (PCLK                    ),
  .reset_n             (reset_n                 ),
  .test_mode           (test_mode               ),
  .clk_sys_1uS_tick    (clk_sys_1uS_tick        ),
  .clk_sys_10uS_tick   (clk_sys_10uS_tick       ),
  .clk_sys_100uS_tick  (clk_sys_100uS_tick      ),
  .timerA_ctrl         (timerC_ctrl             ),
  .timerA_reg_updt     (timerC_reg_updt         ),
  .timerA_cnt_init     (timerC_cnt_init         ),
  .timerA_cnt          (timerC_cnt              ),
  .timerA_irq          (timerC_irq              ));

//=====================================================================================
// Timer D (periodic interrupt timer)
wire      timerD_reg_updt = (PSEL && PWRITE && PENABLE) && (PADDR[11:2]==`SYSCTRL_TIMERD)&& (|(id_mapped&A_SYSCTRL_TIMERD[15:8]));
timerA  u_timerD(
  .reg_clk             (c_gclk                  ),
  .free_clk            (PCLK                    ),
  .reset_n             (reset_n                 ),
  .test_mode           (test_mode               ),
  .clk_sys_1uS_tick    (clk_sys_1uS_tick        ),
  .clk_sys_10uS_tick   (clk_sys_10uS_tick       ),
  .clk_sys_100uS_tick  (clk_sys_100uS_tick      ),
  .timerA_ctrl         (timerD_ctrl             ),
  .timerA_reg_updt     (timerD_reg_updt         ),
  .timerA_cnt_init     (timerD_cnt_init         ),
  .timerA_cnt          (timerD_cnt              ),
  .timerA_irq          (timerD_irq              ));

//=====================================================================================
// Timer G (periodic interrupt timer)
wire      timerG_reg_updt = (PSEL && PWRITE && PENABLE) && (PADDR[11:2]==`SYSCTRL_TIMERG)&& (|(id_mapped&A_SYSCTRL_TIMERG[15:8]));
timerA  u_timerG(
  .reg_clk             (c_gclk                  ),
  .free_clk            (PCLK                    ),
  .reset_n             (reset_n                 ),
  .test_mode           (test_mode               ),
  .clk_sys_1uS_tick    (clk_sys_1uS_tick        ),
  .clk_sys_10uS_tick   (clk_sys_10uS_tick       ),
  .clk_sys_100uS_tick  (clk_sys_100uS_tick      ),
  .timerA_ctrl         (timerG_ctrl             ),
  .timerA_reg_updt     (timerG_reg_updt         ),
  .timerA_cnt_init     (timerG_cnt_init         ),
  .timerA_cnt          (timerG_cnt              ),
  .timerA_irq          (timerG_irq              ));

//=====================================================================================
// Timer H (periodic interrupt timer)
wire      timerH_reg_updt = (PSEL && PWRITE && PENABLE) && (PADDR[11:2]==`SYSCTRL_TIMERH)&& (|(id_mapped&A_SYSCTRL_TIMERH[15:8]));
timerA  u_timerH(
  .reg_clk             (c_gclk                  ),
  .free_clk            (PCLK                    ),
  .reset_n             (reset_n                 ),
  .test_mode           (test_mode               ),
  .clk_sys_1uS_tick    (clk_sys_1uS_tick        ),
  .clk_sys_10uS_tick   (clk_sys_10uS_tick       ),
  .clk_sys_100uS_tick  (clk_sys_100uS_tick      ),
  .timerA_ctrl         (timerH_ctrl             ),
  .timerA_reg_updt     (timerH_reg_updt         ),
  .timerA_cnt_init     (timerH_cnt_init         ),
  .timerA_cnt          (timerH_cnt              ),
  .timerA_irq          (timerH_irq              ));
//=====================================================================================
// Timer I (periodic interrupt timer)
wire      timerI_reg_updt = (PSEL && PWRITE && PENABLE) && (PADDR[11:2]==`SYSCTRL_TIMERI)&& (|(id_mapped&A_SYSCTRL_TIMERI[15:8]));
timerA  u_timerI(
  .reg_clk             (c_gclk                  ),
  .free_clk            (PCLK                    ),
  .reset_n             (reset_n                 ),
  .test_mode           (test_mode               ),
  .clk_sys_1uS_tick    (clk_sys_1uS_tick        ),
  .clk_sys_10uS_tick   (clk_sys_10uS_tick       ),
  .clk_sys_100uS_tick  (clk_sys_100uS_tick      ),
  .timerA_ctrl         (timerI_ctrl             ),
  .timerA_reg_updt     (timerI_reg_updt         ),
  .timerA_cnt_init     (timerI_cnt_init         ),
  .timerA_cnt          (timerI_cnt              ),
  .timerA_irq          (timerI_irq              ));
//=====================================================================================
// Timer J (periodic interrupt timer)
wire      timerJ_reg_updt = (PSEL && PWRITE && PENABLE) && (PADDR[11:2]==`SYSCTRL_TIMERJ)&& (|(id_mapped&A_SYSCTRL_TIMERJ[15:8]));
timerA  u_timerJ(
  .reg_clk             (c_gclk                  ),
  .free_clk            (PCLK                    ),
  .reset_n             (reset_n                 ),
  .test_mode           (test_mode               ),
  .clk_sys_1uS_tick    (clk_sys_1uS_tick        ),
  .clk_sys_10uS_tick   (clk_sys_10uS_tick       ),
  .clk_sys_100uS_tick  (clk_sys_100uS_tick      ),
  .timerA_ctrl         (timerJ_ctrl             ),
  .timerA_reg_updt     (timerJ_reg_updt         ),
  .timerA_cnt_init     (timerJ_cnt_init         ),
  .timerA_cnt          (timerJ_cnt              ),
  .timerA_irq          (timerJ_irq              ));

//=====================================================================================
// Timer E - bit counter
wire            timerE_reg_updt     = (PSEL && PWRITE && PENABLE) && (PADDR[11:2]==`SYSCTRL_TIMERE)&& (|(id_mapped&A_SYSCTRL_TIMERE[15:8]));
wire            timerE_reg_updt_hi  = (PSEL &&!PWRITE && PENABLE) && (PADDR[11:2]==`SYSCTRL_TIMERE)&& (|(id_mapped&A_SYSCTRL_TIMERE[7:0]));
timerE  u_timerE(
  .free_clk            (PCLK                    ),
  .reset_n             (reset_n                 ),
  .test_mode           (test_mode               ),
  .clk_sys_1uS_tick    (clk_sys_1uS_tick        ),
  .clk_sys_10uS_tick   (clk_sys_10uS_tick       ),
  .clk_sys_100uS_tick  (clk_sys_100uS_tick      ),
  .timerE_ctrl         (timerE_ctrl             ),
  .timerE_reg_updt     (timerE_reg_updt         ),
  .timerE_reg_updt_hi  (timerE_reg_updt_hi      ),
  .timerE_cnt          (timerE_cnt              ),
  .timerE_cnt_hi       (timerE_cnt_hi           ));


//=====================================================================================
// Timer F - bit counter
wire            timerF_reg_updt     = (PSEL && PWRITE && PENABLE) && (PADDR[11:2]==`SYSCTRL_TIMERF)&& (|(id_mapped&A_SYSCTRL_TIMERF[15:8]));
wire            timerF_reg_updt_hi  = (PSEL &&!PWRITE && PENABLE) && (PADDR[11:2]==`SYSCTRL_TIMERF)&& (|(id_mapped&A_SYSCTRL_TIMERF[7:0]));

timerE  u_timerF(
  .free_clk            (PCLK                    ),
  .reset_n             (reset_n                 ),
  .test_mode           (test_mode               ),
  .clk_sys_1uS_tick    (clk_sys_1uS_tick        ),
  .clk_sys_10uS_tick   (clk_sys_10uS_tick       ),
  .clk_sys_100uS_tick  (clk_sys_100uS_tick      ),
  .timerE_ctrl         (timerF_ctrl             ),
  .timerE_reg_updt     (timerF_reg_updt         ),
  .timerE_reg_updt_hi  (timerF_reg_updt_hi      ),
  .timerE_cnt          (timerF_cnt              ),
  .timerE_cnt_hi       (timerF_cnt_hi           ));

//=====================================================================================
// sec Timer A (periodic interrupt timer)
wire      sec_timerA_reg_updt = (PSEL && PWRITE && PENABLE) && (PADDR[11:2]==`SYSCTRL_SEC_TIMERA)&& (|(id_mapped&A_SYSCTRL_SEC_TIMERA[15:8]));
timerA  u_sec_timerA(
  .reg_clk             (c_gclk                  ),
  .free_clk            (PCLK                    ),
  .reset_n             (reset_n                 ),
  .test_mode           (test_mode               ),
  .clk_sys_1uS_tick    (clk_sys_1uS_tick        ),
  .clk_sys_10uS_tick   (clk_sys_10uS_tick       ),
  .clk_sys_100uS_tick  (clk_sys_100uS_tick      ),
  .timerA_ctrl         (sec_timerA_ctrl         ),
  .timerA_reg_updt     (sec_timerA_reg_updt     ),
  .timerA_cnt_init     (sec_timerA_cnt_init     ),
  .timerA_cnt          (sec_timerA_cnt          ),
  .timerA_irq          (sec_timerA_irq          ));

//=====================================================================================
// sec Timer E - bit counter
wire            sec_timerE_reg_updt     = (PSEL && PWRITE && PENABLE) && (PADDR[11:2]==`SYSCTRL_SEC_TIMERE) && (|(id_mapped&A_SYSCTRL_SEC_TIMERE[15:8]));
wire            sec_timerE_reg_updt_hi  = (PSEL &&!PWRITE && PENABLE) && (PADDR[11:2]==`SYSCTRL_SEC_TIMERE) && (|(id_mapped&A_SYSCTRL_SEC_TIMERE[7:0]));

timerE  u_sec_timerE(
  .free_clk            (PCLK                    ),
  .reset_n             (reset_n                 ),
  .test_mode           (test_mode               ),
  .clk_sys_1uS_tick    (clk_sys_1uS_tick        ),
  .clk_sys_10uS_tick   (clk_sys_10uS_tick       ),
  .clk_sys_100uS_tick  (clk_sys_100uS_tick      ),
  .timerE_ctrl         (sec_timerE_ctrl         ),
  .timerE_reg_updt     (sec_timerE_reg_updt     ),
  .timerE_reg_updt_hi  (sec_timerE_reg_updt_hi  ),
  .timerE_cnt          (sec_timerE_cnt          ),
  .timerE_cnt_hi       (sec_timerE_cnt_hi       ));


endmodule

