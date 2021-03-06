/////////////////////////////////////////////////////////
// author: Andrei Militaru 
// date: 21st of May 2019 
// Script automatically generated by https://git.ee.ethz.ch/andreimi/boltzmann_redpitaya/tree/master/python_scripts/write_argv_delay_module.py
/////////////////////////////////////////////////////////

module delay_max512clocks (
	input wire [0:0] data_i,
	input wire [8:0] sel_i,
	input wire clk_i,
	input wire rst_i,
	output wire [0:0] data_o
	);

	wire [0:0] data0;
	wire [0:0] data1;
	wire [0:0] data2;
	wire [0:0] data3;
	wire [0:0] data4;
	wire [0:0] data5;
	wire [0:0] data6;
	wire [0:0] data7;
	wire [0:0] data8;
	wire [0:0] data9;
	wire [0:0] data10;
	wire [0:0] data11;
	wire [0:0] data12;
	wire [0:0] data13;
	wire [0:0] data14;
	wire [0:0] data15;
	wire [0:0] data16;
	wire [0:0] data17;
	wire [0:0] data18;
	wire [0:0] data19;
	wire [0:0] data20;
	wire [0:0] data21;
	wire [0:0] data22;
	wire [0:0] data23;
	wire [0:0] data24;
	wire [0:0] data25;
	wire [0:0] data26;
	wire [0:0] data27;
	wire [0:0] data28;
	wire [0:0] data29;
	wire [0:0] data30;
	wire [0:0] data31;
	wire [0:0] data32;
	wire [0:0] data33;
	wire [0:0] data34;
	wire [0:0] data35;
	wire [0:0] data36;
	wire [0:0] data37;
	wire [0:0] data38;
	wire [0:0] data39;
	wire [0:0] data40;
	wire [0:0] data41;
	wire [0:0] data42;
	wire [0:0] data43;
	wire [0:0] data44;
	wire [0:0] data45;
	wire [0:0] data46;
	wire [0:0] data47;
	wire [0:0] data48;
	wire [0:0] data49;
	wire [0:0] data50;
	wire [0:0] data51;
	wire [0:0] data52;
	wire [0:0] data53;
	wire [0:0] data54;
	wire [0:0] data55;
	wire [0:0] data56;
	wire [0:0] data57;
	wire [0:0] data58;
	wire [0:0] data59;
	wire [0:0] data60;
	wire [0:0] data61;
	wire [0:0] data62;
	wire [0:0] data63;
	wire [0:0] data64;
	wire [0:0] data65;
	wire [0:0] data66;
	wire [0:0] data67;
	wire [0:0] data68;
	wire [0:0] data69;
	wire [0:0] data70;
	wire [0:0] data71;
	wire [0:0] data72;
	wire [0:0] data73;
	wire [0:0] data74;
	wire [0:0] data75;
	wire [0:0] data76;
	wire [0:0] data77;
	wire [0:0] data78;
	wire [0:0] data79;
	wire [0:0] data80;
	wire [0:0] data81;
	wire [0:0] data82;
	wire [0:0] data83;
	wire [0:0] data84;
	wire [0:0] data85;
	wire [0:0] data86;
	wire [0:0] data87;
	wire [0:0] data88;
	wire [0:0] data89;
	wire [0:0] data90;
	wire [0:0] data91;
	wire [0:0] data92;
	wire [0:0] data93;
	wire [0:0] data94;
	wire [0:0] data95;
	wire [0:0] data96;
	wire [0:0] data97;
	wire [0:0] data98;
	wire [0:0] data99;
	wire [0:0] data100;
	wire [0:0] data101;
	wire [0:0] data102;
	wire [0:0] data103;
	wire [0:0] data104;
	wire [0:0] data105;
	wire [0:0] data106;
	wire [0:0] data107;
	wire [0:0] data108;
	wire [0:0] data109;
	wire [0:0] data110;
	wire [0:0] data111;
	wire [0:0] data112;
	wire [0:0] data113;
	wire [0:0] data114;
	wire [0:0] data115;
	wire [0:0] data116;
	wire [0:0] data117;
	wire [0:0] data118;
	wire [0:0] data119;
	wire [0:0] data120;
	wire [0:0] data121;
	wire [0:0] data122;
	wire [0:0] data123;
	wire [0:0] data124;
	wire [0:0] data125;
	wire [0:0] data126;
	wire [0:0] data127;
	wire [0:0] data128;
	wire [0:0] data129;
	wire [0:0] data130;
	wire [0:0] data131;
	wire [0:0] data132;
	wire [0:0] data133;
	wire [0:0] data134;
	wire [0:0] data135;
	wire [0:0] data136;
	wire [0:0] data137;
	wire [0:0] data138;
	wire [0:0] data139;
	wire [0:0] data140;
	wire [0:0] data141;
	wire [0:0] data142;
	wire [0:0] data143;
	wire [0:0] data144;
	wire [0:0] data145;
	wire [0:0] data146;
	wire [0:0] data147;
	wire [0:0] data148;
	wire [0:0] data149;
	wire [0:0] data150;
	wire [0:0] data151;
	wire [0:0] data152;
	wire [0:0] data153;
	wire [0:0] data154;
	wire [0:0] data155;
	wire [0:0] data156;
	wire [0:0] data157;
	wire [0:0] data158;
	wire [0:0] data159;
	wire [0:0] data160;
	wire [0:0] data161;
	wire [0:0] data162;
	wire [0:0] data163;
	wire [0:0] data164;
	wire [0:0] data165;
	wire [0:0] data166;
	wire [0:0] data167;
	wire [0:0] data168;
	wire [0:0] data169;
	wire [0:0] data170;
	wire [0:0] data171;
	wire [0:0] data172;
	wire [0:0] data173;
	wire [0:0] data174;
	wire [0:0] data175;
	wire [0:0] data176;
	wire [0:0] data177;
	wire [0:0] data178;
	wire [0:0] data179;
	wire [0:0] data180;
	wire [0:0] data181;
	wire [0:0] data182;
	wire [0:0] data183;
	wire [0:0] data184;
	wire [0:0] data185;
	wire [0:0] data186;
	wire [0:0] data187;
	wire [0:0] data188;
	wire [0:0] data189;
	wire [0:0] data190;
	wire [0:0] data191;
	wire [0:0] data192;
	wire [0:0] data193;
	wire [0:0] data194;
	wire [0:0] data195;
	wire [0:0] data196;
	wire [0:0] data197;
	wire [0:0] data198;
	wire [0:0] data199;
	wire [0:0] data200;
	wire [0:0] data201;
	wire [0:0] data202;
	wire [0:0] data203;
	wire [0:0] data204;
	wire [0:0] data205;
	wire [0:0] data206;
	wire [0:0] data207;
	wire [0:0] data208;
	wire [0:0] data209;
	wire [0:0] data210;
	wire [0:0] data211;
	wire [0:0] data212;
	wire [0:0] data213;
	wire [0:0] data214;
	wire [0:0] data215;
	wire [0:0] data216;
	wire [0:0] data217;
	wire [0:0] data218;
	wire [0:0] data219;
	wire [0:0] data220;
	wire [0:0] data221;
	wire [0:0] data222;
	wire [0:0] data223;
	wire [0:0] data224;
	wire [0:0] data225;
	wire [0:0] data226;
	wire [0:0] data227;
	wire [0:0] data228;
	wire [0:0] data229;
	wire [0:0] data230;
	wire [0:0] data231;
	wire [0:0] data232;
	wire [0:0] data233;
	wire [0:0] data234;
	wire [0:0] data235;
	wire [0:0] data236;
	wire [0:0] data237;
	wire [0:0] data238;
	wire [0:0] data239;
	wire [0:0] data240;
	wire [0:0] data241;
	wire [0:0] data242;
	wire [0:0] data243;
	wire [0:0] data244;
	wire [0:0] data245;
	wire [0:0] data246;
	wire [0:0] data247;
	wire [0:0] data248;
	wire [0:0] data249;
	wire [0:0] data250;
	wire [0:0] data251;
	wire [0:0] data252;
	wire [0:0] data253;
	wire [0:0] data254;
	wire [0:0] data255;
	wire [0:0] data256;
	wire [0:0] data257;
	wire [0:0] data258;
	wire [0:0] data259;
	wire [0:0] data260;
	wire [0:0] data261;
	wire [0:0] data262;
	wire [0:0] data263;
	wire [0:0] data264;
	wire [0:0] data265;
	wire [0:0] data266;
	wire [0:0] data267;
	wire [0:0] data268;
	wire [0:0] data269;
	wire [0:0] data270;
	wire [0:0] data271;
	wire [0:0] data272;
	wire [0:0] data273;
	wire [0:0] data274;
	wire [0:0] data275;
	wire [0:0] data276;
	wire [0:0] data277;
	wire [0:0] data278;
	wire [0:0] data279;
	wire [0:0] data280;
	wire [0:0] data281;
	wire [0:0] data282;
	wire [0:0] data283;
	wire [0:0] data284;
	wire [0:0] data285;
	wire [0:0] data286;
	wire [0:0] data287;
	wire [0:0] data288;
	wire [0:0] data289;
	wire [0:0] data290;
	wire [0:0] data291;
	wire [0:0] data292;
	wire [0:0] data293;
	wire [0:0] data294;
	wire [0:0] data295;
	wire [0:0] data296;
	wire [0:0] data297;
	wire [0:0] data298;
	wire [0:0] data299;
	wire [0:0] data300;
	wire [0:0] data301;
	wire [0:0] data302;
	wire [0:0] data303;
	wire [0:0] data304;
	wire [0:0] data305;
	wire [0:0] data306;
	wire [0:0] data307;
	wire [0:0] data308;
	wire [0:0] data309;
	wire [0:0] data310;
	wire [0:0] data311;
	wire [0:0] data312;
	wire [0:0] data313;
	wire [0:0] data314;
	wire [0:0] data315;
	wire [0:0] data316;
	wire [0:0] data317;
	wire [0:0] data318;
	wire [0:0] data319;
	wire [0:0] data320;
	wire [0:0] data321;
	wire [0:0] data322;
	wire [0:0] data323;
	wire [0:0] data324;
	wire [0:0] data325;
	wire [0:0] data326;
	wire [0:0] data327;
	wire [0:0] data328;
	wire [0:0] data329;
	wire [0:0] data330;
	wire [0:0] data331;
	wire [0:0] data332;
	wire [0:0] data333;
	wire [0:0] data334;
	wire [0:0] data335;
	wire [0:0] data336;
	wire [0:0] data337;
	wire [0:0] data338;
	wire [0:0] data339;
	wire [0:0] data340;
	wire [0:0] data341;
	wire [0:0] data342;
	wire [0:0] data343;
	wire [0:0] data344;
	wire [0:0] data345;
	wire [0:0] data346;
	wire [0:0] data347;
	wire [0:0] data348;
	wire [0:0] data349;
	wire [0:0] data350;
	wire [0:0] data351;
	wire [0:0] data352;
	wire [0:0] data353;
	wire [0:0] data354;
	wire [0:0] data355;
	wire [0:0] data356;
	wire [0:0] data357;
	wire [0:0] data358;
	wire [0:0] data359;
	wire [0:0] data360;
	wire [0:0] data361;
	wire [0:0] data362;
	wire [0:0] data363;
	wire [0:0] data364;
	wire [0:0] data365;
	wire [0:0] data366;
	wire [0:0] data367;
	wire [0:0] data368;
	wire [0:0] data369;
	wire [0:0] data370;
	wire [0:0] data371;
	wire [0:0] data372;
	wire [0:0] data373;
	wire [0:0] data374;
	wire [0:0] data375;
	wire [0:0] data376;
	wire [0:0] data377;
	wire [0:0] data378;
	wire [0:0] data379;
	wire [0:0] data380;
	wire [0:0] data381;
	wire [0:0] data382;
	wire [0:0] data383;
	wire [0:0] data384;
	wire [0:0] data385;
	wire [0:0] data386;
	wire [0:0] data387;
	wire [0:0] data388;
	wire [0:0] data389;
	wire [0:0] data390;
	wire [0:0] data391;
	wire [0:0] data392;
	wire [0:0] data393;
	wire [0:0] data394;
	wire [0:0] data395;
	wire [0:0] data396;
	wire [0:0] data397;
	wire [0:0] data398;
	wire [0:0] data399;
	wire [0:0] data400;
	wire [0:0] data401;
	wire [0:0] data402;
	wire [0:0] data403;
	wire [0:0] data404;
	wire [0:0] data405;
	wire [0:0] data406;
	wire [0:0] data407;
	wire [0:0] data408;
	wire [0:0] data409;
	wire [0:0] data410;
	wire [0:0] data411;
	wire [0:0] data412;
	wire [0:0] data413;
	wire [0:0] data414;
	wire [0:0] data415;
	wire [0:0] data416;
	wire [0:0] data417;
	wire [0:0] data418;
	wire [0:0] data419;
	wire [0:0] data420;
	wire [0:0] data421;
	wire [0:0] data422;
	wire [0:0] data423;
	wire [0:0] data424;
	wire [0:0] data425;
	wire [0:0] data426;
	wire [0:0] data427;
	wire [0:0] data428;
	wire [0:0] data429;
	wire [0:0] data430;
	wire [0:0] data431;
	wire [0:0] data432;
	wire [0:0] data433;
	wire [0:0] data434;
	wire [0:0] data435;
	wire [0:0] data436;
	wire [0:0] data437;
	wire [0:0] data438;
	wire [0:0] data439;
	wire [0:0] data440;
	wire [0:0] data441;
	wire [0:0] data442;
	wire [0:0] data443;
	wire [0:0] data444;
	wire [0:0] data445;
	wire [0:0] data446;
	wire [0:0] data447;
	wire [0:0] data448;
	wire [0:0] data449;
	wire [0:0] data450;
	wire [0:0] data451;
	wire [0:0] data452;
	wire [0:0] data453;
	wire [0:0] data454;
	wire [0:0] data455;
	wire [0:0] data456;
	wire [0:0] data457;
	wire [0:0] data458;
	wire [0:0] data459;
	wire [0:0] data460;
	wire [0:0] data461;
	wire [0:0] data462;
	wire [0:0] data463;
	wire [0:0] data464;
	wire [0:0] data465;
	wire [0:0] data466;
	wire [0:0] data467;
	wire [0:0] data468;
	wire [0:0] data469;
	wire [0:0] data470;
	wire [0:0] data471;
	wire [0:0] data472;
	wire [0:0] data473;
	wire [0:0] data474;
	wire [0:0] data475;
	wire [0:0] data476;
	wire [0:0] data477;
	wire [0:0] data478;
	wire [0:0] data479;
	wire [0:0] data480;
	wire [0:0] data481;
	wire [0:0] data482;
	wire [0:0] data483;
	wire [0:0] data484;
	wire [0:0] data485;
	wire [0:0] data486;
	wire [0:0] data487;
	wire [0:0] data488;
	wire [0:0] data489;
	wire [0:0] data490;
	wire [0:0] data491;
	wire [0:0] data492;
	wire [0:0] data493;
	wire [0:0] data494;
	wire [0:0] data495;
	wire [0:0] data496;
	wire [0:0] data497;
	wire [0:0] data498;
	wire [0:0] data499;
	wire [0:0] data500;
	wire [0:0] data501;
	wire [0:0] data502;
	wire [0:0] data503;
	wire [0:0] data504;
	wire [0:0] data505;
	wire [0:0] data506;
	wire [0:0] data507;
	wire [0:0] data508;
	wire [0:0] data509;
	wire [0:0] data510;
	wire [0:0] data511;

	shift_register_512delays shift_register_512delays_i (
				.clk_i(clk_i),
				.rst_i(rst_i),
				.data_i(data_i),
				.data0_o(data0),
				.data1_o(data1),
				.data2_o(data2),
				.data3_o(data3),
				.data4_o(data4),
				.data5_o(data5),
				.data6_o(data6),
				.data7_o(data7),
				.data8_o(data8),
				.data9_o(data9),
				.data10_o(data10),
				.data11_o(data11),
				.data12_o(data12),
				.data13_o(data13),
				.data14_o(data14),
				.data15_o(data15),
				.data16_o(data16),
				.data17_o(data17),
				.data18_o(data18),
				.data19_o(data19),
				.data20_o(data20),
				.data21_o(data21),
				.data22_o(data22),
				.data23_o(data23),
				.data24_o(data24),
				.data25_o(data25),
				.data26_o(data26),
				.data27_o(data27),
				.data28_o(data28),
				.data29_o(data29),
				.data30_o(data30),
				.data31_o(data31),
				.data32_o(data32),
				.data33_o(data33),
				.data34_o(data34),
				.data35_o(data35),
				.data36_o(data36),
				.data37_o(data37),
				.data38_o(data38),
				.data39_o(data39),
				.data40_o(data40),
				.data41_o(data41),
				.data42_o(data42),
				.data43_o(data43),
				.data44_o(data44),
				.data45_o(data45),
				.data46_o(data46),
				.data47_o(data47),
				.data48_o(data48),
				.data49_o(data49),
				.data50_o(data50),
				.data51_o(data51),
				.data52_o(data52),
				.data53_o(data53),
				.data54_o(data54),
				.data55_o(data55),
				.data56_o(data56),
				.data57_o(data57),
				.data58_o(data58),
				.data59_o(data59),
				.data60_o(data60),
				.data61_o(data61),
				.data62_o(data62),
				.data63_o(data63),
				.data64_o(data64),
				.data65_o(data65),
				.data66_o(data66),
				.data67_o(data67),
				.data68_o(data68),
				.data69_o(data69),
				.data70_o(data70),
				.data71_o(data71),
				.data72_o(data72),
				.data73_o(data73),
				.data74_o(data74),
				.data75_o(data75),
				.data76_o(data76),
				.data77_o(data77),
				.data78_o(data78),
				.data79_o(data79),
				.data80_o(data80),
				.data81_o(data81),
				.data82_o(data82),
				.data83_o(data83),
				.data84_o(data84),
				.data85_o(data85),
				.data86_o(data86),
				.data87_o(data87),
				.data88_o(data88),
				.data89_o(data89),
				.data90_o(data90),
				.data91_o(data91),
				.data92_o(data92),
				.data93_o(data93),
				.data94_o(data94),
				.data95_o(data95),
				.data96_o(data96),
				.data97_o(data97),
				.data98_o(data98),
				.data99_o(data99),
				.data100_o(data100),
				.data101_o(data101),
				.data102_o(data102),
				.data103_o(data103),
				.data104_o(data104),
				.data105_o(data105),
				.data106_o(data106),
				.data107_o(data107),
				.data108_o(data108),
				.data109_o(data109),
				.data110_o(data110),
				.data111_o(data111),
				.data112_o(data112),
				.data113_o(data113),
				.data114_o(data114),
				.data115_o(data115),
				.data116_o(data116),
				.data117_o(data117),
				.data118_o(data118),
				.data119_o(data119),
				.data120_o(data120),
				.data121_o(data121),
				.data122_o(data122),
				.data123_o(data123),
				.data124_o(data124),
				.data125_o(data125),
				.data126_o(data126),
				.data127_o(data127),
				.data128_o(data128),
				.data129_o(data129),
				.data130_o(data130),
				.data131_o(data131),
				.data132_o(data132),
				.data133_o(data133),
				.data134_o(data134),
				.data135_o(data135),
				.data136_o(data136),
				.data137_o(data137),
				.data138_o(data138),
				.data139_o(data139),
				.data140_o(data140),
				.data141_o(data141),
				.data142_o(data142),
				.data143_o(data143),
				.data144_o(data144),
				.data145_o(data145),
				.data146_o(data146),
				.data147_o(data147),
				.data148_o(data148),
				.data149_o(data149),
				.data150_o(data150),
				.data151_o(data151),
				.data152_o(data152),
				.data153_o(data153),
				.data154_o(data154),
				.data155_o(data155),
				.data156_o(data156),
				.data157_o(data157),
				.data158_o(data158),
				.data159_o(data159),
				.data160_o(data160),
				.data161_o(data161),
				.data162_o(data162),
				.data163_o(data163),
				.data164_o(data164),
				.data165_o(data165),
				.data166_o(data166),
				.data167_o(data167),
				.data168_o(data168),
				.data169_o(data169),
				.data170_o(data170),
				.data171_o(data171),
				.data172_o(data172),
				.data173_o(data173),
				.data174_o(data174),
				.data175_o(data175),
				.data176_o(data176),
				.data177_o(data177),
				.data178_o(data178),
				.data179_o(data179),
				.data180_o(data180),
				.data181_o(data181),
				.data182_o(data182),
				.data183_o(data183),
				.data184_o(data184),
				.data185_o(data185),
				.data186_o(data186),
				.data187_o(data187),
				.data188_o(data188),
				.data189_o(data189),
				.data190_o(data190),
				.data191_o(data191),
				.data192_o(data192),
				.data193_o(data193),
				.data194_o(data194),
				.data195_o(data195),
				.data196_o(data196),
				.data197_o(data197),
				.data198_o(data198),
				.data199_o(data199),
				.data200_o(data200),
				.data201_o(data201),
				.data202_o(data202),
				.data203_o(data203),
				.data204_o(data204),
				.data205_o(data205),
				.data206_o(data206),
				.data207_o(data207),
				.data208_o(data208),
				.data209_o(data209),
				.data210_o(data210),
				.data211_o(data211),
				.data212_o(data212),
				.data213_o(data213),
				.data214_o(data214),
				.data215_o(data215),
				.data216_o(data216),
				.data217_o(data217),
				.data218_o(data218),
				.data219_o(data219),
				.data220_o(data220),
				.data221_o(data221),
				.data222_o(data222),
				.data223_o(data223),
				.data224_o(data224),
				.data225_o(data225),
				.data226_o(data226),
				.data227_o(data227),
				.data228_o(data228),
				.data229_o(data229),
				.data230_o(data230),
				.data231_o(data231),
				.data232_o(data232),
				.data233_o(data233),
				.data234_o(data234),
				.data235_o(data235),
				.data236_o(data236),
				.data237_o(data237),
				.data238_o(data238),
				.data239_o(data239),
				.data240_o(data240),
				.data241_o(data241),
				.data242_o(data242),
				.data243_o(data243),
				.data244_o(data244),
				.data245_o(data245),
				.data246_o(data246),
				.data247_o(data247),
				.data248_o(data248),
				.data249_o(data249),
				.data250_o(data250),
				.data251_o(data251),
				.data252_o(data252),
				.data253_o(data253),
				.data254_o(data254),
				.data255_o(data255),
				.data256_o(data256),
				.data257_o(data257),
				.data258_o(data258),
				.data259_o(data259),
				.data260_o(data260),
				.data261_o(data261),
				.data262_o(data262),
				.data263_o(data263),
				.data264_o(data264),
				.data265_o(data265),
				.data266_o(data266),
				.data267_o(data267),
				.data268_o(data268),
				.data269_o(data269),
				.data270_o(data270),
				.data271_o(data271),
				.data272_o(data272),
				.data273_o(data273),
				.data274_o(data274),
				.data275_o(data275),
				.data276_o(data276),
				.data277_o(data277),
				.data278_o(data278),
				.data279_o(data279),
				.data280_o(data280),
				.data281_o(data281),
				.data282_o(data282),
				.data283_o(data283),
				.data284_o(data284),
				.data285_o(data285),
				.data286_o(data286),
				.data287_o(data287),
				.data288_o(data288),
				.data289_o(data289),
				.data290_o(data290),
				.data291_o(data291),
				.data292_o(data292),
				.data293_o(data293),
				.data294_o(data294),
				.data295_o(data295),
				.data296_o(data296),
				.data297_o(data297),
				.data298_o(data298),
				.data299_o(data299),
				.data300_o(data300),
				.data301_o(data301),
				.data302_o(data302),
				.data303_o(data303),
				.data304_o(data304),
				.data305_o(data305),
				.data306_o(data306),
				.data307_o(data307),
				.data308_o(data308),
				.data309_o(data309),
				.data310_o(data310),
				.data311_o(data311),
				.data312_o(data312),
				.data313_o(data313),
				.data314_o(data314),
				.data315_o(data315),
				.data316_o(data316),
				.data317_o(data317),
				.data318_o(data318),
				.data319_o(data319),
				.data320_o(data320),
				.data321_o(data321),
				.data322_o(data322),
				.data323_o(data323),
				.data324_o(data324),
				.data325_o(data325),
				.data326_o(data326),
				.data327_o(data327),
				.data328_o(data328),
				.data329_o(data329),
				.data330_o(data330),
				.data331_o(data331),
				.data332_o(data332),
				.data333_o(data333),
				.data334_o(data334),
				.data335_o(data335),
				.data336_o(data336),
				.data337_o(data337),
				.data338_o(data338),
				.data339_o(data339),
				.data340_o(data340),
				.data341_o(data341),
				.data342_o(data342),
				.data343_o(data343),
				.data344_o(data344),
				.data345_o(data345),
				.data346_o(data346),
				.data347_o(data347),
				.data348_o(data348),
				.data349_o(data349),
				.data350_o(data350),
				.data351_o(data351),
				.data352_o(data352),
				.data353_o(data353),
				.data354_o(data354),
				.data355_o(data355),
				.data356_o(data356),
				.data357_o(data357),
				.data358_o(data358),
				.data359_o(data359),
				.data360_o(data360),
				.data361_o(data361),
				.data362_o(data362),
				.data363_o(data363),
				.data364_o(data364),
				.data365_o(data365),
				.data366_o(data366),
				.data367_o(data367),
				.data368_o(data368),
				.data369_o(data369),
				.data370_o(data370),
				.data371_o(data371),
				.data372_o(data372),
				.data373_o(data373),
				.data374_o(data374),
				.data375_o(data375),
				.data376_o(data376),
				.data377_o(data377),
				.data378_o(data378),
				.data379_o(data379),
				.data380_o(data380),
				.data381_o(data381),
				.data382_o(data382),
				.data383_o(data383),
				.data384_o(data384),
				.data385_o(data385),
				.data386_o(data386),
				.data387_o(data387),
				.data388_o(data388),
				.data389_o(data389),
				.data390_o(data390),
				.data391_o(data391),
				.data392_o(data392),
				.data393_o(data393),
				.data394_o(data394),
				.data395_o(data395),
				.data396_o(data396),
				.data397_o(data397),
				.data398_o(data398),
				.data399_o(data399),
				.data400_o(data400),
				.data401_o(data401),
				.data402_o(data402),
				.data403_o(data403),
				.data404_o(data404),
				.data405_o(data405),
				.data406_o(data406),
				.data407_o(data407),
				.data408_o(data408),
				.data409_o(data409),
				.data410_o(data410),
				.data411_o(data411),
				.data412_o(data412),
				.data413_o(data413),
				.data414_o(data414),
				.data415_o(data415),
				.data416_o(data416),
				.data417_o(data417),
				.data418_o(data418),
				.data419_o(data419),
				.data420_o(data420),
				.data421_o(data421),
				.data422_o(data422),
				.data423_o(data423),
				.data424_o(data424),
				.data425_o(data425),
				.data426_o(data426),
				.data427_o(data427),
				.data428_o(data428),
				.data429_o(data429),
				.data430_o(data430),
				.data431_o(data431),
				.data432_o(data432),
				.data433_o(data433),
				.data434_o(data434),
				.data435_o(data435),
				.data436_o(data436),
				.data437_o(data437),
				.data438_o(data438),
				.data439_o(data439),
				.data440_o(data440),
				.data441_o(data441),
				.data442_o(data442),
				.data443_o(data443),
				.data444_o(data444),
				.data445_o(data445),
				.data446_o(data446),
				.data447_o(data447),
				.data448_o(data448),
				.data449_o(data449),
				.data450_o(data450),
				.data451_o(data451),
				.data452_o(data452),
				.data453_o(data453),
				.data454_o(data454),
				.data455_o(data455),
				.data456_o(data456),
				.data457_o(data457),
				.data458_o(data458),
				.data459_o(data459),
				.data460_o(data460),
				.data461_o(data461),
				.data462_o(data462),
				.data463_o(data463),
				.data464_o(data464),
				.data465_o(data465),
				.data466_o(data466),
				.data467_o(data467),
				.data468_o(data468),
				.data469_o(data469),
				.data470_o(data470),
				.data471_o(data471),
				.data472_o(data472),
				.data473_o(data473),
				.data474_o(data474),
				.data475_o(data475),
				.data476_o(data476),
				.data477_o(data477),
				.data478_o(data478),
				.data479_o(data479),
				.data480_o(data480),
				.data481_o(data481),
				.data482_o(data482),
				.data483_o(data483),
				.data484_o(data484),
				.data485_o(data485),
				.data486_o(data486),
				.data487_o(data487),
				.data488_o(data488),
				.data489_o(data489),
				.data490_o(data490),
				.data491_o(data491),
				.data492_o(data492),
				.data493_o(data493),
				.data494_o(data494),
				.data495_o(data495),
				.data496_o(data496),
				.data497_o(data497),
				.data498_o(data498),
				.data499_o(data499),
				.data500_o(data500),
				.data501_o(data501),
				.data502_o(data502),
				.data503_o(data503),
				.data504_o(data504),
				.data505_o(data505),
				.data506_o(data506),
				.data507_o(data507),
				.data508_o(data508),
				.data509_o(data509),
				.data510_o(data510),
				.data511_o(data511)
	);

	MUX_9bits MUX_9bits_i (
				.clk_i(clk_i),
				.rst_i(rst_i),
				.sel_i(sel_i),
				.data0_i(data0),
				.data1_i(data1),
				.data2_i(data2),
				.data3_i(data3),
				.data4_i(data4),
				.data5_i(data5),
				.data6_i(data6),
				.data7_i(data7),
				.data8_i(data8),
				.data9_i(data9),
				.data10_i(data10),
				.data11_i(data11),
				.data12_i(data12),
				.data13_i(data13),
				.data14_i(data14),
				.data15_i(data15),
				.data16_i(data16),
				.data17_i(data17),
				.data18_i(data18),
				.data19_i(data19),
				.data20_i(data20),
				.data21_i(data21),
				.data22_i(data22),
				.data23_i(data23),
				.data24_i(data24),
				.data25_i(data25),
				.data26_i(data26),
				.data27_i(data27),
				.data28_i(data28),
				.data29_i(data29),
				.data30_i(data30),
				.data31_i(data31),
				.data32_i(data32),
				.data33_i(data33),
				.data34_i(data34),
				.data35_i(data35),
				.data36_i(data36),
				.data37_i(data37),
				.data38_i(data38),
				.data39_i(data39),
				.data40_i(data40),
				.data41_i(data41),
				.data42_i(data42),
				.data43_i(data43),
				.data44_i(data44),
				.data45_i(data45),
				.data46_i(data46),
				.data47_i(data47),
				.data48_i(data48),
				.data49_i(data49),
				.data50_i(data50),
				.data51_i(data51),
				.data52_i(data52),
				.data53_i(data53),
				.data54_i(data54),
				.data55_i(data55),
				.data56_i(data56),
				.data57_i(data57),
				.data58_i(data58),
				.data59_i(data59),
				.data60_i(data60),
				.data61_i(data61),
				.data62_i(data62),
				.data63_i(data63),
				.data64_i(data64),
				.data65_i(data65),
				.data66_i(data66),
				.data67_i(data67),
				.data68_i(data68),
				.data69_i(data69),
				.data70_i(data70),
				.data71_i(data71),
				.data72_i(data72),
				.data73_i(data73),
				.data74_i(data74),
				.data75_i(data75),
				.data76_i(data76),
				.data77_i(data77),
				.data78_i(data78),
				.data79_i(data79),
				.data80_i(data80),
				.data81_i(data81),
				.data82_i(data82),
				.data83_i(data83),
				.data84_i(data84),
				.data85_i(data85),
				.data86_i(data86),
				.data87_i(data87),
				.data88_i(data88),
				.data89_i(data89),
				.data90_i(data90),
				.data91_i(data91),
				.data92_i(data92),
				.data93_i(data93),
				.data94_i(data94),
				.data95_i(data95),
				.data96_i(data96),
				.data97_i(data97),
				.data98_i(data98),
				.data99_i(data99),
				.data100_i(data100),
				.data101_i(data101),
				.data102_i(data102),
				.data103_i(data103),
				.data104_i(data104),
				.data105_i(data105),
				.data106_i(data106),
				.data107_i(data107),
				.data108_i(data108),
				.data109_i(data109),
				.data110_i(data110),
				.data111_i(data111),
				.data112_i(data112),
				.data113_i(data113),
				.data114_i(data114),
				.data115_i(data115),
				.data116_i(data116),
				.data117_i(data117),
				.data118_i(data118),
				.data119_i(data119),
				.data120_i(data120),
				.data121_i(data121),
				.data122_i(data122),
				.data123_i(data123),
				.data124_i(data124),
				.data125_i(data125),
				.data126_i(data126),
				.data127_i(data127),
				.data128_i(data128),
				.data129_i(data129),
				.data130_i(data130),
				.data131_i(data131),
				.data132_i(data132),
				.data133_i(data133),
				.data134_i(data134),
				.data135_i(data135),
				.data136_i(data136),
				.data137_i(data137),
				.data138_i(data138),
				.data139_i(data139),
				.data140_i(data140),
				.data141_i(data141),
				.data142_i(data142),
				.data143_i(data143),
				.data144_i(data144),
				.data145_i(data145),
				.data146_i(data146),
				.data147_i(data147),
				.data148_i(data148),
				.data149_i(data149),
				.data150_i(data150),
				.data151_i(data151),
				.data152_i(data152),
				.data153_i(data153),
				.data154_i(data154),
				.data155_i(data155),
				.data156_i(data156),
				.data157_i(data157),
				.data158_i(data158),
				.data159_i(data159),
				.data160_i(data160),
				.data161_i(data161),
				.data162_i(data162),
				.data163_i(data163),
				.data164_i(data164),
				.data165_i(data165),
				.data166_i(data166),
				.data167_i(data167),
				.data168_i(data168),
				.data169_i(data169),
				.data170_i(data170),
				.data171_i(data171),
				.data172_i(data172),
				.data173_i(data173),
				.data174_i(data174),
				.data175_i(data175),
				.data176_i(data176),
				.data177_i(data177),
				.data178_i(data178),
				.data179_i(data179),
				.data180_i(data180),
				.data181_i(data181),
				.data182_i(data182),
				.data183_i(data183),
				.data184_i(data184),
				.data185_i(data185),
				.data186_i(data186),
				.data187_i(data187),
				.data188_i(data188),
				.data189_i(data189),
				.data190_i(data190),
				.data191_i(data191),
				.data192_i(data192),
				.data193_i(data193),
				.data194_i(data194),
				.data195_i(data195),
				.data196_i(data196),
				.data197_i(data197),
				.data198_i(data198),
				.data199_i(data199),
				.data200_i(data200),
				.data201_i(data201),
				.data202_i(data202),
				.data203_i(data203),
				.data204_i(data204),
				.data205_i(data205),
				.data206_i(data206),
				.data207_i(data207),
				.data208_i(data208),
				.data209_i(data209),
				.data210_i(data210),
				.data211_i(data211),
				.data212_i(data212),
				.data213_i(data213),
				.data214_i(data214),
				.data215_i(data215),
				.data216_i(data216),
				.data217_i(data217),
				.data218_i(data218),
				.data219_i(data219),
				.data220_i(data220),
				.data221_i(data221),
				.data222_i(data222),
				.data223_i(data223),
				.data224_i(data224),
				.data225_i(data225),
				.data226_i(data226),
				.data227_i(data227),
				.data228_i(data228),
				.data229_i(data229),
				.data230_i(data230),
				.data231_i(data231),
				.data232_i(data232),
				.data233_i(data233),
				.data234_i(data234),
				.data235_i(data235),
				.data236_i(data236),
				.data237_i(data237),
				.data238_i(data238),
				.data239_i(data239),
				.data240_i(data240),
				.data241_i(data241),
				.data242_i(data242),
				.data243_i(data243),
				.data244_i(data244),
				.data245_i(data245),
				.data246_i(data246),
				.data247_i(data247),
				.data248_i(data248),
				.data249_i(data249),
				.data250_i(data250),
				.data251_i(data251),
				.data252_i(data252),
				.data253_i(data253),
				.data254_i(data254),
				.data255_i(data255),
				.data256_i(data256),
				.data257_i(data257),
				.data258_i(data258),
				.data259_i(data259),
				.data260_i(data260),
				.data261_i(data261),
				.data262_i(data262),
				.data263_i(data263),
				.data264_i(data264),
				.data265_i(data265),
				.data266_i(data266),
				.data267_i(data267),
				.data268_i(data268),
				.data269_i(data269),
				.data270_i(data270),
				.data271_i(data271),
				.data272_i(data272),
				.data273_i(data273),
				.data274_i(data274),
				.data275_i(data275),
				.data276_i(data276),
				.data277_i(data277),
				.data278_i(data278),
				.data279_i(data279),
				.data280_i(data280),
				.data281_i(data281),
				.data282_i(data282),
				.data283_i(data283),
				.data284_i(data284),
				.data285_i(data285),
				.data286_i(data286),
				.data287_i(data287),
				.data288_i(data288),
				.data289_i(data289),
				.data290_i(data290),
				.data291_i(data291),
				.data292_i(data292),
				.data293_i(data293),
				.data294_i(data294),
				.data295_i(data295),
				.data296_i(data296),
				.data297_i(data297),
				.data298_i(data298),
				.data299_i(data299),
				.data300_i(data300),
				.data301_i(data301),
				.data302_i(data302),
				.data303_i(data303),
				.data304_i(data304),
				.data305_i(data305),
				.data306_i(data306),
				.data307_i(data307),
				.data308_i(data308),
				.data309_i(data309),
				.data310_i(data310),
				.data311_i(data311),
				.data312_i(data312),
				.data313_i(data313),
				.data314_i(data314),
				.data315_i(data315),
				.data316_i(data316),
				.data317_i(data317),
				.data318_i(data318),
				.data319_i(data319),
				.data320_i(data320),
				.data321_i(data321),
				.data322_i(data322),
				.data323_i(data323),
				.data324_i(data324),
				.data325_i(data325),
				.data326_i(data326),
				.data327_i(data327),
				.data328_i(data328),
				.data329_i(data329),
				.data330_i(data330),
				.data331_i(data331),
				.data332_i(data332),
				.data333_i(data333),
				.data334_i(data334),
				.data335_i(data335),
				.data336_i(data336),
				.data337_i(data337),
				.data338_i(data338),
				.data339_i(data339),
				.data340_i(data340),
				.data341_i(data341),
				.data342_i(data342),
				.data343_i(data343),
				.data344_i(data344),
				.data345_i(data345),
				.data346_i(data346),
				.data347_i(data347),
				.data348_i(data348),
				.data349_i(data349),
				.data350_i(data350),
				.data351_i(data351),
				.data352_i(data352),
				.data353_i(data353),
				.data354_i(data354),
				.data355_i(data355),
				.data356_i(data356),
				.data357_i(data357),
				.data358_i(data358),
				.data359_i(data359),
				.data360_i(data360),
				.data361_i(data361),
				.data362_i(data362),
				.data363_i(data363),
				.data364_i(data364),
				.data365_i(data365),
				.data366_i(data366),
				.data367_i(data367),
				.data368_i(data368),
				.data369_i(data369),
				.data370_i(data370),
				.data371_i(data371),
				.data372_i(data372),
				.data373_i(data373),
				.data374_i(data374),
				.data375_i(data375),
				.data376_i(data376),
				.data377_i(data377),
				.data378_i(data378),
				.data379_i(data379),
				.data380_i(data380),
				.data381_i(data381),
				.data382_i(data382),
				.data383_i(data383),
				.data384_i(data384),
				.data385_i(data385),
				.data386_i(data386),
				.data387_i(data387),
				.data388_i(data388),
				.data389_i(data389),
				.data390_i(data390),
				.data391_i(data391),
				.data392_i(data392),
				.data393_i(data393),
				.data394_i(data394),
				.data395_i(data395),
				.data396_i(data396),
				.data397_i(data397),
				.data398_i(data398),
				.data399_i(data399),
				.data400_i(data400),
				.data401_i(data401),
				.data402_i(data402),
				.data403_i(data403),
				.data404_i(data404),
				.data405_i(data405),
				.data406_i(data406),
				.data407_i(data407),
				.data408_i(data408),
				.data409_i(data409),
				.data410_i(data410),
				.data411_i(data411),
				.data412_i(data412),
				.data413_i(data413),
				.data414_i(data414),
				.data415_i(data415),
				.data416_i(data416),
				.data417_i(data417),
				.data418_i(data418),
				.data419_i(data419),
				.data420_i(data420),
				.data421_i(data421),
				.data422_i(data422),
				.data423_i(data423),
				.data424_i(data424),
				.data425_i(data425),
				.data426_i(data426),
				.data427_i(data427),
				.data428_i(data428),
				.data429_i(data429),
				.data430_i(data430),
				.data431_i(data431),
				.data432_i(data432),
				.data433_i(data433),
				.data434_i(data434),
				.data435_i(data435),
				.data436_i(data436),
				.data437_i(data437),
				.data438_i(data438),
				.data439_i(data439),
				.data440_i(data440),
				.data441_i(data441),
				.data442_i(data442),
				.data443_i(data443),
				.data444_i(data444),
				.data445_i(data445),
				.data446_i(data446),
				.data447_i(data447),
				.data448_i(data448),
				.data449_i(data449),
				.data450_i(data450),
				.data451_i(data451),
				.data452_i(data452),
				.data453_i(data453),
				.data454_i(data454),
				.data455_i(data455),
				.data456_i(data456),
				.data457_i(data457),
				.data458_i(data458),
				.data459_i(data459),
				.data460_i(data460),
				.data461_i(data461),
				.data462_i(data462),
				.data463_i(data463),
				.data464_i(data464),
				.data465_i(data465),
				.data466_i(data466),
				.data467_i(data467),
				.data468_i(data468),
				.data469_i(data469),
				.data470_i(data470),
				.data471_i(data471),
				.data472_i(data472),
				.data473_i(data473),
				.data474_i(data474),
				.data475_i(data475),
				.data476_i(data476),
				.data477_i(data477),
				.data478_i(data478),
				.data479_i(data479),
				.data480_i(data480),
				.data481_i(data481),
				.data482_i(data482),
				.data483_i(data483),
				.data484_i(data484),
				.data485_i(data485),
				.data486_i(data486),
				.data487_i(data487),
				.data488_i(data488),
				.data489_i(data489),
				.data490_i(data490),
				.data491_i(data491),
				.data492_i(data492),
				.data493_i(data493),
				.data494_i(data494),
				.data495_i(data495),
				.data496_i(data496),
				.data497_i(data497),
				.data498_i(data498),
				.data499_i(data499),
				.data500_i(data500),
				.data501_i(data501),
				.data502_i(data502),
				.data503_i(data503),
				.data504_i(data504),
				.data505_i(data505),
				.data506_i(data506),
				.data507_i(data507),
				.data508_i(data508),
				.data509_i(data509),
				.data510_i(data510),
				.data511_i(data511),
				.data_o(data_o)
	);

endmodule
