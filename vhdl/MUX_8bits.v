/////////////////////////////////////////////////////////
// author: Andrei Militaru 
// date: 11th of April 2019 
// Script automatically generated by https://git.ee.ethz.ch/andreimi/boltzmann_redpitaya/tree/master/python_scripts/write_argv_MUX.py
/////////////////////////////////////////////////////////
module MUX_8bits (
	input wire [15:0] data0_i,
	input wire [15:0] data1_i,
	input wire [15:0] data2_i,
	input wire [15:0] data3_i,
	input wire [15:0] data4_i,
	input wire [15:0] data5_i,
	input wire [15:0] data6_i,
	input wire [15:0] data7_i,
	input wire [15:0] data8_i,
	input wire [15:0] data9_i,
	input wire [15:0] data10_i,
	input wire [15:0] data11_i,
	input wire [15:0] data12_i,
	input wire [15:0] data13_i,
	input wire [15:0] data14_i,
	input wire [15:0] data15_i,
	input wire [15:0] data16_i,
	input wire [15:0] data17_i,
	input wire [15:0] data18_i,
	input wire [15:0] data19_i,
	input wire [15:0] data20_i,
	input wire [15:0] data21_i,
	input wire [15:0] data22_i,
	input wire [15:0] data23_i,
	input wire [15:0] data24_i,
	input wire [15:0] data25_i,
	input wire [15:0] data26_i,
	input wire [15:0] data27_i,
	input wire [15:0] data28_i,
	input wire [15:0] data29_i,
	input wire [15:0] data30_i,
	input wire [15:0] data31_i,
	input wire [15:0] data32_i,
	input wire [15:0] data33_i,
	input wire [15:0] data34_i,
	input wire [15:0] data35_i,
	input wire [15:0] data36_i,
	input wire [15:0] data37_i,
	input wire [15:0] data38_i,
	input wire [15:0] data39_i,
	input wire [15:0] data40_i,
	input wire [15:0] data41_i,
	input wire [15:0] data42_i,
	input wire [15:0] data43_i,
	input wire [15:0] data44_i,
	input wire [15:0] data45_i,
	input wire [15:0] data46_i,
	input wire [15:0] data47_i,
	input wire [15:0] data48_i,
	input wire [15:0] data49_i,
	input wire [15:0] data50_i,
	input wire [15:0] data51_i,
	input wire [15:0] data52_i,
	input wire [15:0] data53_i,
	input wire [15:0] data54_i,
	input wire [15:0] data55_i,
	input wire [15:0] data56_i,
	input wire [15:0] data57_i,
	input wire [15:0] data58_i,
	input wire [15:0] data59_i,
	input wire [15:0] data60_i,
	input wire [15:0] data61_i,
	input wire [15:0] data62_i,
	input wire [15:0] data63_i,
	input wire [15:0] data64_i,
	input wire [15:0] data65_i,
	input wire [15:0] data66_i,
	input wire [15:0] data67_i,
	input wire [15:0] data68_i,
	input wire [15:0] data69_i,
	input wire [15:0] data70_i,
	input wire [15:0] data71_i,
	input wire [15:0] data72_i,
	input wire [15:0] data73_i,
	input wire [15:0] data74_i,
	input wire [15:0] data75_i,
	input wire [15:0] data76_i,
	input wire [15:0] data77_i,
	input wire [15:0] data78_i,
	input wire [15:0] data79_i,
	input wire [15:0] data80_i,
	input wire [15:0] data81_i,
	input wire [15:0] data82_i,
	input wire [15:0] data83_i,
	input wire [15:0] data84_i,
	input wire [15:0] data85_i,
	input wire [15:0] data86_i,
	input wire [15:0] data87_i,
	input wire [15:0] data88_i,
	input wire [15:0] data89_i,
	input wire [15:0] data90_i,
	input wire [15:0] data91_i,
	input wire [15:0] data92_i,
	input wire [15:0] data93_i,
	input wire [15:0] data94_i,
	input wire [15:0] data95_i,
	input wire [15:0] data96_i,
	input wire [15:0] data97_i,
	input wire [15:0] data98_i,
	input wire [15:0] data99_i,
	input wire [15:0] data100_i,
	input wire [15:0] data101_i,
	input wire [15:0] data102_i,
	input wire [15:0] data103_i,
	input wire [15:0] data104_i,
	input wire [15:0] data105_i,
	input wire [15:0] data106_i,
	input wire [15:0] data107_i,
	input wire [15:0] data108_i,
	input wire [15:0] data109_i,
	input wire [15:0] data110_i,
	input wire [15:0] data111_i,
	input wire [15:0] data112_i,
	input wire [15:0] data113_i,
	input wire [15:0] data114_i,
	input wire [15:0] data115_i,
	input wire [15:0] data116_i,
	input wire [15:0] data117_i,
	input wire [15:0] data118_i,
	input wire [15:0] data119_i,
	input wire [15:0] data120_i,
	input wire [15:0] data121_i,
	input wire [15:0] data122_i,
	input wire [15:0] data123_i,
	input wire [15:0] data124_i,
	input wire [15:0] data125_i,
	input wire [15:0] data126_i,
	input wire [15:0] data127_i,
	input wire [15:0] data128_i,
	input wire [15:0] data129_i,
	input wire [15:0] data130_i,
	input wire [15:0] data131_i,
	input wire [15:0] data132_i,
	input wire [15:0] data133_i,
	input wire [15:0] data134_i,
	input wire [15:0] data135_i,
	input wire [15:0] data136_i,
	input wire [15:0] data137_i,
	input wire [15:0] data138_i,
	input wire [15:0] data139_i,
	input wire [15:0] data140_i,
	input wire [15:0] data141_i,
	input wire [15:0] data142_i,
	input wire [15:0] data143_i,
	input wire [15:0] data144_i,
	input wire [15:0] data145_i,
	input wire [15:0] data146_i,
	input wire [15:0] data147_i,
	input wire [15:0] data148_i,
	input wire [15:0] data149_i,
	input wire [15:0] data150_i,
	input wire [15:0] data151_i,
	input wire [15:0] data152_i,
	input wire [15:0] data153_i,
	input wire [15:0] data154_i,
	input wire [15:0] data155_i,
	input wire [15:0] data156_i,
	input wire [15:0] data157_i,
	input wire [15:0] data158_i,
	input wire [15:0] data159_i,
	input wire [15:0] data160_i,
	input wire [15:0] data161_i,
	input wire [15:0] data162_i,
	input wire [15:0] data163_i,
	input wire [15:0] data164_i,
	input wire [15:0] data165_i,
	input wire [15:0] data166_i,
	input wire [15:0] data167_i,
	input wire [15:0] data168_i,
	input wire [15:0] data169_i,
	input wire [15:0] data170_i,
	input wire [15:0] data171_i,
	input wire [15:0] data172_i,
	input wire [15:0] data173_i,
	input wire [15:0] data174_i,
	input wire [15:0] data175_i,
	input wire [15:0] data176_i,
	input wire [15:0] data177_i,
	input wire [15:0] data178_i,
	input wire [15:0] data179_i,
	input wire [15:0] data180_i,
	input wire [15:0] data181_i,
	input wire [15:0] data182_i,
	input wire [15:0] data183_i,
	input wire [15:0] data184_i,
	input wire [15:0] data185_i,
	input wire [15:0] data186_i,
	input wire [15:0] data187_i,
	input wire [15:0] data188_i,
	input wire [15:0] data189_i,
	input wire [15:0] data190_i,
	input wire [15:0] data191_i,
	input wire [15:0] data192_i,
	input wire [15:0] data193_i,
	input wire [15:0] data194_i,
	input wire [15:0] data195_i,
	input wire [15:0] data196_i,
	input wire [15:0] data197_i,
	input wire [15:0] data198_i,
	input wire [15:0] data199_i,
	input wire [15:0] data200_i,
	input wire [15:0] data201_i,
	input wire [15:0] data202_i,
	input wire [15:0] data203_i,
	input wire [15:0] data204_i,
	input wire [15:0] data205_i,
	input wire [15:0] data206_i,
	input wire [15:0] data207_i,
	input wire [15:0] data208_i,
	input wire [15:0] data209_i,
	input wire [15:0] data210_i,
	input wire [15:0] data211_i,
	input wire [15:0] data212_i,
	input wire [15:0] data213_i,
	input wire [15:0] data214_i,
	input wire [15:0] data215_i,
	input wire [15:0] data216_i,
	input wire [15:0] data217_i,
	input wire [15:0] data218_i,
	input wire [15:0] data219_i,
	input wire [15:0] data220_i,
	input wire [15:0] data221_i,
	input wire [15:0] data222_i,
	input wire [15:0] data223_i,
	input wire [15:0] data224_i,
	input wire [15:0] data225_i,
	input wire [15:0] data226_i,
	input wire [15:0] data227_i,
	input wire [15:0] data228_i,
	input wire [15:0] data229_i,
	input wire [15:0] data230_i,
	input wire [15:0] data231_i,
	input wire [15:0] data232_i,
	input wire [15:0] data233_i,
	input wire [15:0] data234_i,
	input wire [15:0] data235_i,
	input wire [15:0] data236_i,
	input wire [15:0] data237_i,
	input wire [15:0] data238_i,
	input wire [15:0] data239_i,
	input wire [15:0] data240_i,
	input wire [15:0] data241_i,
	input wire [15:0] data242_i,
	input wire [15:0] data243_i,
	input wire [15:0] data244_i,
	input wire [15:0] data245_i,
	input wire [15:0] data246_i,
	input wire [15:0] data247_i,
	input wire [15:0] data248_i,
	input wire [15:0] data249_i,
	input wire [15:0] data250_i,
	input wire [15:0] data251_i,
	input wire [15:0] data252_i,
	input wire [15:0] data253_i,
	input wire [15:0] data254_i,
	input wire [15:0] data255_i,
	input wire [7:0] sel_i,
	input wire clk_i,
	input wire rst_i,
	output wire [15:0] data_o
	);

	reg [15:0] data_q;
	assign data_o = data_q;

	always @(posedge clk_i) begin		// internal flip flop
		if (rst_i) begin
			data_q <= 16'd0;
		end else begin
			case(sel_i)
				8'd0: data_q <= data0_i;
				8'd1: data_q <= data1_i;
				8'd2: data_q <= data2_i;
				8'd3: data_q <= data3_i;
				8'd4: data_q <= data4_i;
				8'd5: data_q <= data5_i;
				8'd6: data_q <= data6_i;
				8'd7: data_q <= data7_i;
				8'd8: data_q <= data8_i;
				8'd9: data_q <= data9_i;
				8'd10: data_q <= data10_i;
				8'd11: data_q <= data11_i;
				8'd12: data_q <= data12_i;
				8'd13: data_q <= data13_i;
				8'd14: data_q <= data14_i;
				8'd15: data_q <= data15_i;
				8'd16: data_q <= data16_i;
				8'd17: data_q <= data17_i;
				8'd18: data_q <= data18_i;
				8'd19: data_q <= data19_i;
				8'd20: data_q <= data20_i;
				8'd21: data_q <= data21_i;
				8'd22: data_q <= data22_i;
				8'd23: data_q <= data23_i;
				8'd24: data_q <= data24_i;
				8'd25: data_q <= data25_i;
				8'd26: data_q <= data26_i;
				8'd27: data_q <= data27_i;
				8'd28: data_q <= data28_i;
				8'd29: data_q <= data29_i;
				8'd30: data_q <= data30_i;
				8'd31: data_q <= data31_i;
				8'd32: data_q <= data32_i;
				8'd33: data_q <= data33_i;
				8'd34: data_q <= data34_i;
				8'd35: data_q <= data35_i;
				8'd36: data_q <= data36_i;
				8'd37: data_q <= data37_i;
				8'd38: data_q <= data38_i;
				8'd39: data_q <= data39_i;
				8'd40: data_q <= data40_i;
				8'd41: data_q <= data41_i;
				8'd42: data_q <= data42_i;
				8'd43: data_q <= data43_i;
				8'd44: data_q <= data44_i;
				8'd45: data_q <= data45_i;
				8'd46: data_q <= data46_i;
				8'd47: data_q <= data47_i;
				8'd48: data_q <= data48_i;
				8'd49: data_q <= data49_i;
				8'd50: data_q <= data50_i;
				8'd51: data_q <= data51_i;
				8'd52: data_q <= data52_i;
				8'd53: data_q <= data53_i;
				8'd54: data_q <= data54_i;
				8'd55: data_q <= data55_i;
				8'd56: data_q <= data56_i;
				8'd57: data_q <= data57_i;
				8'd58: data_q <= data58_i;
				8'd59: data_q <= data59_i;
				8'd60: data_q <= data60_i;
				8'd61: data_q <= data61_i;
				8'd62: data_q <= data62_i;
				8'd63: data_q <= data63_i;
				8'd64: data_q <= data64_i;
				8'd65: data_q <= data65_i;
				8'd66: data_q <= data66_i;
				8'd67: data_q <= data67_i;
				8'd68: data_q <= data68_i;
				8'd69: data_q <= data69_i;
				8'd70: data_q <= data70_i;
				8'd71: data_q <= data71_i;
				8'd72: data_q <= data72_i;
				8'd73: data_q <= data73_i;
				8'd74: data_q <= data74_i;
				8'd75: data_q <= data75_i;
				8'd76: data_q <= data76_i;
				8'd77: data_q <= data77_i;
				8'd78: data_q <= data78_i;
				8'd79: data_q <= data79_i;
				8'd80: data_q <= data80_i;
				8'd81: data_q <= data81_i;
				8'd82: data_q <= data82_i;
				8'd83: data_q <= data83_i;
				8'd84: data_q <= data84_i;
				8'd85: data_q <= data85_i;
				8'd86: data_q <= data86_i;
				8'd87: data_q <= data87_i;
				8'd88: data_q <= data88_i;
				8'd89: data_q <= data89_i;
				8'd90: data_q <= data90_i;
				8'd91: data_q <= data91_i;
				8'd92: data_q <= data92_i;
				8'd93: data_q <= data93_i;
				8'd94: data_q <= data94_i;
				8'd95: data_q <= data95_i;
				8'd96: data_q <= data96_i;
				8'd97: data_q <= data97_i;
				8'd98: data_q <= data98_i;
				8'd99: data_q <= data99_i;
				8'd100: data_q <= data100_i;
				8'd101: data_q <= data101_i;
				8'd102: data_q <= data102_i;
				8'd103: data_q <= data103_i;
				8'd104: data_q <= data104_i;
				8'd105: data_q <= data105_i;
				8'd106: data_q <= data106_i;
				8'd107: data_q <= data107_i;
				8'd108: data_q <= data108_i;
				8'd109: data_q <= data109_i;
				8'd110: data_q <= data110_i;
				8'd111: data_q <= data111_i;
				8'd112: data_q <= data112_i;
				8'd113: data_q <= data113_i;
				8'd114: data_q <= data114_i;
				8'd115: data_q <= data115_i;
				8'd116: data_q <= data116_i;
				8'd117: data_q <= data117_i;
				8'd118: data_q <= data118_i;
				8'd119: data_q <= data119_i;
				8'd120: data_q <= data120_i;
				8'd121: data_q <= data121_i;
				8'd122: data_q <= data122_i;
				8'd123: data_q <= data123_i;
				8'd124: data_q <= data124_i;
				8'd125: data_q <= data125_i;
				8'd126: data_q <= data126_i;
				8'd127: data_q <= data127_i;
				8'd128: data_q <= data128_i;
				8'd129: data_q <= data129_i;
				8'd130: data_q <= data130_i;
				8'd131: data_q <= data131_i;
				8'd132: data_q <= data132_i;
				8'd133: data_q <= data133_i;
				8'd134: data_q <= data134_i;
				8'd135: data_q <= data135_i;
				8'd136: data_q <= data136_i;
				8'd137: data_q <= data137_i;
				8'd138: data_q <= data138_i;
				8'd139: data_q <= data139_i;
				8'd140: data_q <= data140_i;
				8'd141: data_q <= data141_i;
				8'd142: data_q <= data142_i;
				8'd143: data_q <= data143_i;
				8'd144: data_q <= data144_i;
				8'd145: data_q <= data145_i;
				8'd146: data_q <= data146_i;
				8'd147: data_q <= data147_i;
				8'd148: data_q <= data148_i;
				8'd149: data_q <= data149_i;
				8'd150: data_q <= data150_i;
				8'd151: data_q <= data151_i;
				8'd152: data_q <= data152_i;
				8'd153: data_q <= data153_i;
				8'd154: data_q <= data154_i;
				8'd155: data_q <= data155_i;
				8'd156: data_q <= data156_i;
				8'd157: data_q <= data157_i;
				8'd158: data_q <= data158_i;
				8'd159: data_q <= data159_i;
				8'd160: data_q <= data160_i;
				8'd161: data_q <= data161_i;
				8'd162: data_q <= data162_i;
				8'd163: data_q <= data163_i;
				8'd164: data_q <= data164_i;
				8'd165: data_q <= data165_i;
				8'd166: data_q <= data166_i;
				8'd167: data_q <= data167_i;
				8'd168: data_q <= data168_i;
				8'd169: data_q <= data169_i;
				8'd170: data_q <= data170_i;
				8'd171: data_q <= data171_i;
				8'd172: data_q <= data172_i;
				8'd173: data_q <= data173_i;
				8'd174: data_q <= data174_i;
				8'd175: data_q <= data175_i;
				8'd176: data_q <= data176_i;
				8'd177: data_q <= data177_i;
				8'd178: data_q <= data178_i;
				8'd179: data_q <= data179_i;
				8'd180: data_q <= data180_i;
				8'd181: data_q <= data181_i;
				8'd182: data_q <= data182_i;
				8'd183: data_q <= data183_i;
				8'd184: data_q <= data184_i;
				8'd185: data_q <= data185_i;
				8'd186: data_q <= data186_i;
				8'd187: data_q <= data187_i;
				8'd188: data_q <= data188_i;
				8'd189: data_q <= data189_i;
				8'd190: data_q <= data190_i;
				8'd191: data_q <= data191_i;
				8'd192: data_q <= data192_i;
				8'd193: data_q <= data193_i;
				8'd194: data_q <= data194_i;
				8'd195: data_q <= data195_i;
				8'd196: data_q <= data196_i;
				8'd197: data_q <= data197_i;
				8'd198: data_q <= data198_i;
				8'd199: data_q <= data199_i;
				8'd200: data_q <= data200_i;
				8'd201: data_q <= data201_i;
				8'd202: data_q <= data202_i;
				8'd203: data_q <= data203_i;
				8'd204: data_q <= data204_i;
				8'd205: data_q <= data205_i;
				8'd206: data_q <= data206_i;
				8'd207: data_q <= data207_i;
				8'd208: data_q <= data208_i;
				8'd209: data_q <= data209_i;
				8'd210: data_q <= data210_i;
				8'd211: data_q <= data211_i;
				8'd212: data_q <= data212_i;
				8'd213: data_q <= data213_i;
				8'd214: data_q <= data214_i;
				8'd215: data_q <= data215_i;
				8'd216: data_q <= data216_i;
				8'd217: data_q <= data217_i;
				8'd218: data_q <= data218_i;
				8'd219: data_q <= data219_i;
				8'd220: data_q <= data220_i;
				8'd221: data_q <= data221_i;
				8'd222: data_q <= data222_i;
				8'd223: data_q <= data223_i;
				8'd224: data_q <= data224_i;
				8'd225: data_q <= data225_i;
				8'd226: data_q <= data226_i;
				8'd227: data_q <= data227_i;
				8'd228: data_q <= data228_i;
				8'd229: data_q <= data229_i;
				8'd230: data_q <= data230_i;
				8'd231: data_q <= data231_i;
				8'd232: data_q <= data232_i;
				8'd233: data_q <= data233_i;
				8'd234: data_q <= data234_i;
				8'd235: data_q <= data235_i;
				8'd236: data_q <= data236_i;
				8'd237: data_q <= data237_i;
				8'd238: data_q <= data238_i;
				8'd239: data_q <= data239_i;
				8'd240: data_q <= data240_i;
				8'd241: data_q <= data241_i;
				8'd242: data_q <= data242_i;
				8'd243: data_q <= data243_i;
				8'd244: data_q <= data244_i;
				8'd245: data_q <= data245_i;
				8'd246: data_q <= data246_i;
				8'd247: data_q <= data247_i;
				8'd248: data_q <= data248_i;
				8'd249: data_q <= data249_i;
				8'd250: data_q <= data250_i;
				8'd251: data_q <= data251_i;
				8'd252: data_q <= data252_i;
				8'd253: data_q <= data253_i;
				8'd254: data_q <= data254_i;
				8'd255: data_q <= data255_i;
				default: data_d = 16'd0;
			endcase
		end
	end

	end
endmodule
