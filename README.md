# Fontconverter docker image

This image runs the font converter app from [Adafruits GFX library](https://github.com/adafruit/Adafruit-GFX-Library).

With this image you don't have to compile the (admittedly) small app yourself and more importingly install a bunch of 
software onto your machine.

I also hade problems compiling it on Mac OS X, which why I initially wrote this docker file.

## Usage

`cd` into the directory containing a font file.

Run `docker run --rm -i -t -v `pwd`:/fonts sepal/fontconverter fontconvert [font_file] [size] > [out_file]`, 
replacing `[font_file]` with the font file you wan't to convert, `[size]` with the the font size and `[out_file]` 
the file the c header file containg the font.

The commands runs the fontconvert file in a container with the current directory attaached it as volume. After fontconvert
finishes, it will automatically remove the container again.

## Example

```
# Download the Inconsolata font from squirrel fonts. Inconsolata is nice monospaced font.
wget http://www.fontsquirrel.com/fonts/download/Inconsolata

# Unzip the archive.
unzip Inconsolata

# Convert the font with the size 12 and write it into a new Inconsolata.h file.
docker run --rm -i -t -v `pwd`:/fonts sepal/fontconverter fontconvert Inconsolata.otf 12 > Inconsolata.h
```
