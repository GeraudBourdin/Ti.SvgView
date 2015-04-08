#import "ComGeraudbourdinSvgviewView.h"
#import "TiUtils.h"
#import "SVGKit.h"
#import "SVGKFastImageView.h"
#import "SVGKLayeredImageView.h"

@implementation ComGeraudbourdinSvgviewView
- (void)initializeState
{
    // Creates and keeps a reference to the view upon initialization
    square = [[UIView alloc] initWithFrame:[self frame]];
    [self addSubview:square];
    [super initializeState];
}

-(void)dealloc
{
    // Deallocates the view
    RELEASE_TO_NIL(square);
    [super dealloc];
}

-(void)frameSizeChanged:(CGRect)frame bounds:(CGRect)bounds
{
    boundsWidth = bounds.size.width;
    boundsHeight = bounds.size.height;
    //NSLog(@"[INFO] bounds.size.width %f", boundsWidth);
    if (square != nil) {
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
    SVGKImage *newImage = [SVGKImage imageNamed:svgFile];
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

@end