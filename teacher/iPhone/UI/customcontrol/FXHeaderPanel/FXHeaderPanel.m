//
//  FXHeaderPanel.m
//  ShakeIcon
//
//  Created by 振杰 李 on 12-4-6.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "FXHeaderPanel.h"

#define INIT_WIDTH 136.0/2.0
#define INIT_HIGH 136.0/2.0

@implementation FXHeaderPanel

@synthesize picview;
@synthesize delegate;

- (id)initWithFrame:(CGRect)frame picimg:(UIImage *)img contactName:(NSString *)name
{
    self = [super initWithFrame:frame];
    if (self) {
        
        self.backgroundColor=[UIColor blueColor];
        
        locbutton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        
        locbutton.frame=CGRectMake(20, 50, 30, 30);
        
        
        [locbutton addTarget:self action:@selector(doLocation) forControlEvents:UIControlEventTouchUpInside];
        
        [self addSubview:locbutton];
        
        picview=[[AGMedallionView alloc] initWithFrame:CGRectMake(200.0, 30.0,INIT_WIDTH, INIT_HIGH)];
        
        [picview setImage:img];
        
        [self addSubview:picview];
        
        namelabel = [[UILabel alloc] initWithFrame:CGRectMake(46.0, self.frame.size.height-36, 150.0,15)];
        
        namelabel.textAlignment=UITextAlignmentRight;
        
        namelabel.textColor=[UIColor whiteColor];
        
        namelabel.backgroundColor=[UIColor clearColor];
        
        namelabel.font=[UIFont systemFontOfSize:14.0];
        
        namelabel.text=name;
        
        namelabel.shadowColor = [UIColor blackColor];
        
        namelabel.shadowOffset = CGSizeMake(0.6, 0.7);
        
        [self addSubview:namelabel];
        
        
        
    }
    return self;
}


-(void)doLocation{
    if (delegate!=nil) {
        
        [delegate DoShowLocation];
        
    }
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
