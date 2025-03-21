module t_ff (
    input t, 
    input clk, 
    input rst, 
    output reg q
);
    always @(negedge clk or posedge rst) begin
        if (rst) 
            q <= 1'b0;  
        else 
            q <= ~q;
    end
endmodule

