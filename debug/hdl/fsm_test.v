//------------------------------------------------------------------------------
// Universitatea Transilvania din Brasov
// Facultatea IESC
// Proiect     : Laborator ED
// Modul       : fsm_test
// Descriere   : Testbench pentru cele 3 module
// Autor       : Nistor Ciprian Alexandru
// Data        : Mai. 2, 2023
//------------------------------------------------------------------------------

module fsm_test;
wire       clk              ;//clock
wire       rst_n            ;//reset

wire          r_m;            //ledul rosu    -> masina
wire          v_m;            //ledul verde   -> masina
wire          g_m;            //ledul galben  -> masina

wire          r_p;            //ledul rosu    -> pieton
wire          v_p;            //ledul verde   -> pieton
reg          btn;

ck_rst_tb #(.CK_SEMIPERIOD ('d10)) i_ck_rst_tb (
.clk    (clk   ),
.rst_n  (rst_n )
);
initial begin

  @(negedge rst_n);
  @(posedge rst_n);
  btn <= 1'b0;
  @(posedge clk);
  #250
  btn = 1;
  @(posedge clk);
  btn = 0;
  $display ("%M %0t INFO: Final simulare.", $time);
  $stop;
end

semafor_verilog DUT_SEMAFOR(
  .clk    (clk   ),
  .rst_n  (rst_n ),
  .btn    (btn   ),
  .r_m    (r_m   ),
  .v_m    (v_m   ),
  .g_m    (g_m   ),
  .r_p    (r_p   ),
  .v_p    (v_p   )
);
endmodule // fsm_test
