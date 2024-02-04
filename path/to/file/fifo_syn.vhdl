-- Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2019.1 (win64) Build 2552052 Fri May 24 14:49:42 MDT 2019
-- Date        : Tue Jan 30 22:46:39 2024
-- Host        : Lis-Legion running 64-bit major release  (build 9200)
-- Command     : write_vhdl ./path/to/file/fifo_syn.vhdl
-- Design      : fifo
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xc7z020clg484-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity fifo is
  port (
    clk_in : in STD_LOGIC;
    clk_out : in STD_LOGIC;
    res : in STD_LOGIC;
    we : in STD_LOGIC;
    re : in STD_LOGIC;
    full : out STD_LOGIC;
    empty : out STD_LOGIC;
    level_reach : out STD_LOGIC;
    data1 : in STD_LOGIC_VECTOR ( 7 downto 0 );
    data2 : out STD_LOGIC_VECTOR ( 7 downto 0 )
  );
  attribute NotValidForBitStream : boolean;
  attribute NotValidForBitStream of fifo : entity is true;
  attribute ECO_CHECKSUM : string;
  attribute ECO_CHECKSUM of fifo : entity is "378e7195";
  attribute ld_depth : integer;
  attribute ld_depth of fifo : entity is 3;
  attribute level : integer;
  attribute level of fifo : entity is 5;
end fifo;

