.PHONY: clean all

all: diamond3d.png diamond3d.ico

diamond3d.png : diamond3d.asy
	asy -f png -render 100  diamond3d.asy

diamond3d_transparent.png : diamond3d.png
	convert -transparent white diamond3d.png diamond3d_transparent.png


diamond3d.ico : diamond3d.asy
	asy -f ico -render 32  diamond3d.asy
clean:
	rm -rf *.png *.ico
