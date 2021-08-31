LIB_DIR = lib
LIB_PATH = $(LIB_DIR)/build/libsample.a
EXE_BUILD_DIR = build
ifdef DEBUG
EXE_SOURCES = $(wildcard *.c)
EXTRA_FLAGS = -g -O0 -D DEBUG
else
EXE_SOURCES = first.c
EXTRA_FLAGS = -s -O2
endif
EXE_OBJS = $(patsubst %.c, $(EXE_BUILD_DIR)/%.o, $(EXE_SOURCES))
INCLUDE_FLAGS = -I$(LIB_DIR)/include
.PHONY: release debug clean exe
release: clean
	cd $(LIB_DIR) && $(MAKE) release && cd $(PWD)
	$(MAKE) exe
debug: clean
	cd $(LIB_DIR) && $(MAKE) debug && cd $(PWD)
	DEBUG=1 $(MAKE) exe

clean:
	rm -rf $(EXE_BUILD_DIR)
	mkdir $(EXE_BUILD_DIR)
	cd $(LIB_DIR) && $(MAKE) clean && cd $(PWD)

exe: $(EXE_OBJS)

$(EXE_BUILD_DIR)/%.o: %.c
	@echo $@
	gcc --static $(INCLUDE_FLAGS) $(EXTRA_FLAGS) $< $(LIB_PATH) -o $@