architecture STRUCTURE of fifo is
  signal clk_in_IBUF : STD_LOGIC;
  signal clk_in_IBUF_BUFG : STD_LOGIC;
  signal clk_out_IBUF : STD_LOGIC;
  signal clk_out_IBUF_BUFG : STD_LOGIC;
  signal data1_IBUF : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal data20 : STD_LOGIC;
  signal data21 : STD_LOGIC;
  signal data2_OBUF : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal empty_OBUF : STD_LOGIC;
  signal empty_flag0 : STD_LOGIC;
  signal empty_flag_reg_i_2_n_0 : STD_LOGIC;
  signal full_OBUF : STD_LOGIC;
  signal full_flag0 : STD_LOGIC;
  signal full_flag_reg_i_1_n_0 : STD_LOGIC;
  signal level_reach_OBUF : STD_LOGIC;
  signal level_reach_OBUF_inst_i_2_n_0 : STD_LOGIC;
  signal mem_reg_0_7_0_5_n_0 : STD_LOGIC;
  signal mem_reg_0_7_0_5_n_1 : STD_LOGIC;
  signal mem_reg_0_7_0_5_n_2 : STD_LOGIC;
  signal mem_reg_0_7_0_5_n_3 : STD_LOGIC;
  signal mem_reg_0_7_0_5_n_4 : STD_LOGIC;
  signal mem_reg_0_7_0_5_n_5 : STD_LOGIC;
  signal mem_reg_0_7_6_7_n_0 : STD_LOGIC;
  signal mem_reg_0_7_6_7_n_1 : STD_LOGIC;
  signal p_0_in : STD_LOGIC_VECTOR ( 0 to 0 );
  signal p_0_in0_in : STD_LOGIC;
  signal p_0_in0_out : STD_LOGIC;
  signal p_1_in : STD_LOGIC;
  signal p_1_in1_in : STD_LOGIC;
  signal p_1_out : STD_LOGIC;
  signal plusOp : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \plusOp__0\ : STD_LOGIC_VECTOR ( 3 downto 1 );
  signal re_IBUF : STD_LOGIC;
  signal \read_ptr_reg_n_0_[0]\ : STD_LOGIC;
  signal \read_ptr_reg_n_0_[1]\ : STD_LOGIC;
  signal \read_ptr_reg_n_0_[2]\ : STD_LOGIC;
  signal \read_ptr_sync_reg_n_0_[0]\ : STD_LOGIC;
  signal \read_ptr_sync_reg_n_0_[1]\ : STD_LOGIC;
  signal \read_ptr_sync_reg_n_0_[2]\ : STD_LOGIC;
  signal read_ptr_temp : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal res_IBUF : STD_LOGIC;
  signal we_IBUF : STD_LOGIC;
  signal \write_ptr_reg_n_0_[0]\ : STD_LOGIC;
  signal \write_ptr_reg_n_0_[1]\ : STD_LOGIC;
  signal \write_ptr_reg_n_0_[2]\ : STD_LOGIC;
  signal \write_ptr_reg_n_0_[3]\ : STD_LOGIC;
  signal \write_ptr_sync_reg_n_0_[0]\ : STD_LOGIC;
  signal \write_ptr_sync_reg_n_0_[1]\ : STD_LOGIC;
  signal \write_ptr_sync_reg_n_0_[2]\ : STD_LOGIC;
  signal write_ptr_temp : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal NLW_mem_reg_0_7_0_5_DOD_UNCONNECTED : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal NLW_mem_reg_0_7_6_7_DOB_UNCONNECTED : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal NLW_mem_reg_0_7_6_7_DOC_UNCONNECTED : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal NLW_mem_reg_0_7_6_7_DOD_UNCONNECTED : STD_LOGIC_VECTOR ( 1 downto 0 );
  attribute XILINX_LEGACY_PRIM : string;
  attribute XILINX_LEGACY_PRIM of empty_flag_reg : label is "LD";
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of empty_flag_reg_i_1 : label is "soft_lutpair0";
  attribute XILINX_LEGACY_PRIM of full_flag_reg : label is "LD";
  attribute SOFT_HLUTNM of level_reach_OBUF_inst_i_1 : label is "soft_lutpair0";
  attribute SOFT_HLUTNM of level_reach_OBUF_inst_i_2 : label is "soft_lutpair3";
  attribute METHODOLOGY_DRC_VIOS : string;
  attribute METHODOLOGY_DRC_VIOS of mem_reg_0_7_0_5 : label is "";
  attribute RTL_RAM_BITS : integer;
  attribute RTL_RAM_BITS of mem_reg_0_7_0_5 : label is 64;
  attribute RTL_RAM_NAME : string;
  attribute RTL_RAM_NAME of mem_reg_0_7_0_5 : label is "mem";
  attribute ram_addr_begin : integer;
  attribute ram_addr_begin of mem_reg_0_7_0_5 : label is 0;
  attribute ram_addr_end : integer;
  attribute ram_addr_end of mem_reg_0_7_0_5 : label is 7;
  attribute ram_offset : integer;
  attribute ram_offset of mem_reg_0_7_0_5 : label is 0;
  attribute ram_slice_begin : integer;
  attribute ram_slice_begin of mem_reg_0_7_0_5 : label is 0;
  attribute ram_slice_end : integer;
  attribute ram_slice_end of mem_reg_0_7_0_5 : label is 5;
  attribute METHODOLOGY_DRC_VIOS of mem_reg_0_7_6_7 : label is "";
  attribute RTL_RAM_BITS of mem_reg_0_7_6_7 : label is 64;
  attribute RTL_RAM_NAME of mem_reg_0_7_6_7 : label is "mem";
  attribute ram_addr_begin of mem_reg_0_7_6_7 : label is 0;
  attribute ram_addr_end of mem_reg_0_7_6_7 : label is 7;
  attribute ram_offset of mem_reg_0_7_6_7 : label is 0;
  attribute ram_slice_begin of mem_reg_0_7_6_7 : label is 6;
  attribute ram_slice_end of mem_reg_0_7_6_7 : label is 7;
  attribute SOFT_HLUTNM of \read_ptr[1]_i_1\ : label is "soft_lutpair3";
  attribute SOFT_HLUTNM of \read_ptr[2]_i_1\ : label is "soft_lutpair1";
  attribute SOFT_HLUTNM of \read_ptr[3]_i_2\ : label is "soft_lutpair1";
  attribute SOFT_HLUTNM of \write_ptr[0]_i_1\ : label is "soft_lutpair4";
  attribute SOFT_HLUTNM of \write_ptr[1]_i_1\ : label is "soft_lutpair4";
  attribute SOFT_HLUTNM of \write_ptr[2]_i_1\ : label is "soft_lutpair2";
  attribute SOFT_HLUTNM of \write_ptr[3]_i_2\ : label is "soft_lutpair2";
