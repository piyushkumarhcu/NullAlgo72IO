library IEEE;
use IEEE.STD_LOGIC_1164.all;
use ieee.numeric_std.all;

use work.StdRtlPkg.all;
use work.AxiStreamPkg.all;

entity RCTAlgoWrapper is
  generic (
    N_INPUT_STREAMS  : integer := 36;
    N_OUTPUT_STREAMS : integer := 36
    );
  port (
    -- Algo Control/Status Signals
    algoClk   : in  std_logic;
    algoRst   : in  std_logic;
    algoStart : in  std_logic;
    algoDone  : out std_logic := '0';
    algoIdle  : out std_logic := '0';
    algoReady : out std_logic := '0';

    -- AXI-Stream In/Out Ports
    axiStreamIn  : in  AxiStreamMasterArray(N_INPUT_STREAMS-1 downto 0);
    axiStreamOut : out AxiStreamMasterArray(N_OUTPUT_STREAMS-1 downto 0)
    );
end RCTAlgoWrapper;

architecture Behavioral of RCTAlgoWrapper is

  signal algoRstD1, algoRstD1n : std_logic;

  signal algoStartD1 : std_logic;

  attribute max_fanout                           : integer;
  attribute max_fanout of algoRstD1, algoStartD1 : signal is 1;

  component algo_top
    port (
    ap_clk : IN STD_LOGIC;
    ap_rst : IN STD_LOGIC;
    ap_start : IN STD_LOGIC;
    ap_done : OUT STD_LOGIC;
    ap_idle : OUT STD_LOGIC;
    ap_ready : OUT STD_LOGIC;
    link_in_0_V : IN STD_LOGIC_VECTOR (383 downto 0);
    link_in_1_V : IN STD_LOGIC_VECTOR (383 downto 0);
    link_in_2_V : IN STD_LOGIC_VECTOR (383 downto 0);
    link_in_3_V : IN STD_LOGIC_VECTOR (383 downto 0);
    link_in_4_V : IN STD_LOGIC_VECTOR (383 downto 0);
    link_in_5_V : IN STD_LOGIC_VECTOR (383 downto 0);
    link_in_6_V : IN STD_LOGIC_VECTOR (383 downto 0);
    link_in_7_V : IN STD_LOGIC_VECTOR (383 downto 0);
    link_in_8_V : IN STD_LOGIC_VECTOR (383 downto 0);
    link_in_9_V : IN STD_LOGIC_VECTOR (383 downto 0);
    link_in_10_V : IN STD_LOGIC_VECTOR (383 downto 0);
    link_in_11_V : IN STD_LOGIC_VECTOR (383 downto 0);
    link_in_12_V : IN STD_LOGIC_VECTOR (383 downto 0);
    link_in_13_V : IN STD_LOGIC_VECTOR (383 downto 0);
    link_in_14_V : IN STD_LOGIC_VECTOR (383 downto 0);
    link_in_15_V : IN STD_LOGIC_VECTOR (383 downto 0);
    link_in_16_V : IN STD_LOGIC_VECTOR (383 downto 0);
    link_in_17_V : IN STD_LOGIC_VECTOR (383 downto 0);
    link_in_18_V : IN STD_LOGIC_VECTOR (383 downto 0);
    link_in_19_V : IN STD_LOGIC_VECTOR (383 downto 0);
    link_in_20_V : IN STD_LOGIC_VECTOR (383 downto 0);
    link_in_21_V : IN STD_LOGIC_VECTOR (383 downto 0);
    link_in_22_V : IN STD_LOGIC_VECTOR (383 downto 0);
    link_in_23_V : IN STD_LOGIC_VECTOR (383 downto 0);
    link_in_24_V : IN STD_LOGIC_VECTOR (383 downto 0);
    link_in_25_V : IN STD_LOGIC_VECTOR (383 downto 0);
    link_in_26_V : IN STD_LOGIC_VECTOR (383 downto 0);
    link_in_27_V : IN STD_LOGIC_VECTOR (383 downto 0);
    link_in_28_V : IN STD_LOGIC_VECTOR (383 downto 0);
    link_in_29_V : IN STD_LOGIC_VECTOR (383 downto 0);
    link_in_30_V : IN STD_LOGIC_VECTOR (383 downto 0);
    link_in_31_V : IN STD_LOGIC_VECTOR (383 downto 0);
    link_in_32_V : IN STD_LOGIC_VECTOR (383 downto 0);
    link_in_33_V : IN STD_LOGIC_VECTOR (383 downto 0);
    link_in_34_V : IN STD_LOGIC_VECTOR (383 downto 0);
    link_in_35_V : IN STD_LOGIC_VECTOR (383 downto 0);

    link_out_0_V : OUT STD_LOGIC_VECTOR (383 downto 0);
    link_out_0_V_ap_vld : OUT STD_LOGIC;
    link_out_1_V : OUT STD_LOGIC_VECTOR (383 downto 0);
    link_out_1_V_ap_vld : OUT STD_LOGIC;
    link_out_2_V : OUT STD_LOGIC_VECTOR (383 downto 0);
    link_out_2_V_ap_vld : OUT STD_LOGIC;
    link_out_3_V : OUT STD_LOGIC_VECTOR (383 downto 0);
    link_out_3_V_ap_vld : OUT STD_LOGIC;
    link_out_4_V : OUT STD_LOGIC_VECTOR (383 downto 0);
    link_out_4_V_ap_vld : OUT STD_LOGIC;
    link_out_5_V : OUT STD_LOGIC_VECTOR (383 downto 0);
    link_out_5_V_ap_vld : OUT STD_LOGIC;
    link_out_6_V : OUT STD_LOGIC_VECTOR (383 downto 0);
    link_out_6_V_ap_vld : OUT STD_LOGIC;
    link_out_7_V : OUT STD_LOGIC_VECTOR (383 downto 0);
    link_out_7_V_ap_vld : OUT STD_LOGIC;
    link_out_8_V : OUT STD_LOGIC_VECTOR (383 downto 0);
    link_out_8_V_ap_vld : OUT STD_LOGIC;
    link_out_9_V : OUT STD_LOGIC_VECTOR (383 downto 0);
    link_out_9_V_ap_vld : OUT STD_LOGIC;
    link_out_10_V : OUT STD_LOGIC_VECTOR (383 downto 0);
    link_out_10_V_ap_vld : OUT STD_LOGIC;
    link_out_11_V : OUT STD_LOGIC_VECTOR (383 downto 0);
    link_out_11_V_ap_vld : OUT STD_LOGIC;
    link_out_12_V : OUT STD_LOGIC_VECTOR (383 downto 0);
    link_out_12_V_ap_vld : OUT STD_LOGIC;
    link_out_13_V : OUT STD_LOGIC_VECTOR (383 downto 0);
    link_out_13_V_ap_vld : OUT STD_LOGIC;
    link_out_14_V : OUT STD_LOGIC_VECTOR (383 downto 0);
    link_out_14_V_ap_vld : OUT STD_LOGIC;
    link_out_15_V : OUT STD_LOGIC_VECTOR (383 downto 0);
    link_out_15_V_ap_vld : OUT STD_LOGIC;
    link_out_16_V : OUT STD_LOGIC_VECTOR (383 downto 0);
    link_out_16_V_ap_vld : OUT STD_LOGIC;
    link_out_17_V : OUT STD_LOGIC_VECTOR (383 downto 0);
    link_out_17_V_ap_vld : OUT STD_LOGIC;
    link_out_18_V : OUT STD_LOGIC_VECTOR (383 downto 0);
    link_out_18_V_ap_vld : OUT STD_LOGIC;
    link_out_19_V : OUT STD_LOGIC_VECTOR (383 downto 0);
    link_out_19_V_ap_vld : OUT STD_LOGIC;
    link_out_20_V : OUT STD_LOGIC_VECTOR (383 downto 0);
    link_out_20_V_ap_vld : OUT STD_LOGIC;
    link_out_21_V : OUT STD_LOGIC_VECTOR (383 downto 0);
    link_out_21_V_ap_vld : OUT STD_LOGIC;
    link_out_22_V : OUT STD_LOGIC_VECTOR (383 downto 0);
    link_out_22_V_ap_vld : OUT STD_LOGIC;
    link_out_23_V : OUT STD_LOGIC_VECTOR (383 downto 0);
    link_out_23_V_ap_vld : OUT STD_LOGIC;
    link_out_24_V : OUT STD_LOGIC_VECTOR (383 downto 0);
    link_out_24_V_ap_vld : OUT STD_LOGIC;
    link_out_25_V : OUT STD_LOGIC_VECTOR (383 downto 0);
    link_out_25_V_ap_vld : OUT STD_LOGIC;
    link_out_26_V : OUT STD_LOGIC_VECTOR (383 downto 0);
    link_out_26_V_ap_vld : OUT STD_LOGIC;
    link_out_27_V : OUT STD_LOGIC_VECTOR (383 downto 0);
    link_out_27_V_ap_vld : OUT STD_LOGIC;
    link_out_28_V : OUT STD_LOGIC_VECTOR (383 downto 0);
    link_out_28_V_ap_vld : OUT STD_LOGIC;
    link_out_29_V : OUT STD_LOGIC_VECTOR (383 downto 0);
    link_out_29_V_ap_vld : OUT STD_LOGIC;
    link_out_30_V : OUT STD_LOGIC_VECTOR (383 downto 0);
    link_out_30_V_ap_vld : OUT STD_LOGIC;
    link_out_31_V : OUT STD_LOGIC_VECTOR (383 downto 0);
    link_out_31_V_ap_vld : OUT STD_LOGIC;
    link_out_32_V : OUT STD_LOGIC_VECTOR (383 downto 0);
    link_out_32_V_ap_vld : OUT STD_LOGIC;
    link_out_33_V : OUT STD_LOGIC_VECTOR (383 downto 0);
    link_out_33_V_ap_vld : OUT STD_LOGIC;
    link_out_34_V : OUT STD_LOGIC_VECTOR (383 downto 0);
    link_out_34_V_ap_vld : OUT STD_LOGIC;
    link_out_35_V : OUT STD_LOGIC_VECTOR (383 downto 0);
    link_out_35_V_ap_vld : OUT STD_LOGIC  
    );
  end component;

  type t_cyc_6_arr is array(integer range <>) of integer range 0 to 5;
  type t_slv_384_arr is array(integer range <>) of std_logic_vector(383 downto 0);


  signal link_in  : t_slv_384_arr(N_INPUT_STREAMS-1 downto 0);
  signal link_out : t_slv_384_arr(N_OUTPUT_STREAMS-1 downto 0);

  signal link_in_reg  : t_slv_384_arr(N_INPUT_STREAMS-1 downto 0);
  signal link_out_reg : t_slv_384_arr(N_OUTPUT_STREAMS-1 downto 0);

  signal link_out_ap_vld         : std_logic_vector(N_OUTPUT_STREAMS-1 downto 0);
  signal link_out_ap_vld_latched : std_logic_vector(N_OUTPUT_STREAMS-1 downto 0);

  signal in_cyc  : t_cyc_6_arr(N_INPUT_STREAMS-1 downto 0);
  signal out_cyc : t_cyc_6_arr(N_OUTPUT_STREAMS-1 downto 0);

