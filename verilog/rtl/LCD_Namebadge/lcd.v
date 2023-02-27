
module lcd(input CLK, input RST, input EF0, input EF1, input EF2, output RS, output reg E, output D4, output D5, output D6, output D7, output LED0, output LED1);
    wire [6:0] rom_addr;
    reg[6:0] s_ROM;
        always @(*)
        begin
            case (rom_addr)
            0 : s_ROM = 7'h33;
            1 : s_ROM = 7'h3c;
            2 : s_ROM = 7'h20;
            3 : s_ROM = 7'h33;
            4 : s_ROM = 7'h3c;
            5 : s_ROM = 7'h20;
            6 : s_ROM = 7'h33;
            7 : s_ROM = 7'h3c;
            8 : s_ROM = 7'h74;
            9 : s_ROM = 7'h75;
            10 : s_ROM = 7'h6f;
            11 : s_ROM = 7'h65;
            12 : s_ROM = 7'h70;
            13 : s_ROM = 7'h61;
            14 : s_ROM = 7'h54;
            15 : s_ROM = 7'h79;
            16 : s_ROM = 7'h6e;
            17 : s_ROM = 7'h69;
            18 : s_ROM = 7'h54;
            19 : s_ROM = 7'h20;
            20 : s_ROM = 7'h64;
            21 : s_ROM = 7'h6e;
            22 : s_ROM = 7'h61;
            23 : s_ROM = 7'h20;
            24 : s_ROM = 7'h6e;
            25 : s_ROM = 7'h6e;
            26 : s_ROM = 7'h65;
            27 : s_ROM = 7'h56;
            28 : s_ROM = 7'h20;
            29 : s_ROM = 7'h20;
            30 : s_ROM = 7'h74;
            31 : s_ROM = 7'h74;
            32 : s_ROM = 7'h61;
            33 : s_ROM = 7'h4d;
            34 : s_ROM = 7'h20;
            35 : s_ROM = 7'h6f;
            36 : s_ROM = 7'h74;
            37 : s_ROM = 7'h20;
            38 : s_ROM = 7'h73;
            39 : s_ROM = 7'h6b;
            40 : s_ROM = 7'h6e;
            41 : s_ROM = 7'h61;
            42 : s_ROM = 7'h68;
            43 : s_ROM = 7'h74;
            44 : s_ROM = 7'h20;
            45 : s_ROM = 7'h67;
            46 : s_ROM = 7'h69;
            47 : s_ROM = 7'h42;
            48 : s_ROM = 7'h72;
            49 : s_ROM = 7'h65;
            50 : s_ROM = 7'h6b;
            51 : s_ROM = 7'h61;
            52 : s_ROM = 7'h4d;
            53 : s_ROM = 7'h20;
            54 : s_ROM = 7'h64;
            55 : s_ROM = 7'h6c;
            56 : s_ROM = 7'h72;
            57 : s_ROM = 7'h6f;
            58 : s_ROM = 7'h57;
            59 : s_ROM = 7'h20;
            60 : s_ROM = 7'h43;
            61 : s_ROM = 7'h52;
            62 : s_ROM = 7'h56;
            63 : s_ROM = 7'h76;
            64 : s_ROM = 7'h65;
            65 : s_ROM = 7'h44;
            66 : s_ROM = 7'h20;
            67 : s_ROM = 7'h65;
            68 : s_ROM = 7'h72;
            69 : s_ROM = 7'h61;
            70 : s_ROM = 7'h77;
            71 : s_ROM = 7'h64;
            72 : s_ROM = 7'h72;
            73 : s_ROM = 7'h61;
            74 : s_ROM = 7'h48;
            75 : s_ROM = 7'h76;
            76 : s_ROM = 7'h65;
            77 : s_ROM = 7'h44;
            78 : s_ROM = 7'h20;
            79 : s_ROM = 7'h65;
            80 : s_ROM = 7'h72;
            81 : s_ROM = 7'h61;
            82 : s_ROM = 7'h77;
            83 : s_ROM = 7'h74;
            84 : s_ROM = 7'h66;
            85 : s_ROM = 7'h6f;
            86 : s_ROM = 7'h53;
            87 : s_ROM = 7'h69;
            88 : s_ROM = 7'h6c;
            89 : s_ROM = 7'h61;
            90 : s_ROM = 7'h76;
            91 : s_ROM = 7'h41;
            92 : s_ROM = 7'h76;
            93 : s_ROM = 7'h65;
            94 : s_ROM = 7'h64;
            95 : s_ROM = 7'h2e;
            96 : s_ROM = 7'h6e;
            97 : s_ROM = 7'h69;
            98 : s_ROM = 7'h6c;
            99 : s_ROM = 7'h6f;
            100 : s_ROM = 7'h68;
            101 : s_ROM = 7'h74;
            102 : s_ROM = 7'h2e;
            103 : s_ROM = 7'h77;
            104 : s_ROM = 7'h77;
            105 : s_ROM = 7'h77;
            106 : s_ROM = 7'h33;
            107 : s_ROM = 7'h3a;
            108 : s_ROM = 7'h20;
            109 : s_ROM = 7'h6e;
            110 : s_ROM = 7'h69;
            111 : s_ROM = 7'h6c;
            112 : s_ROM = 7'h6f;
            113 : s_ROM = 7'h68;
            114 : s_ROM = 7'h54;
            115 : s_ROM = 7'h20;
            116 : s_ROM = 7'h6d;
            117 : s_ROM = 7'h27;
            118 : s_ROM = 7'h49;
            119 : s_ROM = 7'h20;
            120 : s_ROM = 7'h2c;
            121 : s_ROM = 7'h69;
            122 : s_ROM = 7'h48;
            123 : s_ROM = 7'h20;
            default : s_ROM = 7'h3F;
        endcase
    end
    assign rom_addr = str_seq;

    reg toggle;
    reg [7:0] seq;
    reg [6:0] str_seq;
    reg [4:0] data;
    reg [1:0] round;
    reg [1:0] num_state;

    assign LED0 = str_seq[2];
    assign LED1 = data[0];
    assign {RS, D7, D6, D5, D4} = data;
    //wire [1:0] num_state = (EF0 + EF1) | EF2;

    always @(posedge CLK) begin
        num_state <= EF0 + EF1 + EF2;
        toggle <= !toggle & !RST;
        if (toggle) begin
            seq <= seq + 1'b1;
            E <= 1'b0;
            if (seq > 5) begin
                if (round == 2) begin
                    if(seq <= 45) begin
                        data <= (1 << 4) | ((seq & 1) ? s_ROM[3:0] : s_ROM[6:4]);
                        str_seq <= str_seq - (seq & 1);
                    end else if(seq <= 49) begin
                        data <= (seq & 1) ? 5'b00000 : 5'b01100;
                    end else if(seq <= 105) begin
                        data <= (1 << 4) | ((seq & 1) ? s_ROM[3:0] : s_ROM[6:4]);
                        str_seq <= str_seq - (seq & 1);
                    end else if(seq == 192) begin
                        seq <= 254;
                    end else begin
                        data <= 5'b00011;
                        str_seq <= 123;
                    end
                end else if (round == 1) begin
                    if (seq <= 15) begin
                        data <= (1 << 4) | ((seq & 1) ? s_ROM[3:0] : s_ROM[6:4]);
                        str_seq <= str_seq - (seq & 1);
                    end else if(seq <= 43) begin
                        data <= 5'b00000;
                    end else if(seq <= 47) begin
                        data <= (seq & 1) ? 5'b01000 : 5'b01001;
                    end else if(seq <= 71) begin
                        data <= (1 << 4) | ((seq & 1) ? s_ROM[3:0] : s_ROM[6:4]);
                        str_seq <= str_seq - (seq & 1);
                    end else if(seq <= 99) begin
                        data <= 5'b00000;
                    end else if(seq <= 103) begin
                        data <= (seq & 1) ? 5'b00100 : 5'b01100;
                    end else if(seq <= 127) begin
                        data <= (1 << 4) | ((seq & 1) ? s_ROM[3:0] : s_ROM[6:4]);
                        str_seq <= str_seq - (seq & 1);
                    end else if(seq <= 155) begin
                        data <= 5'b00000;
                    end else if(seq <= 159) begin
                        data <= (seq & 1) ? 5'b00110 : 5'b01001;
                    end else if(seq <= 189) begin
                        data <= (1 << 4) | ((seq & 1) ? s_ROM[3:0] : s_ROM[6:4]);
                        str_seq <= str_seq - (seq & 1);
                    end else begin
                        data <= 5'b00011;
                    end
                end else begin
                    if (seq <= 41) begin
                        data <= (1 << 4) | ((seq & 1) ? s_ROM[3:0] : s_ROM[6:4]);
                        str_seq <= str_seq - (seq & 1);
                    end else if (seq <= 63) begin
                        data <= (seq & 1) ? 5'b00100 : 5'b01101;
                    end else if (seq <= 91) begin
                        data <= (1 << 4) | ((seq & 1) ? s_ROM[3:0] : s_ROM[6:4]);
                        str_seq <= str_seq - (seq & 1);
                    end else if (seq <= 97) begin
                        data <= (1 << 4) | ((seq & 1) ? 0 : 2);
                    end else if (seq <= 101) begin
                        data <= (1 << 4) | ((seq & 1) ? ( (seq & 2) ? num_state[0] : num_state[1] ) : 3);
                    end else begin
                        data <= 5'b00011;
                    end
                end
                if (seq == 255) begin
                    round <= round + 1;
                end
            end else
                if (round == 1) begin
                    case(seq)
                        // Switch to 4 bit mode
                        0 : data <= 5'b00011;
                        1 : data <= 5'b00010;

                        // Display on
                        2 : data <= 5'b00000;
                        3 : data <= 5'b01111;

                        // Put cursor on line 2
                        4 : data <= 5'b01100;
                        5 : data <= 5'b00111;
                    endcase
                end else begin
                    if (round == 3) round <= 0;
                    case(seq)
                        // Switch to 4 bit mode
                        0 : data <= 5'b00011;
                        1 : data <= 5'b00010;

                        // Display on
                        2 : data <= 5'b00000;
                        3 : data <= 5'b01111;

                        // Clear display
                        4 : data <= 5'b00000;
                        5 : data <= 5'b00001;
                    endcase
                end
            end
        else begin
            E <= !RST;

            if (RST) begin
                round <= 0;
                seq <= 0;
                str_seq <= 123;
                data <= 0;
            end
        end
    end
endmodule