begin
clk_in_IBUF_BUFG_inst: unisim.vcomponents.BUFG
     port map (
      I => clk_in_IBUF,
      O => clk_in_IBUF_BUFG
    );
clk_in_IBUF_inst: unisim.vcomponents.IBUF
     port map (
      I => clk_in,
      O => clk_in_IBUF
    );
clk_out_IBUF_BUFG_inst: unisim.vcomponents.BUFG
     port map (
      I => clk_out_IBUF,
      O => clk_out_IBUF_BUFG
    );
clk_out_IBUF_inst: unisim.vcomponents.IBUF
     port map (
      I => clk_out,
      O => clk_out_IBUF
    );
\data1_IBUF[0]_inst\: unisim.vcomponents.IBUF
     port map (
      I => data1(0),
      O => data1_IBUF(0)
    );
\data1_IBUF[1]_inst\: unisim.vcomponents.IBUF
     port map (
      I => data1(1),
      O => data1_IBUF(1)
    );
\data1_IBUF[2]_inst\: unisim.vcomponents.IBUF
     port map (
      I => data1(2),
      O => data1_IBUF(2)
    );
\data1_IBUF[3]_inst\: unisim.vcomponents.IBUF
     port map (
      I => data1(3),
      O => data1_IBUF(3)
    );
\data1_IBUF[4]_inst\: unisim.vcomponents.IBUF
     port map (
      I => data1(4),
      O => data1_IBUF(4)
    );
\data1_IBUF[5]_inst\: unisim.vcomponents.IBUF
     port map (
      I => data1(5),
      O => data1_IBUF(5)
    );
\data1_IBUF[6]_inst\: unisim.vcomponents.IBUF
     port map (
      I => data1(6),
      O => data1_IBUF(6)
    );
\data1_IBUF[7]_inst\: unisim.vcomponents.IBUF
     port map (
      I => data1(7),
      O => data1_IBUF(7)
    );
\data2[7]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"04"
    )
        port map (
      I0 => empty_OBUF,
      I1 => re_IBUF,
      I2 => res_IBUF,
      O => data20
    );
\data2_OBUF[0]_inst\: unisim.vcomponents.OBUF
     port map (
      I => data2_OBUF(0),
      O => data2(0)
    );
\data2_OBUF[1]_inst\: unisim.vcomponents.OBUF
     port map (
      I => data2_OBUF(1),
      O => data2(1)
    );
\data2_OBUF[2]_inst\: unisim.vcomponents.OBUF
     port map (
      I => data2_OBUF(2),
      O => data2(2)
    );
\data2_OBUF[3]_inst\: unisim.vcomponents.OBUF
     port map (
      I => data2_OBUF(3),
      O => data2(3)
    );
\data2_OBUF[4]_inst\: unisim.vcomponents.OBUF
     port map (
      I => data2_OBUF(4),
      O => data2(4)
    );
\data2_OBUF[5]_inst\: unisim.vcomponents.OBUF
     port map (
      I => data2_OBUF(5),
      O => data2(5)
    );
\data2_OBUF[6]_inst\: unisim.vcomponents.OBUF
     port map (
      I => data2_OBUF(6),
      O => data2(6)
    );
\data2_OBUF[7]_inst\: unisim.vcomponents.OBUF
     port map (
      I => data2_OBUF(7),
      O => data2(7)
    );
\data2_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_out_IBUF_BUFG,
      CE => data20,
      D => mem_reg_0_7_0_5_n_1,
      Q => data2_OBUF(0),
      R => '0'
    );
\data2_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_out_IBUF_BUFG,
      CE => data20,
      D => mem_reg_0_7_0_5_n_0,
      Q => data2_OBUF(1),
      R => '0'
    );
\data2_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_out_IBUF_BUFG,
      CE => data20,
      D => mem_reg_0_7_0_5_n_3,
      Q => data2_OBUF(2),
      R => '0'
    );
\data2_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_out_IBUF_BUFG,
      CE => data20,
      D => mem_reg_0_7_0_5_n_2,
      Q => data2_OBUF(3),
      R => '0'
    );
