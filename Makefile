.PHONY: clean
prog_name=source
dump_name=$(prog_name).dump
executable_name=$(prog_name).elf

default: $(dump_name) $(executable_name)

%.elf : %.c
	@riscv64-unknown-elf-gcc -march=rv32i -mabi=ilp32 $< -o $@

%.dump: %.elf
	@riscv64-unknown-elf-objdump -D $< > $@

clean:
	@rm -f $(dump_name)
	@rm -f $(executable_name)
