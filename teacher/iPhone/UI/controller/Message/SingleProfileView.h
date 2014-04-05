//
//  SingleProfileView.h
//  iCouple
//
//  Created by qing zhang on 5/17/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ProfileView.h"
#import "MusicPlayerManager.h"

#define imageviewSexTag 1054
#define btnAudioPlayTag 1061


@protocol SingleProfileViewDelegate <NSObject>
@optional
-(void)palyAudioFromSingleProfileView:(UIButton *)sender;
-(void)changeContactRelation : (CPUIModelUserInfo *)userInfo;
-(void)turnToFriendCoupleProfile:(CPUIModelUserInfo *)coupleUserInfo;
-(void)turnToFriendProfile:(CPUIModelUserInfo *)friendUserInfo;
@end
@interface SingleProfileView : ProfileView <MusicPlayerManagerDelegate>
{
    int audioTime;
}

- (id)initWithFrame:(CGRect)frame andProfileType : (NSInteger)type andModelMessageGroup : (CPUIModelMessageGroup *)messageGroup;
@property (nonatomic) NSInteger profiletype;
@property (nonatomic , strong)CPUIModelMessageGroup *modelMessageGroup;
@property (nonatomic , assign)id<SingleProfileViewDelegate> singleProfileDelegate;

-(void)refreshSingleProfile : (CPUIModelMessageGroup *)messageGroup;
-(void)stopAudioPlayer;
@end