\data2_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_out_IBUF_BUFG,
      CE => data20,
      D => mem_reg_0_7_0_5_n_5,
      Q => data2_OBUF(4),
      R => '0'
    );
\data2_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_out_IBUF_BUFG,
      CE => data20,
      D => mem_reg_0_7_0_5_n_4,
      Q => data2_OBUF(5),
      R => '0'
    );
\data2_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_out_IBUF_BUFG,
      CE => data20,
      D => mem_reg_0_7_6_7_n_1,
      Q => data2_OBUF(6),
      R => '0'
    );
\data2_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_out_IBUF_BUFG,
      CE => data20,
      D => mem_reg_0_7_6_7_n_0,
      Q => data2_OBUF(7),
      R => '0'
    );
empty_OBUF_inst: unisim.vcomponents.OBUF
     port map (
      I => empty_OBUF,
      O => empty
    );
empty_flag_reg: unisim.vcomponents.LDCE
    generic map(
      INIT => '0'
    )
        port map (
      CLR => '0',
      D => empty_flag0,
      G => empty_flag_reg_i_2_n_0,
      GE => '1',
      Q => empty_OBUF
    );
empty_flag_reg_i_1: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => p_0_in0_in,
      I1 => p_1_in1_in,
      O => empty_flag0
    );
empty_flag_reg_i_2: unisim.vcomponents.LUT6
    generic map(
      INIT => X"8008200240041001"
    )
        port map (
      I0 => \write_ptr_sync_reg_n_0_[2]\,
      I1 => \write_ptr_sync_reg_n_0_[1]\,
      I2 => \read_ptr_reg_n_0_[0]\,
      I3 => \write_ptr_sync_reg_n_0_[0]\,
      I4 => \read_ptr_reg_n_0_[1]\,
      I5 => \read_ptr_reg_n_0_[2]\,
      O => empty_flag_reg_i_2_n_0
    );
full_OBUF_inst: unisim.vcomponents.OBUF
     port map (
      I => full_OBUF,
      O => full
    );
full_flag_reg: unisim.vcomponents.LDCE
    generic map(
      INIT => '0'
    )
        port map (
      CLR => '0',
      D => full_flag_reg_i_1_n_0,
      G => full_flag0,
      GE => '1',
      Q => full_OBUF
    );
full_flag_reg_i_1: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => p_1_in,
      I1 => \write_ptr_reg_n_0_[3]\,
      O => full_flag_reg_i_1_n_0
    );
full_flag_reg_i_2: unisim.vcomponents.LUT6
    generic map(
      INIT => X"8008200240041001"
    )
        port map (
      I0 => \read_ptr_sync_reg_n_0_[2]\,
      I1 => \write_ptr_reg_n_0_[1]\,
      I2 => \read_ptr_sync_reg_n_0_[0]\,
      I3 => \write_ptr_reg_n_0_[0]\,
      I4 => \read_ptr_sync_reg_n_0_[1]\,
      I5 => \write_ptr_reg_n_0_[2]\,
      O => full_flag0
    );
level_reach_OBUF_inst: unisim.vcomponents.OBUF
     port map (
      I => level_reach_OBUF,
      O => level_reach
    );
level_reach_OBUF_inst_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"6F666606"
    )
        port map (
      I0 => p_0_in0_in,
      I1 => p_1_in1_in,
      I2 => \read_ptr_reg_n_0_[2]\,
      I3 => level_reach_OBUF_inst_i_2_n_0,
      I4 => \write_ptr_sync_reg_n_0_[2]\,
      O => level_reach_OBUF
    );
level_reach_OBUF_inst_i_2: unisim.vcomponents.LUT4
    generic map(
      INIT => X"7510"
    )
        port map (
      I0 => \read_ptr_reg_n_0_[1]\,
      I1 => \read_ptr_reg_n_0_[0]\,
      I2 => \write_ptr_sync_reg_n_0_[0]\,
      I3 => \write_ptr_sync_reg_n_0_[1]\,
      O => level_reach_OBUF_inst_i_2_n_0
    );
