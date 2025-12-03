SRCDIR ?= /opt/fpp/src
include $(SRCDIR)/makefiles/common/setup.mk
include $(SRCDIR)/makefiles/platform/*.mk

all: libfpp-HomeAssistant-zack.$(SHLIB_EXT)
debug: all

CFLAGS+=-I.
OBJECTS_fpp_HomeAssistant-zack_so += src/FPP-HomeAssistant-zack.o
LIBS_fpp_HomeAssistant-zack_so += -L$(SRCDIR) -lfpp -ljsoncpp -lhttpserver
CXXFLAGS_src/FPP-HomeAssistant-zack.o += -I$(SRCDIR)


%.o: %.cpp Makefile
	$(CCACHE) $(CC) $(CFLAGS) $(CXXFLAGS) $(CXXFLAGS_$@) -c $< -o $@

libfpp-HomeAssistant-zack.$(SHLIB_EXT): $(OBJECTS_fpp_HomeAssistant-zack_so) $(SRCDIR)/libfpp.$(SHLIB_EXT)
	$(CCACHE) $(CC) -shared $(CFLAGS_$@) $(OBJECTS_fpp_HomeAssistant-zack_so) $(LIBS_fpp_HomeAssistant-zack_so) $(LDFLAGS) -o $@

clean:
	rm -f libfpp-HomeAssistant-zack.so $(OBJECTS_fpp_HomeAssistant-zack_so)

