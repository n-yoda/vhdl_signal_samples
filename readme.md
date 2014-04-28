VHDL signal samples
====

## 概要
if, case, when, selectや、functionとprocedure、process文の使い方の例文集です。
クロックの立ち上がり時に、入力a, bに対して、cに「if b = 1 then a else not a」=「a xor (not b)」を出力するVHDLのコンポーネントを、いろいろな書き方で書いてみた、という感じです。

以下は全て、「a xor (not b)」を計算してtempに代入しておき、clkの立ち上がりでtempをcに代入して出力する、という全く同じ動作をするコードです。
entity宣言とcycleプロセスは共通なので、各ファイル真ん中の数〜十数行を見て下さい。

1. concurrent_when.vhd
	* whenを使った最もシンプルな書き方。
	* processの外で、x <= y when w else z の形。
2. concurrent_function.vhd
	* 1の右辺をfunctionにしたもの。
3. concurrent_procedure.vhd
	* 1をprocedureにしたもの。
	* 9と違い、procのzがsignalであることに注意。
4. concurrent_select.vhd
	* processの外で、with x select y <= z when x0 ... の形
	* case ~ isをprocessの外でやる場合。
5. process_if.vhd
	* 1を素直にprocess文に書き直したもの。
6. process_when.vhd
	* 5のif文をcase文に置き換えたもの。
7. process_wait.vhd
	* wait onを使ったもの（XSTでは論理合成不可）
8. process_procedure.vhd（←用意するの忘れてた）
	* process内でprocedureを使うサンプル。
	* procedureの記述が3と同じで、9とは異なる。
9. variable_procedure.vhd
	* procedureの出力がvariableの場合。
	* 3と違い、procのzがsignalで無いことに注意。

process_wrong.vhdは、間違いの例であり、calcのsensitivity listが(clk)になっているので、信号の変化するタイミングが1クロック遅れます。

## Requirements
* [GHDL](http://ghdl.free.fr/)
* erb
* GNU Make

## テスト
makeでtest.vhdを実行してテストします。

```
$ make test.run
erb components.erb.vhd > components.vhd
ghdl -a components.vhd
ghdl -a concurrent_when.vhd
ghdl -a concurrent_select.vhd
ghdl -a concurrent_procedure.vhd
ghdl -a concurrent_function.vhd
ghdl -a process_case.vhd
ghdl -a process_if.vhd
ghdl -a process_wait.vhd
ghdl -a variable_procedure.vhd
erb test.erb.vhd > test.vhd
ghdl -a test.vhd
ghdl -r test
```
ghdl -r testでテスト失敗するとエラーが出るはず。

## 動作環境
test.vhdはMacOSX上のGHDLでの動作のみ確認済み。
