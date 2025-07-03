module mock_uart #(
    parameter int APB_ADDR_WIDTH = 32,
    parameter int APB_DATA_WIDTH = 32
)(
    input logic clk_i,
    input logic rst_ni,
    input logic penable_i,
    input logic psel_i,
    input logic pwrite_i,
    input logic [APB_ADDR_WIDTH-1:0] paddr_i,
    input logic [APB_DATA_WIDTH-1:0] pwdata_i,
    output logic [APB_DATA_WIDTH-1:0] prdata_o,
    output logic pready_o,
    output logic pslverr_o
);

    assign pslverr_o = '0;
    assign pready_o = '1;
    assign prdata_o = '0;

    logic control;

    function automatic void uart_tx(byte ch);
        $write("%c", ch);
    endfunction : uart_tx

    always_ff @(posedge clk_i or negedge rst_ni) begin
        if (!rst_ni) begin
            control <= 1'b1;
        end else begin
            if (psel_i & penable_i & pwrite_i & (paddr_i == `UART_ADDR) & control) begin
                uart_tx(byte'(pwdata_i[7:0]));
                control <= 1'b0;
            end
            if (!psel_i && !penable_i) begin
                control <= 1'b1;
            end
        end
    end
endmodule
