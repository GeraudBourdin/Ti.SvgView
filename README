# Ti.SvgView Module

## Description

This module simply create a view from an svg file by exposing the androidsvg-1.2.1 lib and the SVGKit 2.X for IOS lib. 

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
	width: '350',
	height: '350',
	top: 0,
	left: 0,
	backgroundColor:'pink'
});

var svgImage = svg.toImage().media;
$.buttonSvg.setImage(svgImage);
```



