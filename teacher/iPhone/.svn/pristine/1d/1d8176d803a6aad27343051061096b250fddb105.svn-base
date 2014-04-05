//
//  RecentView.h
//  iCouple
//
//  Created by qing zhang on 6/26/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CPUIModelMessageGroup.h"
#import "CPUIModelMessageGroupMember.h"
#import "CPUIModelUserInfo.h"
#define btnAudioTag 9030
#define audioLengthTag 9031
#define backgroundImageTag 9032
@protocol RecentViewDelegate <NSObject>

-(void)palyAudio:(UIButton *)sender;

@end
@interface RecentView : UIView
{
    int audioTime;
}
@property (nonatomic , assign) id<RecentViewDelegate> recentViewDelegate;
- (id)initWithTextFrame:(CGRect)frame withGroupData : (CPUIModelMessageGroup *)messageGroup;
- (id)initWithAudioFrame:(CGRect)frame withGroupData : (CPUIModelMessageGroup *)messageGroup;
-(void)setImage:(UIImage *)image;
-(void)setAudioLength:(int)audioLength;
@end
