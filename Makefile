include Dependfile

default: test.run

%.run: %.analyze
	ghdl -r $*

%.analyze: %.vhd
	ghdl -a $<

%.vhd: %.erb.vhd components.rb
	erb $< > $@

Dependfile: Dependfile.erb components.rb
	erb $< > $@

clean:
	rm -rf *.cf
	rm Dependfile
	for f in *.erb.vhd; do rm -f $${f%.erb.vhd}.vhd; done
