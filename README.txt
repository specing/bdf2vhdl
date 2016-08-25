@file README @brief BDF Font to VHDL source convertor readme

Copyright (c) 2009, 2010 by Lutz Sammer.  All Rights Reserved.

Contributor(s): Fedja Beader

License: AGPLv3

This program is free software: you can redistribute it and/or modify
it under the terms of the GNU Affero General Public License as
published by the Free Software Foundation, either version 3 of the
License.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU Affero General Public License for more details.

$Id$

My version of BDF fonts convertor to C includes, which can be used to
embed fonts into the executable.

Usage:
    ./bdf2vhdl -c

    Print #defines for font files to stdout.

    ./bdf2vhdl -C font.h

    Create font.h, which contains #defines for fonts.

    ./bdf2vhdl -b < font.bdf > font.vhd

    Create font.vhd which contains the converted bdf font.

The VHDL file contains: (well some of this...)

    Bitmap data for the characters.
    Character width table for proportional font
    Character codes table for utf-8 font

TODO:
    Proportional fonts (f.e. generated from ttf2bdf) aren't yet supported.
    Example how to use the created font file.
