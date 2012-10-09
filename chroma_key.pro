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
