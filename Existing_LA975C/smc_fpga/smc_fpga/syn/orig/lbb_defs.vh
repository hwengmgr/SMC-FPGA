module lbb_fpga (
  I_LCLK,
  IN_RESET,
  I_LHOLD,
  I_LDSHOLD,
  IN_ADS,
  IN_ADS_A,
  IN_ADS_B,
  IN_LWR,
  IN_DTR,
  IN_DEN,
  IN_LLOCKo,
  IN_WAITo,
  IN_READYo,
  IN_BLAST,
  IN_DACK,
  IN_LINTo,
  IN_LSERR,
  O_LHOLDA,
  ON_READYi,
  ON_BTERM,
  ON_EOT,
  ON_DREQ,
  ON_LINTi,
  ON_S,
  I_LABS3,
  I_LABS2,
  IN_LBE,
  B_LAD,
  IN_TCI_VALID,
  IN_TCI_VALID_A,
  IN_TCI_VALID_B,
  IN_TCI_TIMER_INT,
  IN_TCI_PIO_READY,
  IN_TCI_DMA0_REQ,
  IN_TCI_DMA1_REQ,
  IN_TCI_DMA2_REQ,
  IN_TCI_DMA3_REQ,
  IN_TCI_DMA4_REQ,
  ON_TCI_GET_REG,
  ON_TCI_GET_DATA,
  ON_TCI_PIO_SELECT,
  O_TCI_ADDR_DATAN,
  O_TCI_READ_WRITEN,
  ON_TCI_BLOCK_SEL,
  B_TCI_AD,
  I_IDPROM_DO,
  O_IDPROM_DI,
  O_IDPROM_SK,
  O_IDPROM_CE,
  I_TEST_TS,
  I_TESTID_EN,
  O_TESTID,
  O_UUINPUTS
);
input I_LCLK;
input IN_RESET;
input I_LHOLD;
input I_LDSHOLD;
input IN_ADS;
input IN_ADS_A;
input IN_ADS_B;
input IN_LWR;
input IN_DTR;
input IN_DEN;
input IN_LLOCKo;
input IN_WAITo;
input IN_READYo;
input IN_BLAST;
input IN_DACK;
input IN_LINTo;
input IN_LSERR;
output O_LHOLDA;
output ON_READYi;
output ON_BTERM;
output ON_EOT;
output ON_DREQ;
output ON_LINTi;
output ON_S;
input I_LABS3;
input I_LABS2;
input [3:0] IN_LBE;
inout [31:0] B_LAD;
input IN_TCI_VALID;
input IN_TCI_VALID_A;
input IN_TCI_VALID_B;
input IN_TCI_TIMER_INT;
input IN_TCI_PIO_READY;
input [1:0] IN_TCI_DMA0_REQ;
input [1:0] IN_TCI_DMA1_REQ;
input [1:0] IN_TCI_DMA2_REQ;
input [1:0] IN_TCI_DMA3_REQ;
input [1:0] IN_TCI_DMA4_REQ;
output ON_TCI_GET_REG;
output ON_TCI_GET_DATA;
output ON_TCI_PIO_SELECT;
output O_TCI_ADDR_DATAN;
output O_TCI_READ_WRITEN;
output [4:0] ON_TCI_BLOCK_SEL;
inout [31:0] B_TCI_AD;
input I_IDPROM_DO;
output O_IDPROM_DI;
output O_IDPROM_SK;
output O_IDPROM_CE;
input I_TEST_TS;
input I_TESTID_EN;
output [7:0] O_TESTID;
output O_UUINPUTS;
