package com.geraudbourdin.svgview;
import org.appcelerator.kroll.annotations.Kroll;
import org.appcelerator.titanium.proxy.TiViewProxy;
import org.appcelerator.titanium.view.TiUIView;

import android.app.Activity;

@Kroll.proxy(creatableInModule = SvgViewModule.class, propertyAccessors= {"image"})
public class ViewProxy extends TiViewProxy {
	private static final String LCAT = "SvgViewModule.ViewProxy";

	public ViewProxy() {
		super();
	}

	@Override
	public TiUIView createView(Activity activity) {
		SvgView view = new SvgView(this);
		view.getLayoutParams().autoFillsHeight = true;
		view.getLayoutParams().autoFillsWidth = true;
		return view;
	}
}