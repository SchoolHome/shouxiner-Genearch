//
//  AlertIndicatorControl.m
//  SweetAlarm
//
//  Created by 振杰 李 on 11-12-27.
//  Copyright (c) 2011年 __MyCompanyName__. All rights reserved.
//

#import "FanxerIndicatorControl.h"

@implementation FanxerIndicatorControl
@synthesize ind;
@synthesize label;
@synthesize title;
@synthesize message;
@synthesize messagelabel;

 
- (id)initWithFrame:(CGRect)frame message:(NSString *)messages title:(NSString *)titles bgimg:(UIImage *)img
{
    self = [super initWithFrame:frame];
    if (self) {
        message=messages;
        
        title=titles;
        
        label=[[UILabel alloc] initWithFrame:CGRectMake(0.0, 30.0, frame.size.width, 33)];
        
        label.textAlignment=UITextAlignmentCenter;
        
        label.text=title;
        
        label.textColor=[UIColor whiteColor];
        
        [label setBackgroundColor:[UIColor clearColor]];
        [self addSubview:label];
        
        [label release];
        
        
        imgview=[[UIImageView alloc] initWithFrame:self.bounds];
        
        imgview.image=img;
        
        [self addSubview:imgview];

        ind=[[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhite];
        
        ind.frame=CGRectMake(frame.size.width/2-30,ind.frame.origin.y+40, 60, 50);//ind.frame.origin.y+40
        
        [self addSubview:ind];
        
        [ind startAnimating];
        
        
        messagelabel=[[UILabel alloc] initWithFrame:CGRectMake(0.0, frame.size.height/2-30, frame.size.width, 23)];
        messagelabel.textAlignment=UITextAlignmentCenter;
        messagelabel.text=messages;
        messagelabel.font=[UIFont systemFontOfSize:15.0];
        messagelabel.textColor=[UIColor whiteColor];
        
        [messagelabel setBackgroundColor:[UIColor clearColor]];
        
        [self addSubview:messagelabel];
        
        [messagelabel release];
        
        
    }
    return self;
}

-(void)StopAnimating{
    
    if(ind!=nil){
        
    [ind stopAnimating];
    
    }
}

@end
