var win = Ti.UI.createWindow({
	backgroundColor:'white'
});
var label = Ti.UI.createLabel();
win.add(label);
win.open();

var svgView = require('com.geraudbourdin.svgview');
var svg = svgView.createView({
	image: "file.svg",
	width: '350',
	height: '350',
	top: 0,
	left: 0,
	backgroundColor:'red'
});
win.add(svg);

svg.setImage("otherFile.svg");