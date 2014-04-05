//
//  UIView+DebugRect.m
//  AllFriends_dev
//
//  Created by ming bright on 12-8-21.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "UIView+DebugRect.h"
#import <QuartzCore/QuartzCore.h>

@implementation UIView(DebugRect)

-(NSArray *) allSubviewsForView: (UIView *) view{
    
	NSMutableArray *subviews = [NSMutableArray array];
	[subviews addObject: view];
    
	for( UIView *subview in view.subviews ){
		[subviews addObjectsFromArray: [self allSubviewsForView: subview]];
	}
	return [NSArray arrayWithArray: subviews];
}

-(NSArray *) allSubviews{
	return [self allSubviewsForView: self];
}


-(void)showDebugRect:(BOOL) show_{
    
    for( UIView *view in [self allSubviews]){
        
		//view.clipsToBounds = YES;
		view.layer.borderWidth = 1.0f;
        
        if (show_) {
            view.layer.borderColor = [[UIColor redColor] CGColor];
        }else {
            view.layer.borderColor = [[UIColor clearColor] CGColor];
        }
	}
}

@end