mem_reg_0_7_0_5: unisim.vcomponents.RAM32M
    generic map(
      INIT_A => X"0000000000000000",
      INIT_B => X"0000000000000000",
      INIT_C => X"0000000000000000",
      INIT_D => X"0000000000000000"
    )
        port map (
      ADDRA(4 downto 3) => B"00",
      ADDRA(2) => \read_ptr_reg_n_0_[2]\,
      ADDRA(1) => \read_ptr_reg_n_0_[1]\,
      ADDRA(0) => \read_ptr_reg_n_0_[0]\,
      ADDRB(4 downto 3) => B"00",
      ADDRB(2) => \read_ptr_reg_n_0_[2]\,
      ADDRB(1) => \read_ptr_reg_n_0_[1]\,
      ADDRB(0) => \read_ptr_reg_n_0_[0]\,
      ADDRC(4 downto 3) => B"00",
      ADDRC(2) => \read_ptr_reg_n_0_[2]\,
      ADDRC(1) => \read_ptr_reg_n_0_[1]\,
      ADDRC(0) => \read_ptr_reg_n_0_[0]\,
      ADDRD(4 downto 3) => B"00",
      ADDRD(2) => \write_ptr_reg_n_0_[2]\,
      ADDRD(1) => \write_ptr_reg_n_0_[1]\,
      ADDRD(0) => \write_ptr_reg_n_0_[0]\,
      DIA(1 downto 0) => data1_IBUF(1 downto 0),
      DIB(1 downto 0) => data1_IBUF(3 downto 2),
      DIC(1 downto 0) => data1_IBUF(5 downto 4),
      DID(1 downto 0) => B"00",
      DOA(1) => mem_reg_0_7_0_5_n_0,
      DOA(0) => mem_reg_0_7_0_5_n_1,
      DOB(1) => mem_reg_0_7_0_5_n_2,
      DOB(0) => mem_reg_0_7_0_5_n_3,
      DOC(1) => mem_reg_0_7_0_5_n_4,
      DOC(0) => mem_reg_0_7_0_5_n_5,
      DOD(1 downto 0) => NLW_mem_reg_0_7_0_5_DOD_UNCONNECTED(1 downto 0),
      WCLK => clk_in_IBUF_BUFG,
      WE => p_0_in0_out
    );
mem_reg_0_7_0_5_i_1: unisim.vcomponents.LUT3
    generic map(
      INIT => X"04"
    )
        port map (
      I0 => full_OBUF,
      I1 => we_IBUF,
      I2 => res_IBUF,
      O => p_0_in0_out
    );
mem_reg_0_7_6_7: unisim.vcomponents.RAM32M
    generic map(
      INIT_A => X"0000000000000000",
      INIT_B => X"0000000000000000",
      INIT_C => X"0000000000000000",
      INIT_D => X"0000000000000000"
    )
        port map (
      ADDRA(4 downto 3) => B"00",
      ADDRA(2) => \read_ptr_reg_n_0_[2]\,
      ADDRA(1) => \read_ptr_reg_n_0_[1]\,
      ADDRA(0) => \read_ptr_reg_n_0_[0]\,
      ADDRB(4 downto 3) => B"00",
      ADDRB(2) => \read_ptr_reg_n_0_[2]\,
      ADDRB(1) => \read_ptr_reg_n_0_[1]\,
      ADDRB(0) => \read_ptr_reg_n_0_[0]\,
      ADDRC(4 downto 3) => B"00",
      ADDRC(2) => \read_ptr_reg_n_0_[2]\,
      ADDRC(1) => \read_ptr_reg_n_0_[1]\,
      ADDRC(0) => \read_ptr_reg_n_0_[0]\,
      ADDRD(4 downto 3) => B"00",
      ADDRD(2) => \write_ptr_reg_n_0_[2]\,
      ADDRD(1) => \write_ptr_reg_n_0_[1]\,
      ADDRD(0) => \write_ptr_reg_n_0_[0]\,
      DIA(1 downto 0) => data1_IBUF(7 downto 6),
      DIB(1 downto 0) => B"00",
      DIC(1 downto 0) => B"00",
      DID(1 downto 0) => B"00",
      DOA(1) => mem_reg_0_7_6_7_n_0,
      DOA(0) => mem_reg_0_7_6_7_n_1,
      DOB(1 downto 0) => NLW_mem_reg_0_7_6_7_DOB_UNCONNECTED(1 downto 0),
      DOC(1 downto 0) => NLW_mem_reg_0_7_6_7_DOC_UNCONNECTED(1 downto 0),
      DOD(1 downto 0) => NLW_mem_reg_0_7_6_7_DOD_UNCONNECTED(1 downto 0),
      WCLK => clk_in_IBUF_BUFG,
      WE => p_0_in0_out
    );
