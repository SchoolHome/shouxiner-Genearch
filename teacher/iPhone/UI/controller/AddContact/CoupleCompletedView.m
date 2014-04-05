//
//  CoupleCompletedView.m
//  iCouple
//
//  Created by shuo wang on 12-6-11.
//  Copyright (c) 2012年 fanxer. All rights reserved.
//

#import "CoupleCompletedView.h"
#import "DateUtil.h"
#import "CPUIModelManagement.h"
#import "CPUIModelUserInfo.h"
#import "ColorUtil.h"
@implementation CoupleCompletedView
@synthesize delegate = _delegate;
@synthesize imageView = _imageView;

/*
- (id)initWithFrame:(CGRect)frame withType : (CompletedType) type{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.imageView = [[UIImageView alloc] initWithFrame:frame];
        NSString *imageName = @"";
        switch (type) {
            case CoupleMan:
                imageName = @"add_couple@2x.jpg";
                break;
            case CoupleWoman:
                imageName = @"add_couple@2x.jpg";
                break;
            case LikeMan:
                imageName = @"add_like@2x.jpg";
                break;
            case LikeWoman:
                imageName = @"add_like@2x.jpg";
                break;
            default:
                break;
        }
        UIImage *image = [UIImage imageNamed:imageName];
        self.imageView.image = image;
        self.imageView.alpha = 0.0f;
        
        [self addSubview:self.imageView];
        self.backgroundColor = [UIColor clearColor];
        
        
    }
    return self;
}
*/
- (id)initWithFrame:(CGRect)frame withType : (NSString *) message andCompletedDate :(NSNumber *)date
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.imageView = [[UIImageView alloc] initWithFrame:frame];
        NSString *imageName = @"";
        /*
        switch (type) {
            case CoupleMan:
                imageName = @"add_couple@2x.jpg";
                break;
            case CoupleWoman:
                imageName = @"add_couple@2x.jpg";
                break;
            case LikeMan:
                imageName = @"add_like@2x.jpg";
                break;
            case LikeWoman:
                imageName = @"add_like@2x.jpg";
                break;
            default:
                break;
        }
        */

        //CPUIModelUserInfo *coupleUserInfo = [CPUIModelManagement sharedInstance].coupleModel;
        NSLog(@"%@",message);
        if (![message isEqualToString:@""]) {
            if ([message hasPrefix:@"世界上最近的距离就是你喜欢TA，TA也喜欢你！恭喜！你们俩都默默喜欢着对方哦"]) {
                imageName = @"add_like@2x.jpg";
            }else if([message hasPrefix:@"恭喜，Ta同意和你成为情侣啦，快和Ta尽享甜蜜旅程吧！"])
            {
                imageName = @"add_couple@2x.jpg";
                UILabel *coupleText = [[UILabel alloc] initWithFrame:CGRectMake(34, 354, 275, 21)];
                coupleText.textColor = [UIColor colorWithHexString:@"#666666"];
                coupleText.backgroundColor = [UIColor clearColor];
                coupleText.font = [UIFont systemFontOfSize:20.f];
                coupleText.text = @"亲爱的,你就是我的天下无";
                [self addSubview:coupleText];
                
                UIImageView *shuangLogo = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"celebrate_logo.png"]];
                [shuangLogo setFrame:CGRectMake(265, 354, 25, 20)];
                [self addSubview:shuangLogo];
            }else if([message hasPrefix:@"恭喜，Ta同意和你成为夫妻啦，快和Ta尽享甜蜜旅程吧！"])
            {
                imageName = @"add_couple@2x.jpg";
                UILabel *marriedTextLeft = [[UILabel alloc] initWithFrame:CGRectMake(57, 354, 200, 21)];
                marriedTextLeft.textColor = [UIColor colorWithHexString:@"#666666"];
                marriedTextLeft.backgroundColor = [UIColor clearColor];
                marriedTextLeft.font = [UIFont systemFontOfSize:20.f];
                marriedTextLeft.text = @"结婚啦,要比翼";
                [self addSubview:marriedTextLeft];
                
                UIImageView *shuangLogo = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"celebrate_logo.png"]];
                [shuangLogo setFrame:CGRectMake(184, 354, 25, 20)];
                [self addSubview:shuangLogo];
                
                UILabel *marriedTextRight = [[UILabel alloc] initWithFrame:CGRectMake(210, 354,80, 21)];
                marriedTextRight.textColor = [UIColor colorWithHexString:@"#666666"];
                marriedTextRight.backgroundColor = [UIColor clearColor];
                marriedTextRight.font = [UIFont systemFontOfSize:20.f];
                marriedTextRight.text = @"飞哦！";
                [self addSubview:marriedTextRight];
            }
        }
        
        UIImage *image = [UIImage imageNamed:imageName];
        self.imageView.image = image;
        [self addSubview:self.imageView];
        [self sendSubviewToBack:self.imageView];
        
        self.backgroundColor = [UIColor clearColor];
        

        NSDate *coupleDate = [NSDate dateWithTimeIntervalSince1970:[date longLongValue]/1000];
        NSString *dateStr = [[[DateUtil alloc] init] formatDateWithType:dateForCoupleComplete formatDate:coupleDate];
        NSLog(@"%@",dateStr);
        UILabel *dateText = [[UILabel alloc] initWithFrame:CGRectMake(115, 380, 90, 14)];
        dateText.text = dateStr;
        dateText.textColor = [UIColor colorWithHexString:@"#999999"];
        dateText.font = [UIFont fontWithName:@"Helvetica-Bold" size:12.f];
        dateText.backgroundColor = [UIColor clearColor];
        dateText.textAlignment = UITextAlignmentCenter;
        [self addSubview:dateText];
        
        UIButton *removeBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [removeBtn setBackgroundImage:[UIImage imageNamed:@"bt_im_profile_back.png"] forState:UIControlStateNormal];
        [removeBtn setBackgroundImage:[UIImage imageNamed:@"bt_im_profile_backpress.png"] forState:UIControlStateHighlighted];
        [removeBtn setFrame:CGRectMake(0, 20, 60, 60)];
        [removeBtn addTarget:self action:@selector(removeView) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:removeBtn];
        
    }
    return self;
}
-(void)removeView
{
    [self removeFromSuperview];
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
