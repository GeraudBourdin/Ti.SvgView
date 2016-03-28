package com.geraudbourdin.svgview;

import org.appcelerator.kroll.KrollDict;
import org.appcelerator.kroll.common.AsyncResult;
import org.appcelerator.kroll.common.Log;
import org.appcelerator.kroll.common.TiMessenger;
import org.appcelerator.titanium.TiApplication;
import org.appcelerator.titanium.proxy.TiViewProxy;
import org.appcelerator.titanium.view.TiDrawableReference;
import org.appcelerator.titanium.view.TiUIView;

import ti.modules.titanium.filesystem.FileProxy;
import android.app.Activity;
import android.os.Handler;
import android.os.Looper;
import android.os.Message;
import android.widget.LinearLayout;
import android.widget.LinearLayout.LayoutParams;

import com.caverock.androidsvg.SVG;
import com.caverock.androidsvg.SVGImageView;
import com.caverock.androidsvg.SVGParseException;

public class SvgView extends TiUIView implements Handler.Callback {
	private static final String TAG = "SvgViewModule.SvgView";
	private static final int SET_IMAGE = 70000;
	
	private TiDrawableReference imageSource;
	
	private Handler mainHandler = new Handler(Looper.getMainLooper(), this);
	
	private SVGImageView svgImageView;	

	public SvgView(TiViewProxy proxy) {
		super(proxy);
		
		Activity activity = proxy.getActivity();
		svgImageView = new SVGImageView(activity);
		setNativeView(new LinearLayout(activity));
	}
	
	private LinearLayout getView()
	{
		return (LinearLayout) nativeView;
	}
	
	@Override
	public void processProperties(KrollDict d)
	{
		LinearLayout view = getView();
		if (view == null) {
			return;
		}
		
		if (d.containsKey("image")) {
			boolean changeImage = true;
			TiDrawableReference source = makeImageSource(d.get("image"));
			if (imageSource != null && imageSource.equals(source)) {
				changeImage = false;				
			}
			if (changeImage) {
				imageSource = source;				
				setImageInternal();
			}
		}
		
		super.processProperties(d);
	}
	
	private void setImageInternal() {		
		setImage(null);		

		if (imageSource == null || imageSource.isTypeNull()) {
			return;
		}		

		if (imageSource.isNetworkUrl()) {
			Log.e(TAG, "Load from netfork not supported");			
		} else {
			SVG svgImage = null;
			try {
				svgImage = SVG.getFromInputStream(imageSource.getInputStream());
			} catch (SVGParseException e) {
				Log.e(TAG, "Failed to set svg from input stream.");
			}
						
			setImage(svgImage);			
		}		
	}
	
	private void setImage(final SVG svgImage)
	{
		if (!TiApplication.isUIThread()) {
			TiMessenger.sendBlockingMainMessage(mainHandler.obtainMessage(SET_IMAGE), svgImage);
		} else {
			handleSetImage(svgImage);
		}
	}

	private void handleSetImage(final SVG svgImage)
	{
		LinearLayout view = getView();
		if (view != null) {			
			view.removeAllViews();
			if(svgImage != null) {
				svgImageView.setSVG(svgImage);			
				view.addView(svgImageView, 
					new LinearLayout.LayoutParams(LayoutParams.MATCH_PARENT, LayoutParams.MATCH_PARENT));
			}
		}
	}
	
	private TiDrawableReference makeImageSource(Object object)
	{
		if (object instanceof FileProxy) {
			return TiDrawableReference.fromFile(proxy.getActivity(), ((FileProxy) object).getBaseFile());
		} else if (object instanceof String) {
			return TiDrawableReference.fromUrl(proxy, (String) object);
		} else {
			return TiDrawableReference.fromObject(proxy.getActivity(), object);
		}
	}	

	@Override
	public boolean handleMessage(Message msg) {
		switch(msg.what) {
			case SET_IMAGE:
				AsyncResult result = (AsyncResult) msg.obj;
				handleSetImage((SVG) result.getArg());
				result.setResult(null);
				return true;
			default: return false;
		}
	}
	
	@Override
	public void release()
	{
		super.release();
		imageSource = null;	
		svgImageView = null;
	}
}
