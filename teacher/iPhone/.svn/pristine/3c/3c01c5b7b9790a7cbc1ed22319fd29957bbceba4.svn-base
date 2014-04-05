//
//  CoupleCompletedView.h
//  iCouple
//
//  Created by shuo wang on 12-6-11.
//  Copyright (c) 2012年 fanxer. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum{
    CoupleMan,
    CoupleWoman,
    LoveMan,
    LoveWoman,
    LikeMan,
    LikeWoman
}CompletedType;

@protocol CoupleCompletedDelegate <NSObject>

@optional
-(void) coupleCompletedFinish;

@end

@interface CoupleCompletedView : UIView

@property(nonatomic,strong) UIImageView *imageView;
@property(nonatomic,assign) id<CoupleCompletedDelegate> delegate;


//- (id)initWithFrame:(CGRect)frame withType : (CompletedType) type;
- (id)initWithFrame:(CGRect)frame withType : (NSString *) message andCompletedDate :(NSNumber *)date;

@end
