//
//  FXInputWithWarning.m
//  iCouple
//
//  Created by 振杰 李 on 12-3-14.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "FXInputWithWarning.h"
#import "ColorUtil.h"
@implementation FXInputWithWarning
@synthesize textfield;

-(id)initWithFrame:(CGRect)frame withPrefixImg:(UIImage *)img contentStr:(NSString *)contentstr
{
    self = [super initWithFrame:frame];
    if (self) {
        
        background=[[UIImageView alloc] initWithFrame:self.bounds];
        background.image=REGIST_TXT_INPUT_IMG;
        [self addSubview:background];
        prefiximg=[[UIImageView alloc] initWithFrame:FXRect(12.0, 8.0, 39/2, 39/2)];
        prefiximg.image=img;
        [self addSubview:prefiximg];
        textfield=[[UITextField alloc] initWithFrame:FXRect((12.0+39/2)+4,6.0,self.frame.size.width-50,24)];
        textfield.backgroundColor=[UIColor colorWithHexString:@"#EBEBEB"];
        [self addSubview:textfield];
        
        
    }
    return self;
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
