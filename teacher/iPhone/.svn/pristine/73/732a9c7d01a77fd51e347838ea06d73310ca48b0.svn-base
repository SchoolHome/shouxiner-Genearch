//
//  FriendWallSwitchButton.m
//  iCouple
//
//  Created by qing zhang on 9/4/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "FriendWallSwitchButton.h"
#import "CPUIModelManagement.h"

@implementation FriendWallSwitchButton

-(void)setFriendStyle
{
    [self setFrame:CGRectMake(240, 92, 80, 33)];
    UIImage *imagePic = [UIImage imageNamed:@"wall_newmsg_hy.png"];
    UIImage *image = [imagePic stretchableImageWithLeftCapWidth:imagePic.size.width/2 topCapHeight:0];
    [self setBackgroundImage:image forState:UIControlStateNormal];
    UIImage *imagePressPic = [UIImage imageNamed:@"wall_newmsg_hy_press.png"];
    UIImage *imagePress = [imagePressPic stretchableImageWithLeftCapWidth:imagePressPic.size.width/2 topCapHeight:0];
    [self setBackgroundImage:imagePress forState:UIControlStateHighlighted];
    [self setTitle:@"蜜友" forState:UIControlStateNormal];
    self.titleLabel.font = [UIFont boldSystemFontOfSize:13.f];
    [self setTitleEdgeInsets:UIEdgeInsetsMake(8, 22, 8, 0)];
    [self setUnreadedNumberByStyle:SWITCH_BUTTON_TYPE_FRIEND];
}
-(void)setCloseFriendStyle
{
    [self setFrame:CGRectMake(320, 92, 80, 33)];
    [self setTitle:@"好友" forState:UIControlStateNormal];
    [self setTitleEdgeInsets:UIEdgeInsetsMake(8, 0, 8, 22)];
    self.titleLabel.font = [UIFont boldSystemFontOfSize:13.f];
    UIImage *imagePic = [UIImage imageNamed:@"wall_newmsg_my.png"];
    UIImage *image = [imagePic stretchableImageWithLeftCapWidth:imagePic.size.width/2 topCapHeight:0];
    [self setBackgroundImage:image forState:UIControlStateNormal];
    UIImage *imagePressPic = [UIImage imageNamed:@"wall_newmsg_my_press.png"];
    UIImage *imagePress = [imagePressPic stretchableImageWithLeftCapWidth:imagePressPic.size.width/2 topCapHeight:0];
    [self setBackgroundImage:imagePress forState:UIControlStateHighlighted];
    [self setUnreadedNumberByStyle:SWITCH_BUTTON_TYPE_CLOSEFRIEND];
}
-(void)setUnreadedNumberByStyle : (NSUInteger)wallStyle
{

    if (wallStyle == SWITCH_BUTTON_TYPE_FRIEND) {
        NSInteger unreadedCount = [CPUIModelManagement sharedInstance].closedMsgUnReadedCount;
        if (unreadedCount == 0) {
            self.hidden = YES;
        }else {
            self.hidden = NO;
            NSString *unreadedCountStr = @"";
            if (unreadedCount > 99) {
                unreadedCountStr = @"99+";
            }else {
                unreadedCountStr = [NSString stringWithFormat:@"%d",unreadedCount];
            }
            //未读数
            if (!imageviewUnreadedMessageNumber) {
                UIImage *image1 = [UIImage imageNamed:@"item_index_redcircle.png"];
                UIImage *image = [image1 stretchableImageWithLeftCapWidth:image1.size.width/2.f topCapHeight:0];
                imageviewUnreadedMessageNumber = [[UIImageView alloc] initWithImage:image];
                [self addSubview:imageviewUnreadedMessageNumber];    
            }
            
            
            CGSize unReaderTextSize = [unreadedCountStr sizeWithFont:[UIFont systemFontOfSize:12]];
            if (unreadedCount >=10 && unreadedCount < 99) {
                [imageviewUnreadedMessageNumber setFrame:CGRectMake(2,4.f , unReaderTextSize.width + 20.5f, 27.5)];
            }else if(unreadedCount < 10){
                [imageviewUnreadedMessageNumber setFrame:CGRectMake(6,4.f , unReaderTextSize.width + 20.5f, 27.5)];
            }else {
                [imageviewUnreadedMessageNumber setFrame:CGRectMake(0,4.f , unReaderTextSize.width + 20.5f, 27.5)];
            }  
            
            
            if (!unreadedMessage) {
                unreadedMessage = [[UILabel alloc] initWithFrame:CGRectMake(2.f, 5.f, imageviewUnreadedMessageNumber.frame.size.width-4.f, 14)];
                unreadedMessage.textColor = [UIColor colorWithRed:245/255.f green:245/255.f blue:245/255.f alpha:1.f];
                unreadedMessage.font = [UIFont fontWithName:@"Helvetica-Bold" size:14.f];
                unreadedMessage.backgroundColor = [UIColor clearColor];
                unreadedMessage.textAlignment = UITextAlignmentCenter;
                [imageviewUnreadedMessageNumber addSubview:unreadedMessage];                  
            }else {
                [unreadedMessage setFrame:CGRectMake(2.f, 5.f, imageviewUnreadedMessageNumber.frame.size.width-4.f, 14)];
            }
            //[unreadedMessage setFrame:CGRectMake(3.f, 5.f, imageviewUnreadedMessageNumber.frame.size.width-6.f, 14)];
            unreadedMessage.text = unreadedCountStr;
        

            
            

        }
    }else if(wallStyle == SWITCH_BUTTON_TYPE_CLOSEFRIEND)
    {
        NSInteger unreadedCount = [CPUIModelManagement sharedInstance].friendMsgUnReadedCount;
        if (unreadedCount == 0) {
            self.hidden = YES;
        }else {
            self.hidden = NO;
            NSString *unreadedCountStr = @"";
            if (unreadedCount > 99) {
                unreadedCountStr = @"99+";
            }else {
                unreadedCountStr = [NSString stringWithFormat:@"%d",unreadedCount];
            }
            //未读数
            if (!imageviewUnreadedMessageNumber) {
                UIImage *image1 = [UIImage imageNamed:@"item_index_redcircle.png"];
                UIImage *image = [image1 stretchableImageWithLeftCapWidth:image1.size.width/2.f topCapHeight:0];
                imageviewUnreadedMessageNumber = [[UIImageView alloc] initWithImage:image];
                [self addSubview:imageviewUnreadedMessageNumber];    
            }
            CGSize unReaderTextSize = [unreadedCountStr sizeWithFont:[UIFont systemFontOfSize:12]];
            if (unreadedCount >=10 && unreadedCount < 99) {
                [imageviewUnreadedMessageNumber setFrame:CGRectMake(43,4.f , unReaderTextSize.width + 20.5f, 27.5)];
            }else if(unreadedCount < 10){
                [imageviewUnreadedMessageNumber setFrame:CGRectMake(47,4.f , unReaderTextSize.width + 20.5f, 27.5)];
            }else {
                [imageviewUnreadedMessageNumber setFrame:CGRectMake(40,4.f , unReaderTextSize.width + 20.5f, 27.5)];    
            }   
            
            
            if (!unreadedMessage) {
                unreadedMessage = [[UILabel alloc] initWithFrame:CGRectMake(2.f, 5.f, imageviewUnreadedMessageNumber.frame.size.width-4.f, 14)];
                unreadedMessage.textColor = [UIColor colorWithRed:245/255.f green:245/255.f blue:245/255.f alpha:1.f];
                unreadedMessage.font = [UIFont fontWithName:@"Helvetica-Bold" size:14.f];
                unreadedMessage.backgroundColor = [UIColor clearColor];
                unreadedMessage.textAlignment = UITextAlignmentCenter;
                [imageviewUnreadedMessageNumber addSubview:unreadedMessage];                  
            }else {
                [unreadedMessage setFrame:CGRectMake(2.f, 5.f, imageviewUnreadedMessageNumber.frame.size.width-4.f, 14)];
            }
            unreadedMessage.text = unreadedCountStr;
        }    
    }
}

@end