re_IBUF_inst: unisim.vcomponents.IBUF
     port map (
      I => re,
      O => re_IBUF
    );
\read_ptr[0]_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \read_ptr_reg_n_0_[0]\,
      O => p_0_in(0)
    );
\read_ptr[1]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \read_ptr_reg_n_0_[1]\,
      I1 => \read_ptr_reg_n_0_[0]\,
      O => \plusOp__0\(1)
    );
\read_ptr[2]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"6A"
    )
        port map (
      I0 => \read_ptr_reg_n_0_[2]\,
      I1 => \read_ptr_reg_n_0_[1]\,
      I2 => \read_ptr_reg_n_0_[0]\,
      O => \plusOp__0\(2)
    );
\read_ptr[3]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => re_IBUF,
      I1 => empty_OBUF,
      O => data21
    );
\read_ptr[3]_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"6AAA"
    )
        port map (
      I0 => p_1_in1_in,
      I1 => \read_ptr_reg_n_0_[1]\,
      I2 => \read_ptr_reg_n_0_[0]\,
      I3 => \read_ptr_reg_n_0_[2]\,
      O => \plusOp__0\(3)
    );
\read_ptr_reg[0]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_out_IBUF_BUFG,
      CE => data21,
      CLR => res_IBUF,
      D => p_0_in(0),
      Q => \read_ptr_reg_n_0_[0]\
    );
\read_ptr_reg[1]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_out_IBUF_BUFG,
      CE => data21,
      CLR => res_IBUF,
      D => \plusOp__0\(1),
      Q => \read_ptr_reg_n_0_[1]\
    );
\read_ptr_reg[2]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_out_IBUF_BUFG,
      CE => data21,
      CLR => res_IBUF,
      D => \plusOp__0\(2),
      Q => \read_ptr_reg_n_0_[2]\
    );
\read_ptr_reg[3]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_out_IBUF_BUFG,
      CE => data21,
      CLR => res_IBUF,
      D => \plusOp__0\(3),
      Q => p_1_in1_in
    );
\read_ptr_sync_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_in_IBUF_BUFG,
      CE => '1',
      D => read_ptr_temp(0),
      Q => \read_ptr_sync_reg_n_0_[0]\,
      R => '0'
    );
\read_ptr_sync_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_in_IBUF_BUFG,
      CE => '1',
      D => read_ptr_temp(1),
      Q => \read_ptr_sync_reg_n_0_[1]\,
      R => '0'
    );
\read_ptr_sync_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_in_IBUF_BUFG,
      CE => '1',
      D => read_ptr_temp(2),
      Q => \read_ptr_sync_reg_n_0_[2]\,
      R => '0'
    );
\read_ptr_sync_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_in_IBUF_BUFG,
      CE => '1',
      D => read_ptr_temp(3),
      Q => p_1_in,
      R => '0'
    );
\read_ptr_temp_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_in_IBUF_BUFG,
      CE => '1',
      D => \read_ptr_reg_n_0_[0]\,
      Q => read_ptr_temp(0),
      R => '0'
    );
\read_ptr_temp_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_in_IBUF_BUFG,
      CE => '1',
      D => \read_ptr_reg_n_0_[1]\,
      Q => read_ptr_temp(1),
      R => '0'
    );
\read_ptr_temp_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_in_IBUF_BUFG,
      CE => '1',
      D => \read_ptr_reg_n_0_[2]\,
      Q => read_ptr_temp(2),
      R => '0'
    );
