# portable_screw_driver_set automatic STL-model generator

OPENSCAD="C:\Program Files\OpenSCAD\openscad.exe"
#OPENSCAD=openscad.exe
RM=rm -f
OPENSCAD_OPTIONS=-DVERBOSE=false
IMAGE_OPTIONS=--imgsize=1024,768 --colorscheme=DeepOcean

# Names of parts to build
SCADS=$(wildcard *.scad)
LIB_SCADS=$(wildcard lib/*.scad)

STLS=$(SCADS:.scad=.stl)
PNGS=$(SCADS:.scad=.png)

all: $(STLS) $(PNGS)

clean:
	@$(RM) $(STLS) $(PNGS)

%.stl: %.scad $(LIB_SCADS) Makefile
	@echo "Making $@ from $< ..."
	@$(OPENSCAD) $(OPENSCAD_OPTIONS) -o $@ $<

%.png: %.scad $(LIB_SCADS) Makefile
	@echo "Making $@ from $< ..."
	@$(OPENSCAD) $(OPENSCAD_OPTIONS) -o $@ $(IMAGE_OPTIONS) $<
