//
//  StrangerHeaderImage.h
//  iCouple
//
//  Created by shuo wang on 12-6-20.
//  Copyright (c) 2012年 fanxer. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CPUIModelManagement.h"

@interface StrangerHeaderImageModel : NSObject
@property (nonatomic,strong) NSString *userName;
@property (nonatomic,strong) NSString *headerImagePath;
@property (nonatomic,strong) NSString *bgImagePath;
@property (nonatomic,strong) NSNumber *sex;
@property (nonatomic) BOOL hasBaby;
@property (nonatomic,strong) NSString *babyImagePath;
@end

@interface StrangerHeaderImage : NSObject
+(StrangerHeaderImage *) sharedInstance;
-(void) getUserHeaderImage : (NSString *) userName;
@end
