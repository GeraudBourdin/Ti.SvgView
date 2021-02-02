# Ti.SvgView Module

## Description

This module simply create a view from an svg file by exposing the androidsvg-1.3 lib and the SVGKit 2.X for IOS lib.

## Quick Start

### Get it [![gitTio](http://gitt.io/badge.png)](http://gitt.io/component/com.geraudbourdin.svgview)
Download the latest distribution ZIP-file and consult the [Titanium Documentation](http://docs.appcelerator.com/titanium/latest/#!/guide/Using_a_Module) on how install it, or simply use the [gitTio CLI](http://gitt.io/cli):

`$ gittio install com.geraudbourdin.svgview`

## Usage :

```javascript
var svgView = require('com.geraudbourdin.svgview');
var svg = svgView.createView({
	image: "0.svg",
	width: '350',
	height: '350',
	top: 0,
	left: 0,
	backgroundColor:'pink'
});

$.container.add(svg);
```

You can change your file dynamically with the setImage(path) function.

```javascript
var image = 'android.svg';
svg.setImage(image);
```


Or simply use it to set an image to a button :

```javascript
var svg = svgView.createView({
	image: "android.svg",
	width: '50',
	height: '50',
	top: 0,
	left: 0,
	backgroundColor:'pink'
});

var svgImage = svg.toImage().media;
$.buttonSvg.setImage(svgImage);
```

## License
The MIT License (MIT)

Copyright © 2015 Géraud Bourdin

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the “Software”), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED “AS IS”, WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
