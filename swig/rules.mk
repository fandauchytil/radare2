LIBS=r_util.so r_bp.so r_asm.so r_diff.so r_core.so r_bin.so

.SUFFIXES: .so

all: ${LIBS}

%.so:
	@if test ../../libr/vapi/`echo $@|sed -e s,.so,.vapi,` -nt ${LIBS_PFX}$@ ; then \
	(cd .. && sh do-swig.sh ${LANG} `echo $@ | sed -e s,.so,,`) ; \
	fi

test:
	-${LANG} test-r_bp.${LANG_EXT}
	-${LANG} test-r_asm.${LANG_EXT}
	-${LANG} test-r_hash.${LANG_EXT}

clean:
	rm -f *.so r_*

.PHONY: all test clean
