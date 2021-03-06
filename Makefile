
all: sdpcontrol

sdpcontrol:
	@(cd libsdp && make)
	@(cp libsdp/libsdp.so libsdptemp.so)
	@(cd libbluetooth && make)
	@(cp libbluetooth/libbluetooth.so libbluetoothtemp.so)
	cc -O2 -pipe   -std=gnu99 -fstack-protector -Wsystem-headers -Werror -Wall -Wno-format-y2k -Wno-uninitialized -Wno-pointer-sign -Wno-empty-body -Wno-string-plus-int -Wno-unused-const-variable -Wno-tautological-compare -Wno-unused-value -Wno-parentheses-equality -Wno-unused-function -Wno-enum-conversion -Wno-switch -Wno-switch-enum -Wno-knr-promoted-parameter -Qunused-arguments -c sdpcontrol.c
	cc -O2 -pipe   -std=gnu99 -fstack-protector -Wsystem-headers -Werror -Wall -Wno-format-y2k -Wno-uninitialized -Wno-pointer-sign -Wno-empty-body -Wno-string-plus-int -Wno-unused-const-variable -Wno-tautological-compare -Wno-unused-value -Wno-parentheses-equality -Wno-unused-function -Wno-enum-conversion -Wno-switch -Wno-switch-enum -Wno-knr-promoted-parameter -Qunused-arguments -c search.c
	cc -O2 -pipe   -std=gnu99 -fstack-protector -Wsystem-headers -Werror -Wall -Wno-format-y2k -Wno-uninitialized -Wno-pointer-sign -Wno-empty-body -Wno-string-plus-int -Wno-unused-const-variable -Wno-tautological-compare -Wno-unused-value -Wno-parentheses-equality -Wno-unused-function -Wno-enum-conversion -Wno-switch -Wno-switch-enum -Wno-knr-promoted-parameter -Qunused-arguments -L./ -lsdptemp -lbluetoothtemp -o sdpcontrol sdpcontrol.o search.o 

clean:
	@(cd libsdp && make clean)
	@(cd libbluetooth && make clean)
	rm -f *.so
	rm -f *.o
	rm -f sdpcontrol
