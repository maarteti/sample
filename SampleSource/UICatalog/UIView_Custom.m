//
//  UIView_Custom.m
//  LayerBorderTest
//
//  Created by SUNG WOOK MOON on 09. 11. 28..
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "UIView_Custom.h"
#import <QuartzCore/QuartzCore.h>

@implementation UIView (UIView_Custom)

+ (void)randerLayerBorder:(CALayer *)layer {
#ifdef LAYER_BORDER_LOG
	NSLog(@"%@",layer);
#endif
	layer.borderWidth = 1.0;
	layer.borderColor = [[UIColor greenColor] CGColor];	
	for (CALayer *l in layer.sublayers) {
		[UIView randerLayerBorder:l];
	}
}
+ (void)randerBorder:(UIView *)view {
#ifdef LAYER_BORDER_LOG
	NSLog(@"%@",view);
#endif
	view.layer.borderWidth = 1.0;
	view.layer.borderColor = [[UIColor greenColor] CGColor];
	
	for (UIView *vl in view.subviews) {
		[UIView randerBorder:vl];
	}
	for (CALayer *l in view.layer.sublayers) {
		[UIView randerLayerBorder:l];
	}
}
- (void)start {
	[NSTimer scheduledTimerWithTimeInterval:0.3 target:self selector:@selector(layer_debug) userInfo:nil repeats:YES];
}
- (void)layer_debug {
	//NSLog(@"%@",[[UIApplication sharedApplication] windows]);
	for (UIWindow *w in [[UIApplication sharedApplication] windows]) {
		[UIView randerBorder:w];
	}
}
static UIView *_sharedView;
+ (void)Start {
	if (_sharedView) return;
	_sharedView = [[UIView alloc] init];
	[_sharedView start];
}
@end