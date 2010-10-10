# Environment

TEST=          test
MKDIR=         mkdir
CC=            fpc

BIN_DIR=       ./bin/
SRC_DIR=       ./src/


compile:
	test -d $(BIN_DIR) || $(MKDIR) $(BIN_DIR)
	$(CC) -o$(BIN_DIR)AddressBook $(SRC_DIR)AddressBook.pas

