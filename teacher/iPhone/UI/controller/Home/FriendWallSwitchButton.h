//
//  FriendWallSwitchButton.h
//  iCouple
//
//  Created by qing zhang on 9/4/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef enum  
{
    SWITCH_BUTTON_TYPE_FRIEND = 1,
    SWITCH_BUTTON_TYPE_CLOSEFRIEND = 2
}SWITCH_BUTTON_TYPE;
@interface FriendWallSwitchButton : UIButton
{
    UIImageView *imageviewUnreadedMessageNumber;
    UILabel *unreadedMessage;
}
-(void)setFriendStyle;
-(void)setCloseFriendStyle;
//刷新未读数
-(void)setUnreadedNumberByStyle : (NSUInteger)wallStyle;
@end
