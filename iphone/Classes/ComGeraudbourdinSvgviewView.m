#import "ComGeraudbourdinSvgviewView.h"
#import "TiUtils.h"

#import "SVGKit/SVGKit.h"

@implementation ComGeraudbourdinSvgviewView

- (void)willMoveToSuperview:(UIView *)newSuperview
{
    //NSLog(@"[SVGVIEW LIFECYCLE EVENT] willMoveToSuperview");
}

- (void)initializeState
{
    // This method is called right after allocating the view and
    // is useful for initializing anything specific to the view

    // Creates and keeps a reference to the view upon initialization
    square = [[UIView alloc] initWithFrame:[self frame]];
    [self addSubview:square];

    [super initializeState];

    //NSLog(@"[SVGVIEW LIFECYCLE EVENT] initializeState");
}

- (void)configurationSet
{
    // This method is called right after all view properties have
    // been initialized from the view proxy. If the view is dependent
    // upon any properties being initialized then this is the method
    // to implement the dependent functionality.

    [super configurationSet];

    //NSLog(@"[SVGVIEW LIFECYCLE EVENT] configurationSet");
}



- (void)frameSizeChanged:(CGRect)frame bounds:(CGRect)bounds
{
    // You must implement this method for your view to be sized correctly.
    // This method is called each time the frame / bounds / center changes
    // within Titanium.

    boundsWidth = bounds.size.width;
    boundsHeight = bounds.size.height;

    if (square != nil) {

        // You must call the special method 'setView:positionRect' against
        // the TiUtils helper class. This method will correctly layout your
        // child view within the correct layout boundaries of the new bounds
        // of your view.

        [TiUtils setView:square positionRect:bounds];
    }
    if(svgFile!= nil && boundsWidth>0 && boundsHeight>0){
        [self drawSvg];
    }
}

-(void)setImage_:(id)imageName
{
    svgFile = [TiUtils stringValue:imageName];
    if(svgFile!= nil && boundsWidth>0 && boundsHeight>0){
        [self drawSvg];
    }
}


-(void)drawSvg
{
    //NSLog(@"SVG DRAW file:%@",svgFile);
    NSURL* url = [TiUtils toURL:svgFile proxy:self.proxy];
    if (url != nil) {
        SVGKImage *newImage =[SVGKImage imageWithContentsOfURL:url];
        //SVGKImage *newImage = [SVGKImage imageNamed:svgFile];
        if(newImage.hasSize){
            CGSize imageSize = newImage.size;
            float ratio = MIN(boundsWidth / imageSize.width, boundsHeight / imageSize.height);
            newImage.size = CGSizeApplyAffineTransform( newImage.size, CGAffineTransformMakeScale( ratio, ratio ));
        }else{
            newImage.size = CGSizeMake(boundsWidth, boundsHeight);
        }

        SVGKImageView *imageView = [[SVGKLayeredImageView alloc] initWithSVGKImage:newImage];
        [[square subviews] makeObjectsPerformSelector:@selector(removeFromSuperview)];
        [square addSubview:imageView];
    }
}

@end
