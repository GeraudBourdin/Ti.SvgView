/**
 * svg-ios
 *
 * Created by Your Name
 * Copyright (c) 2015 Your Company. All rights reserved.
 */

#import "ComGeraudbourdinSvgviewModule.h"
#import "TiBase.h"
#import "TiHost.h"
#import "TiUtils.h"

@implementation ComGeraudbourdinSvgviewModule

#pragma mark Internal

// this is generated for your module, please do not change it
-(id)moduleGUID
{
	return @"ac3aaad2-eda3-428a-87f2-5cb00e96713d";
}

// this is generated for your module, please do not change it
-(NSString*)moduleId
{
	return @"com.geraudbourdin.svgview";
}

#pragma mark Lifecycle

-(void)startup
{
	// this method is called when the module is first loaded
	// you *must* call the superclass
	[super startup];

	NSLog(@"[INFO] %@ loaded",self);
}

-(void)shutdown:(id)sender
{
	// this method is called when the module is being unloaded
	// typically this is during shutdown. make sure you don't do too
	// much processing here or the app will be quit forceably

	// you *must* call the superclass
	[super shutdown:sender];
}

- (id)init
{
    // This is the designated initializer method and will always be called
    // when the proxy is created.

    //NSLog(@"[INFO] %@ init",self);

    return [super init];
}

- (void)_destroy
{
    // This method is called from the dealloc method and is good place to
    // release any objects and memory that have been allocated for the module.

   NSLog(@"[INFO] %@ _destroy",self);

    [super _destroy];
}

- (void)suspend:(id)sender
{
    // This method is called when the application is being suspended

    //NSLog(@"[INFO] %@ suspend",self);

    [super suspend:sender];
}

- (void)resume:(id)sender
{
    // This method is called when the application is being resumed

    //NSLog(@"[INFO] %@ resume",self);

    [super resume:sender];
}

- (void)resumed:(id)sender
{
    // This method is called when the application has been resumed

    //NSLog(@"[INFO] %@ resumed",self);

    [super resumed:sender];
}

- (id)_initWithPageContext:(id<TiEvaluator>)context
{
    // This method is one of the initializers for the proxy class. If the
    // proxy is created without arguments then this initializer will be called.
    // This method is also called from the other _initWithPageContext method.
    // The superclass method calls the init and _configure methods.

    //NSLog(@"[INFO] %@ _initWithPageContext (no arguments)",self);

    return [super _initWithPageContext:context];
}

- (id)_initWithPageContext:(id<TiEvaluator>)context_ args:(NSArray *)args
{
    // This method is one of the initializers for the proxy class. If the
    // proxy is created with arguments then this initializer will be called.
    // The superclass method calls the _initWithPageContext method without
    // arguments.

    //NSLog(@"[INFO] %@ _initWithPageContext (arguments)",self);

    return [super _initWithPageContext:context_ args:args];
}

- (void)_configure
{
    // This method is called from _initWithPageContext to allow for
    // custom configuration of the module before startup. The superclass
    // method calls the startup method.

    //NSLog(@"[INFO] %@ _configure",self);

    [super _configure];
}

- (void)_initWithProperties:(NSDictionary *)properties
{
    // This method is called from _initWithPageContext if arguments have been
    // used to create the proxy. It is called after the initializers have completed
    // and is a good point to process arguments that have been passed to the
    // proxy create method since most of the initialization has been completed
    // at this point.

    //NSLog(@"[INFO] %@ _initWithProperties",self);

    [super _initWithProperties:properties];
}



#pragma mark Internal Memory Management

-(void)didReceiveMemoryWarning:(NSNotification*)notification
{
	// optionally release any resources that can be dynamically
	// reloaded once memory is available - such as caches
	[super didReceiveMemoryWarning:notification];
}


#pragma Public APIs

@end
