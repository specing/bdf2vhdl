#
# @file Makefile @brief bdf2vhdl - converts bdf font files into VHDL files
#
# Copyright (c) 2009, 2010 by Lutz Sammer.  All Rights Reserved.
#
# Contributor(s):
#
# License: AGPLv3
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU Affero General Public License as
# published by the Free Software Foundation, either version 3 of the
# License.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU Affero General Public License for more details.
#
# $Id$

CC      = gcc
LIBS    =
CFLAGS  = -Os -Werror -W -Wall
LDFLAGS =

OBJS    = bdf2vhdl.o
HDRS    =
FILES   = Makefile AGPL-3.0.txt README.txt Changelog.txt

all: bdf2vhdl

$(OBJS): $(HDRS) Makefile

bdf2vhdl: $(OBJS)
	$(CC) -o $@ $(CFLAGS) $(LDFLAGS) $^ $(LIBS)

#----------------------------------------------------------------------------
# Developer tools

doc:	$(SRCS) $(HDRS) bdf2vhdl.doxyfile
	(cat bdf2vhdl.doxyfile; \
	echo 'PROJECT_NUMBER=${VERSION} $(if $(GIT_REV), (GIT-$(GIT_REV)))') \
	| doxygen -

indent:
	for i in $(OBJS:.o=.c) $(HDRS); do \
		indent $$i; unexpand -a $$i > $$i.up; mv $$i.up $$i; \
	done

clean:
	-rm *.o *~

clobber:	clean
	-rm bdf2vhdl

dist:
	tar cjCf .. bdf2vhdl-`date +%F-%H`.tar.bz2 \
		$(addprefix bdf2vhdl/, $(FILES) $(OBJS:.o=.c))

install:
	strip --strip-unneeded -R .comment bdf2vhdl
	install -s bdf2vhdl /usr/local/bin/

commit:
	git commit $(OBJS:.o=.c) $(HDRS) $(FILES)

help:
	@echo "make all|doc|indent|clean|clobber|dist|install|help"
