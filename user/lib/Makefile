LIB_NAME = sample
INCLUDE_DIR = include
LIB_SRC_DIR = src
LIB_OBJ_DIR = build
LIB_SOURCES = $(wildcard $(LIB_SRC_DIR)/*.c)
LIB_OBJS = $(patsubst $(LIB_SRC_DIR)/%.c, $(LIB_OBJ_DIR)/%.o ,$(LIB_SOURCES))
LIB_A = $(LIB_OBJ_DIR)/lib$(LIB_NAME).a

ifdef DEBUG
EXTRA_FLAGS = -g
endif

.PHONY: all debug release clean

all: clean $(LIB_A)

release: 
	$(MAKE)

debug: 
	DEBUG=1 $(MAKE) 

clean:
	rm -rf $(LIB_OBJ_DIR)
	mkdir $(LIB_OBJ_DIR)

$(LIB_A): $(LIB_OBJS)
	ar rsc $@ $^

$(LIB_OBJ_DIR)/%.o: $(LIB_SRC_DIR)/%.c
	gcc $(EXTRA_FLAGS) -I$(INCLUDE_DIR) -c $< -o $@

test: 
	@echo $(SRC_DIR)
	@echo $(LIB_SOURCES)
	@echo $(LIB_OBJS)