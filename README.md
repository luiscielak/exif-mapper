Exif Mapper
===

Dependencies
---

### MagickImage

http://imagemagick.org/

> Place all the images you wish to resize in the same directory and create a new folder called thumbs under the same directory.

> The IM tool we use is mogrify. It lets us apply various filters and operations to the images in just one step. Open terminal and go to the directory where you placed the images. What we are going to do is to resize all pictures to 80×80 pixels keeping proportions (no stretch or squash) and then extend the canvas size to exactly 80×80 pixels so that all thumbnails have the same size.


```mogrify -resize 80x80 -background white -gravity center -extent 80x80 -format jpg -quality 75 -path thumbs *.png```