\read_ptr_temp_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_in_IBUF_BUFG,
      CE => '1',
      D => p_1_in1_in,
      Q => read_ptr_temp(3),
      R => '0'
    );
res_IBUF_inst: unisim.vcomponents.IBUF
     port map (
      I => res,
      O => res_IBUF
    );
we_IBUF_inst: unisim.vcomponents.IBUF
     port map (
      I => we,
      O => we_IBUF
    );
\write_ptr[0]_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \write_ptr_reg_n_0_[0]\,
      O => plusOp(0)
    );
\write_ptr[1]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \write_ptr_reg_n_0_[1]\,
      I1 => \write_ptr_reg_n_0_[0]\,
      O => plusOp(1)
    );
\write_ptr[2]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"6A"
    )
        port map (
      I0 => \write_ptr_reg_n_0_[2]\,
      I1 => \write_ptr_reg_n_0_[1]\,
      I2 => \write_ptr_reg_n_0_[0]\,
      O => plusOp(2)
    );
\write_ptr[3]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => we_IBUF,
      I1 => full_OBUF,
      O => p_1_out
    );
\write_ptr[3]_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"6AAA"
    )
        port map (
      I0 => \write_ptr_reg_n_0_[3]\,
      I1 => \write_ptr_reg_n_0_[1]\,
      I2 => \write_ptr_reg_n_0_[0]\,
      I3 => \write_ptr_reg_n_0_[2]\,
      O => plusOp(3)
    );
\write_ptr_reg[0]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_in_IBUF_BUFG,
      CE => p_1_out,
      CLR => res_IBUF,
      D => plusOp(0),
      Q => \write_ptr_reg_n_0_[0]\
    );
\write_ptr_reg[1]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_in_IBUF_BUFG,
      CE => p_1_out,
      CLR => res_IBUF,
      D => plusOp(1),
      Q => \write_ptr_reg_n_0_[1]\
    );
\write_ptr_reg[2]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_in_IBUF_BUFG,
      CE => p_1_out,
      CLR => res_IBUF,
      D => plusOp(2),
      Q => \write_ptr_reg_n_0_[2]\
    );
\write_ptr_reg[3]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_in_IBUF_BUFG,
      CE => p_1_out,
      CLR => res_IBUF,
      D => plusOp(3),
      Q => \write_ptr_reg_n_0_[3]\
    );
\write_ptr_sync_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_out_IBUF_BUFG,
      CE => '1',
      D => write_ptr_temp(0),
      Q => \write_ptr_sync_reg_n_0_[0]\,
      R => '0'
    );
\write_ptr_sync_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_out_IBUF_BUFG,
      CE => '1',
      D => write_ptr_temp(1),
      Q => \write_ptr_sync_reg_n_0_[1]\,
      R => '0'
    );
\write_ptr_sync_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_out_IBUF_BUFG,
      CE => '1',
      D => write_ptr_temp(2),
      Q => \write_ptr_sync_reg_n_0_[2]\,
      R => '0'
    );
\write_ptr_sync_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_out_IBUF_BUFG,
      CE => '1',
      D => write_ptr_temp(3),
      Q => p_0_in0_in,
      R => '0'
    );
\write_ptr_temp_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_out_IBUF_BUFG,
      CE => '1',
      D => \write_ptr_reg_n_0_[0]\,
      Q => write_ptr_temp(0),
      R => '0'
    );
\write_ptr_temp_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_out_IBUF_BUFG,
      CE => '1',
      D => \write_ptr_reg_n_0_[1]\,
      Q => write_ptr_temp(1),
      R => '0'
    );
\write_ptr_temp_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_out_IBUF_BUFG,
      CE => '1',
      D => \write_ptr_reg_n_0_[2]\,
      Q => write_ptr_temp(2),
      R => '0'
    );
\write_ptr_temp_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_out_IBUF_BUFG,
      CE => '1',
      D => \write_ptr_reg_n_0_[3]\,
      Q => write_ptr_temp(3),
      R => '0'
    );
end STRUCTURE;
