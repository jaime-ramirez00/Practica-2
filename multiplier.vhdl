--Jaime Andres Ramirez Stanford
--A00825248
--Laboratorio de Sistemas digitales
--Multiplicador Booth de 4 bits, con salida de 8 bits, complemento a 2.


entity Multiplicator is
port(A,B: in std_logic_vector(3 downto 0);
Result: out std_logic_vector(7 downto 0));
end Multiplicator;

architecture Behavior of Multiplicator is

component fullAdder is
    Port ( x : in  std_logic;
           y : in  std_logic;
           cin : in  std_logic;
           cout : out  std_logic;
           sum : out  std_logic);
end component;

signal cand1,cand2,cand3,cand4,cand5,cand6,cand7,cand8,cand9,cand10:std_logic;
signal cnand1,cnand2,cnand3,cnand4,cnand5,cnand6:std_logic;
signal out1,out2,out3,out4,out5,out6,out7,out8,out9,out10,out11,out12,out13:std_logic;
signal c1,c2,c3,c4,c5,c6,c7,c8,c9,c10,c11,c12,c13:std_logic;

begin

cand1<=A(0)AND B(0);
cand2<=A(1)AND B(0);
cand3<=A(2)AND B(0);
cand4<=A(0)AND B(1);
cand5<=A(1)AND B(1);
cand6<=A(2)AND B(1);
cand7<=A(0)AND B(2);
cand8<=A(1)AND B(2);
cand9<=A(2)AND B(2);
cand10<=A(3)AND B(3);

cnand1<=A(3) NAND B(0);
cnand2<=A(3) NAND B(1);
cnand3<=A(3) NAND B(2);
cnand4<=A(0) NAND B(3);
cnand5<=A(1) NAND B(3);
cnand6<=A(2) NAND B(3);

HA1:fullAdder port map(cand1,cand4,'0',c1,out1);
FA2:fullAdder port map(cand3,cand5,c1,c2,out2);
FA3:fullAdder port map(cnand1,cand6,c2,c3,out3);
FA4:fullAdder port map('1',cnand2,c3,c4,out4);
HA5:fullAdder port map(out2,cand7,'0',c5,out5);
FA6:fullAdder port map(out3,cand8,c5,c6,out6);
FA7:fullAdder port map(out4,cand9,c6,c7,out7);
FA8:fullAdder port map(c4,cnand3,c7,c8,out8);
HA9:fullAdder port map(out6,cnand4,'0',c9,out9);
FA10:fullAdder port map(out7,cnand5,c9,c10,out10);
FA11:fullAdder port map(out8,cnand6,c10,c11,out11);
FA12:fullAdder port map(c8,cand10,c11,c12,out12);
HA13:fullAdder port map('1',c12,'0',c13,out13);

Result(0)<=cand1;
Result(1)<=out1;
Result(2)<=out5;
Result(3)<=out9;
Result(4)<=out10;
Result(5)<=out11;
Result(6)<=out12;
Result(7)<=out13;

end Behavior;
