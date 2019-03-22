# ******************************************************************************
# chroma_key.pro                                                   Tao3D project
# ******************************************************************************
#
# File description:
#
#
#
#
#
#
#
#
# ******************************************************************************
# This software is licensed under the GNU General Public License v3
# (C) 2019, Christophe de Dinechin <christophe@dinechin.org>
# (C) 2012, Jérôme Forissier <jerome@taodyne.com>
# ******************************************************************************
# This file is part of Tao3D
#
# Tao3D is free software: you can r redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# Tao3D is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with Tao3D, in a file named COPYING.
# If not, see <https://www.gnu.org/licenses/>.
# ******************************************************************************
MODINSTDIR = chroma_key

include(../modules.pri)

SHADERS = 3rdparty/libavg/src/graphics/shaders/chromakey.frag \
          3rdparty/libavg/src/graphics/shaders/helper.frag

OTHER_FILES = chroma_key.xl \
              $$SHADERS

# Original icon file from http://www.iconfinder.com/icondetails/50702/48/man_person_user_icon
# Author: Oliver Twardowski - http://www.addictedtocoffee.de/
# License: Free for commercial use (Do not redistribute)
#          http://www.iconfinder.com/browse/iconset/iconset-addictive-flavour/#readme
# Green background added by myself
INSTALLS    += thismod_icon
INSTALLS    -= thismod_bin

QMAKE_SUBSTITUTES = doc/Doxyfile.in
QMAKE_DISTCLEAN = doc/Doxyfile
DOXYFILE = doc/Doxyfile
DOXYLANG = en,fr
include(../modules_doc.pri)

shader.path = $${MODINSTPATH}
shader.target = chroma_key.frag
shader.commands = ./preprocess.sh 3rdparty/libavg/src/graphics/shaders/chromakey.frag > chroma_key.frag ; cp chroma_key.frag \"$${MODINSTPATH}\"
shader.depends = $$SHADERS
QMAKE_EXTRA_TARGETS += shader
INSTALLS    += shader
QMAKE_CLEAN += chroma_key.frag
