# faceblender

I needed a montage of profile pictures for a web project I was working on. Sadly, I couldn't find anything to generate one for me, so I wrote this one.

Here's an example!

![example
montage](https://raw.githubusercontent.com/timcheadle/faceblender/master/example.jpg)

## Installation

Just clone the repo and install necessary gems with `bundle`.

```
git clone git@github.com:timcheadle/faceblender.git
cd faceblender
bundle
```

## Usage

Just run the app.

```
./faceblender.rb
```

It will spit out an image called `faceblend.jpg`

### Customizing dimensions

For now, the only way to customize the image dimensions is to edit the
script. Find these lines at the top and change them:

```ruby
IMAGE_WIDTH = 1400
IMAGE_HEIGHT = 500
```


## Thanks

Huge thanks to [@calebogden](https://twitter.com/calebogden) for making [UI Faces](http://uifaces.com) and everyone who contributed their photos!
