# Bitmap editor

## Commands

There are 6 supported commands:

* **I M N** - Create a new M x N image with all pixels colored white (O).
* **C** - Clears the table, setting all pixels to white (O).
* **L X Y C** - Colours the pixel (X,Y) with color C.
* **V X Y1 Y2 C** - Draws a vertical segment of color C in column X between rows Y1 and Y2 (inclusive).
* **H X1 X2 Y C** - Draws a horizontal segment of color C in row Y between columns X1 and X2 (inclusive).
* **S** - Show the contents of the current image

# Running

`>bin/bitmap_editor examples/show.txt`
