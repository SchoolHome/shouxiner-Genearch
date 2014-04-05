//
//  RecentView.m
//  iCouple
//
//  Created by qing zhang on 6/26/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "RecentView.h"
#import "MusicPlayerManager.h"
@implementation RecentView
@synthesize recentViewDelegate = _recentViewDelegate;
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
  
    }
    return self;
}
- (id)initWithTextFrame:(CGRect)frame withGroupData : (CPUIModelMessageGroup *)messageGroup
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        CPUIModelMessageGroupMember *member = [messageGroup.memberList objectAtIndex:0];
        CPUIModelUserInfo *userInfo = member.userInfo;
//        UILabel * labelRecentText = [[UILabel alloc] initWithFrame:CGRectMake(5.f, 3.f, self.frame.size.width-8.f, self.frame.size.height-6.f)];
        UILabel *labelRecentText = [[UILabel alloc] init];
        //labelRecentText.backgroundColor = [UIColor redColor];
        labelRecentText.textAlignment = UITextAlignmentLeft;
        labelRecentText.textColor = [UIColor colorWithRed:1 green:1 blue:1 alpha:1.0];
        labelRecentText.backgroundColor = [UIColor clearColor];
        NSString *textStr = userInfo.recentContent;
        UIFont *textFont = [UIFont systemFontOfSize:11.f];
        CGSize maxSize = CGSizeMake(self.frame.size.width-8.0f, self.frame.size.height-12.0f);
        CGSize dateStringSize = [textStr sizeWithFont:textFont constrainedToSize:maxSize lineBreakMode:labelRecentText.lineBreakMode];
        CGRect frameRect = CGRectMake(5.0f, 8.0f, self.frame.size.width-8.f, dateStringSize.height);
        labelRecentText.frame = frameRect;
        labelRecentText.numberOfLines = 0;
        labelRecentText.font = textFont;
        labelRecentText.text = textStr;
        [self addSubview:labelRecentText];
    }
    
    return self;
    
}
- (id)initWithAudioFrame:(CGRect)frame withGroupData : (CPUIModelMessageGroup *)messageGroup
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        CPUIModelMessageGroupMember *member = [messageGroup.memberList objectAtIndex:0];
        CPUIModelUserInfo *userInfo = member.userInfo;
        
        
        UILabel *recentText = [[UILabel alloc] initWithFrame:CGRectMake(5.f, self.frame.size.height/2-10.f, 83, 13.f)];
        recentText.text = @"我更新近况啦";
        recentText.font = [UIFont systemFontOfSize:12.f];
        recentText.textColor = [UIColor colorWithRed:1 green:1 blue:1 alpha:1.0];
        recentText.backgroundColor = [UIColor clearColor];
        [self addSubview:recentText];
        
        UIButton *btnAudioPlay = [UIButton buttonWithType:UIButtonTypeCustom];
        [btnAudioPlay setFrame:CGRectMake(80, self.frame.size.height/2-15.f, 24.f, 24.f)];
        [btnAudioPlay setBackgroundImage:[UIImage imageNamed:@"btn_im_play_little_white.png"] forState:UIControlStateNormal];
        [btnAudioPlay setBackgroundImage:[UIImage imageNamed:@"btn_im_play_little_grey.png"] forState:UIControlStateHighlighted];
        btnAudioPlay.tag = btnAudioTag;
        [btnAudioPlay addTarget:self action:@selector(playAudioInView:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:btnAudioPlay];
        
        
        
        
        UILabel *audioLength = [[UILabel alloc] initWithFrame:CGRectMake(110, self.frame.size.height/2-9.f, 25, 11.f)];
        audioLength.textColor = [UIColor colorWithRed:1 green:1 blue:1 alpha:1.0];
        audioLength.backgroundColor = [UIColor clearColor];
        audioLength.font = [UIFont systemFontOfSize:10.f];
        audioLength.tag = audioLengthTag;
//        int length = 0;
        if ([[NSFileManager defaultManager] fileExistsAtPath:userInfo.recentContent]) {
            
            audioTime = (int) [[MusicPlayerManager sharedInstance] musicLength:userInfo.recentContent];
            audioLength.text = [NSString stringWithFormat:@"%ds",audioTime];
        }
        
        [self addSubview:audioLength];
        

    }
    return self;
}
-(void)playAudioInView:(UIButton *)sender
{
    if ([self.recentViewDelegate respondsToSelector:@selector(palyAudio:)]) {
        [self.recentViewDelegate palyAudio:sender];
    }
}
-(void)setImage:(UIImage *)image
{
    UIImageView *imageviewBG = (UIImageView *)[self viewWithTag:backgroundImageTag];
    if (!imageviewBG) {
        imageviewBG = [[UIImageView alloc] initWithImage:image];
        imageviewBG.backgroundColor = [UIColor clearColor];
        //[imageviewBG setFrame:self.frame];
        [self addSubview:imageviewBG];
        [self insertSubview:imageviewBG atIndex:0];

    }else {
        [imageviewBG setImage:image];    
    }
    
}
-(void)setAudioLength:(int )audioLength
{
    UILabel *labelAudiolength = (UILabel *)[self viewWithTag:audioLengthTag];
    
    if (labelAudiolength) {
        if (audioLength == -1) {
            labelAudiolength.text = [NSString stringWithFormat:@"%ds",audioTime];
        }else {
            labelAudiolength.text = [NSString stringWithFormat:@"%ds",audioTime-audioLength];    
        }
        
    }
}
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    /*
     截断touch
     */
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
