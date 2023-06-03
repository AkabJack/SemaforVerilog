//------------------------------------------------------------------------------
// Universitatea Transilvania din Brasov
// Facultatea IESC
// Proiect     : Laborator ED
// Modul       : semafor_verilog
// Descriere   : Semafor
// Autor       : Nistor Ciprian Alexandru
// Data        : Mai. 2, 2023
//------------------------------------------------------------------------------

module semafor_verilog(
input           clk,            // ceas, activ pe front crescator
input           rst_n,          // reset activ in zero
input           btn,            // input buton semafor

output reg      r_m,            //ledul rosu    -> masina
output reg      v_m,            //ledul verde   -> masina
output reg      g_m,            //ledul galben  -> masina

output reg      r_p,            //ledul rosu    -> pieton
output reg      v_p             //ledul verde   -> pieton

);
reg btn_status;
reg[2:0] status;
reg[6:0] counter;


localparam idle     = 2'b00;
localparam vm_rp    = 2'b01;
localparam gm_rp    = 2'b10;
localparam rm_vp    = 2'b11;

always @(posedge clk or negedge rst_n) begin
    if((status == idle) && (counter < 6'd11)) counter <= counter + 1;
    else if ((status == vm_rp) && ~(counter == 6'd60)) counter <= counter + 1;
    else if ((status == gm_rp) && ~(counter == 6'd5)) counter <= counter + 1;
    else if ((status == rm_vp) && ~(counter == 6'd29)) counter <= counter + 1;
    
end

always @(posedge clk or negedge rst_n)
if (~rst_n)begin 
        status <= idle; 
        counter <= 0;
        btn_status <= 0;
    end else if((status == idle) && (counter == 5'd9))begin
    status <= vm_rp;    // status = verde_masina-rosu_pieton
    counter <= 0;
end
    
always @(posedge clk or negedge rst_n)
    if ((~btn_status) && (status == vm_rp) && (btn))begin btn_status <= 1; end

always @(posedge clk or negedge rst_n)
    if ((status == idle) && (counter < 6'd59) && (~btn_status)) begin//default cand status == idle
        v_m <= 1;           // verde    -> masina
        r_p <= 1;           // rosu     -> pieton

        //setam catre o stare cunoscuta
        r_m <= 0;           //ledul rosu    -> masina
        g_m <= 0;           //ledul galben  -> masina
        v_p <= 0;           //ledul verde   -> pieton 

    end else if ((status == vm_rp) && (counter >= 6'd59) && (btn_status))begin
        status <= gm_rp;    // status = galben_masina-rosu_pieton
        counter <= 0;       // resetam counterul
        v_m <= 0;           // verde   -> masina
        g_m <= 1;           // galben  -> masina
        btn_status <= 0;

    end else if ((status == gm_rp) && (counter == 6'd5))begin
        status <= rm_vp;    // status = rosu_masina-verde_pieton
        counter <= 0;       // resetam counterul
        g_m <= 0;           // galben  -> masina
        r_m <= 1;           // rosu    -> masina
        r_p <= 0;           // rosu    -> pieton
        v_p <= 1;           // verde   -> pieton

    end else if ((status == rm_vp) && (counter == 6'd29))begin
        status <= vm_rp;    // status = verde_masina-rosu_pieton
        counter <= 0;       // resetam counterul
        r_m <= 0;           // rosu    -> masina
        v_m <= 1;           // verde   -> masina
        r_p <= 1;           // rosu    -> pieton
        v_p <= 0;           // verde   -> pieton
    end
endmodule