begin

  algoRstD1 <= algoRst   when rising_edge(algoClk);
  --algoRstD1n  <= not algoRstD1;
  algoStartD1 <= algoStart when rising_edge(algoClk);

  gen_cyc_in : for idx in N_INPUT_STREAMS-1 DOWNTO 0 generate
    process(algoClk) is
    begin
      if rising_edge(algoClk) then
        
        if (algoRst = '1') then
          in_cyc(idx) <= 0;
        else
          in_cyc(idx) <= in_cyc(idx) + 1;
          if (in_cyc(idx) = 5) then
            in_cyc(idx) <= 0;
          end if;
        end if;

        if (in_cyc(idx) = 0) then 
            link_in(idx)(63 downto 0)  <= axiStreamIn(idx).tdata(63 downto 0); 
        end if;

        if (in_cyc(idx) = 1) then 
            link_in(idx)(127 downto 64)  <= axiStreamIn(idx).tdata(63 downto 0); 
        end if;

        if (in_cyc(idx) = 2) then 
            link_in(idx)(191 downto 128)  <= axiStreamIn(idx).tdata(63 downto 0); 
        end if;

        if (in_cyc(idx) = 3) then 
            link_in(idx)(255 downto 192)  <= axiStreamIn(idx).tdata(63 downto 0); 
        end if;

        if (in_cyc(idx) = 4) then 
            link_in(idx)(319 downto 256)  <= axiStreamIn(idx).tdata(63 downto 0); 
        end if;

        if (in_cyc(idx) = 5) then 
            link_in_reg(idx)(63 downto 0) <= link_in(idx)(63 downto 0);
            link_in_reg(idx)(127 downto 64) <= link_in(idx)(127 downto 64);
            link_in_reg(idx)(191 downto 128) <= link_in(idx)(191 downto 128);
            link_in_reg(idx)(255 downto 192) <= link_in(idx)(255 downto 192);
            link_in_reg(idx)(319 downto 256) <= link_in(idx)(319 downto 256);
            link_in_reg(idx)(383 downto 320) <= axiStreamIn(idx).tdata(63 downto 0); 
        end if;

      end if;
    end process;
  end generate;


  gen_cyc_out : for idx in N_OUTPUT_STREAMS-1 DOWNTO 0 generate
    process(algoClk) is
    begin
      if rising_edge(algoClk) then

        if (link_out_ap_vld(idx) = '1') then
          link_out_reg(idx) <= link_out(idx);
        end if;

        if (algoRstD1 = '1') then
            link_out_ap_vld_latched(idx) <= '0';
        elsif (link_out_ap_vld(idx) = '1') then
            link_out_ap_vld_latched(idx) <= '1';
        end if;

        if (link_out_ap_vld_latched(idx) = '0') then
          out_cyc(idx)                <= 0;
          axiStreamOut(idx).tvalid <= '0';
        else
          axiStreamOut(idx).tvalid <= '1';
          out_cyc(idx)                <= out_cyc(idx) + 1;
          if (out_cyc(idx) = 5) then
            out_cyc(idx) <= 0;
          end if;
        end if;

        if (out_cyc(idx) = 0) then axiStreamOut(idx).tdata(63 downto 0) <= link_out_reg(idx)(63 downto 0); end if;
        if (out_cyc(idx) = 1) then axiStreamOut(idx).tdata(63 downto 0) <= link_out_reg(idx)(127 downto 64); end if;
        if (out_cyc(idx) = 2) then axiStreamOut(idx).tdata(63 downto 0) <= link_out_reg(idx)(191 downto 128); end if;
        if (out_cyc(idx) = 3) then axiStreamOut(idx).tdata(63 downto 0) <= link_out_reg(idx)(255 downto 192); end if;
        if (out_cyc(idx) = 4) then axiStreamOut(idx).tdata(63 downto 0) <= link_out_reg(idx)(319 downto 256); end if;
        if (out_cyc(idx) = 5) then axiStreamOut(idx).tdata(63 downto 0) <= link_out_reg(idx)(383 downto 320); end if;

      end if;
    end process;
  end generate;

  i_algo_top : algo_top
    port map (
        ap_clk      => algoClk,
        ap_rst      => algoRstD1,
        ap_start    => algoStartD1,
        ap_done     => algoDone,
        ap_idle     => algoIdle,
        ap_ready    => algoReady,

        link_in_0_V => link_in_reg(0),
        link_in_1_V => link_in_reg(1),
        link_in_2_V => link_in_reg(2),
        link_in_3_V => link_in_reg(3),
        link_in_4_V => link_in_reg(4),
        link_in_5_V => link_in_reg(5),
        link_in_6_V => link_in_reg(6),
        link_in_7_V => link_in_reg(7),
        link_in_8_V => link_in_reg(8),
        link_in_9_V => link_in_reg(9),
        link_in_10_V => link_in_reg(10),
        link_in_11_V => link_in_reg(11),
        link_in_12_V => link_in_reg(12),
        link_in_13_V => link_in_reg(13),
        link_in_14_V => link_in_reg(14),
        link_in_15_V => link_in_reg(15),
        link_in_16_V => link_in_reg(16),
        link_in_17_V => link_in_reg(17),
        link_in_18_V => link_in_reg(18),
        link_in_19_V => link_in_reg(19),
        link_in_20_V => link_in_reg(20),
        link_in_21_V => link_in_reg(21),
        link_in_22_V => link_in_reg(22),
        link_in_23_V => link_in_reg(23),
        link_in_24_V => link_in_reg(24),
        link_in_25_V => link_in_reg(25),
        link_in_26_V => link_in_reg(26),
        link_in_27_V => link_in_reg(27),
        link_in_28_V => link_in_reg(28),
        link_in_29_V => link_in_reg(29),
        link_in_30_V => link_in_reg(30),
        link_in_31_V => link_in_reg(31),
        link_in_32_V => link_in_reg(32),
        link_in_33_V => link_in_reg(33),
        link_in_34_V => link_in_reg(34),
        link_in_35_V => link_in_reg(35),

        link_out_0_V => link_out(0),
        link_out_1_V => link_out(1),
        link_out_2_V => link_out(2),
        link_out_3_V => link_out(3),
        link_out_4_V => link_out(4),
        link_out_5_V => link_out(5),
        link_out_6_V => link_out(6),
        link_out_7_V => link_out(7),
        link_out_8_V => link_out(8),
        link_out_9_V => link_out(9),
        link_out_10_V => link_out(10),
        link_out_11_V => link_out(11),
        link_out_12_V => link_out(12),
        link_out_13_V => link_out(13),
        link_out_14_V => link_out(14),
        link_out_15_V => link_out(15),
        link_out_16_V => link_out(16),
        link_out_17_V => link_out(17),
        link_out_18_V => link_out(18),
        link_out_19_V => link_out(19),
        link_out_20_V => link_out(20),
        link_out_21_V => link_out(21),
        link_out_22_V => link_out(22),
        link_out_23_V => link_out(23),
        link_out_24_V => link_out(24),
        link_out_25_V => link_out(25),
        link_out_26_V => link_out(26),
        link_out_27_V => link_out(27),
        link_out_28_V => link_out(28),
        link_out_29_V => link_out(29),
        link_out_30_V => link_out(30),
        link_out_31_V => link_out(31),
        link_out_32_V => link_out(32),
        link_out_33_V => link_out(33),
        link_out_34_V => link_out(34),
        link_out_35_V => link_out(35),
        
        link_out_0_V_ap_vld => link_out_ap_vld(0),
        link_out_1_V_ap_vld => link_out_ap_vld(1),
        link_out_2_V_ap_vld => link_out_ap_vld(2),
        link_out_3_V_ap_vld => link_out_ap_vld(3),
        link_out_4_V_ap_vld => link_out_ap_vld(4),
        link_out_5_V_ap_vld => link_out_ap_vld(5),
        link_out_6_V_ap_vld => link_out_ap_vld(6),
        link_out_7_V_ap_vld => link_out_ap_vld(7),
        link_out_8_V_ap_vld => link_out_ap_vld(8),
        link_out_9_V_ap_vld => link_out_ap_vld(9),
        link_out_10_V_ap_vld => link_out_ap_vld(10),
        link_out_11_V_ap_vld => link_out_ap_vld(11),
        link_out_12_V_ap_vld => link_out_ap_vld(12),
        link_out_13_V_ap_vld => link_out_ap_vld(13),
        link_out_14_V_ap_vld => link_out_ap_vld(14),
        link_out_15_V_ap_vld => link_out_ap_vld(15),
        link_out_16_V_ap_vld => link_out_ap_vld(16),
        link_out_17_V_ap_vld => link_out_ap_vld(17),
        link_out_18_V_ap_vld => link_out_ap_vld(18),
        link_out_19_V_ap_vld => link_out_ap_vld(19),
        link_out_20_V_ap_vld => link_out_ap_vld(20),
        link_out_21_V_ap_vld => link_out_ap_vld(21),
        link_out_22_V_ap_vld => link_out_ap_vld(22),
        link_out_23_V_ap_vld => link_out_ap_vld(23),
        link_out_24_V_ap_vld => link_out_ap_vld(24),
        link_out_25_V_ap_vld => link_out_ap_vld(25),
        link_out_26_V_ap_vld => link_out_ap_vld(26),
        link_out_27_V_ap_vld => link_out_ap_vld(27),
        link_out_28_V_ap_vld => link_out_ap_vld(28),
        link_out_29_V_ap_vld => link_out_ap_vld(29),
        link_out_30_V_ap_vld => link_out_ap_vld(30),
        link_out_31_V_ap_vld => link_out_ap_vld(31),
        link_out_32_V_ap_vld => link_out_ap_vld(32),
        link_out_33_V_ap_vld => link_out_ap_vld(33),
        link_out_34_V_ap_vld => link_out_ap_vld(34),
        link_out_35_V_ap_vld => link_out_ap_vld(35)
        
      );
end Behavioral;
