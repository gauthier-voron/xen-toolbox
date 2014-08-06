SCR     := scripts/

prefix := $(abspath $(PREFIX))


install:
	-mkdir -p $(prefix)/opt/xen-toolbox/bin
	-mkdir -p $(prefix)/usr/bin
	cp $(wildcard $(SCR)*) $(prefix)/opt/xen-toolbox/bin
	for tool in $(patsubst $(SCR)%, %, $(wildcard $(SCR)*)) ; do \
	    rm $(prefix)/usr/bin/$$tool 2>/dev/null || true ; \
	    ln -s $(prefix)/opt/xen-toolbox/bin/$$tool $(prefix)/usr/bin/ ; \
	done

uninstall:
	for tool in $(patsubst $(prefix)/opt/xen-toolbox/bin/%, %, \
			$(wildcard $(prefix)/opt/xen-toolbox/bin/*)) ; do \
	    rm $(prefix)/usr/bin/$$tool ; \
	    rm -rf $(prefix)/opt/xen-toolbox ; \
	done


clean:
	find . -name "*~" -exec rm {} \;
