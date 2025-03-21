module ripple(
    input rst, clk,
    output wire [3:0] count
); 
t_ff ff0(1'b1, clk, rst, count[0]);   
t_ff ff1(1'b1, count[0], rst, count[1]);  
t_ff ff2(1'b1, count[1], rst, count[2]); 
t_ff ff3(1'b1, count[2], rst, count[3]);  

endmodule


// Test bench code
module ripple_tb;
reg rst;
reg clk;
wire [3:0] count;   
ripple uut(.*);
initial begin
clk = 0;
forever #5 clk = ~clk; 
end
initial begin 
$dumpfile("ripple.vcd");
$dumpvars(0, ripple_tb);
$monitor($time, " counting = %b", count);       
rst = 1; 
#20 rst = 0; 
#500 $finish; 
end 
endmodule
