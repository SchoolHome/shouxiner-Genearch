//
//  FxProcessFixed.m
//  SweetAlarm
//
//  Created by 振杰 李 on 12-2-4.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "FxProcessFixed.h"

@implementation FxProcessFixed

//-(void)dealloc{
//    self.image=nil;
//    [super dealloc];
//}

- (id)initWithFrame:(CGRect)frame withstep:(NSInteger)step withtitle:(NSString *)title
{
    self = [super initWithFrame:frame];
    if (self) {
        switch (step) {
            case PROCESS_1:
                self.image=REGIST_PROCESS_IMG_1;
                contentlabel=[[UILabel alloc] initWithFrame:FXRect(-13, self.frame.size.height, 80, 13)];
                
                contentlabel.backgroundColor=[UIColor clearColor];
                
                contentlabel.font=[UIFont systemFontOfSize:12.0];
                
                contentlabel.textColor=[UIColor whiteColor];
                
                contentlabel.text=title;
                
                contentlabel.shadowColor = [UIColor blackColor];
                
                contentlabel.shadowOffset = CGSizeMake(0.7, 0.7);
                
                [self addSubview:contentlabel];
                
                break;
            case PROCESS_2:
                self.image=REGIST_PROCESS_IMG_2;
                
                contentlabel=[[UILabel alloc] initWithFrame:FXRect(26, self.frame.size.height, 80, 13)];
                
                contentlabel.backgroundColor=[UIColor clearColor];
                
                contentlabel.font=[UIFont systemFontOfSize:12.0];
                
                contentlabel.textColor=[UIColor whiteColor];
                contentlabel.shadowColor = [UIColor blackColor];
                
                contentlabel.shadowOffset = CGSizeMake(0.7, 0.7);
                
                contentlabel.text=title;
                
                [self addSubview:contentlabel];
                break;
            case PROCESS_3:
                self.image=REGIST_PROCESS_IMG_3;
                
                contentlabel=[[UILabel alloc] initWithFrame:FXRect(13*6-4, self.frame.size.height, 80, 13)];
                
                contentlabel.backgroundColor=[UIColor clearColor];
                
                contentlabel.font=[UIFont systemFontOfSize:12.0];
                
                contentlabel.textColor=[UIColor whiteColor];
                
                contentlabel.text=title;
                contentlabel.shadowColor = [UIColor blackColor];
                
                contentlabel.shadowOffset = CGSizeMake(0.7, 0.7);
                
                [self addSubview:contentlabel];
                break;
            default:
                break;
        }
    }
    return self;
}


@end
