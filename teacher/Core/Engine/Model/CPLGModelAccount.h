//
//  CPLGModelAccount.h
//  icouple
//
//  Created by yong wei on 12-3-8.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

#define PERSONAL_BG_FILE     @"selfBg"
#define PERSONAL_HEADER_FILE @"selfImg"
#define PERSONAL_COUPLE_FILE @"selfCouple"
#define PERSONAL_BABY_FILE   @"selfBaby"


@interface CPLGModelAccount : NSObject
{
    NSString *loginName_;
    NSString *pwdMD5_;
    NSNumber *isActived_;
    NSNumber *queryAbTime_;
    NSNumber *isVerifiedCode_;
    NSString *mobileNumber_;
    
    NSNumber *canUploadAb_;
    NSNumber *uploadAbTime_;
    NSString *friTimeStamp_;
    NSString *converTimeStamp_;
    NSNumber *hasCommendUsers_;
    NSString *myProfileTimeStamp_;
    
    NSString *token_;
    NSString *domain_;
    NSString *suid_;
    NSString *uid_;
    NSNumber *isUploadDeviceToken_;
    NSString *deviceToken_;
    
    NSNumber *hasSavePersonalInfoName_;
    BOOL isAutoLogin_;
    
    NSString *willCoupleName_;
    NSString *willCoupleUserName_;
    NSNumber *willCoupleRealtionType_;
}
//@property (strong,nonatomic) NSString *loginName;
@property (strong, atomic) NSString *loginName;
@property (strong,nonatomic) NSString *pwdMD5;
@property (strong,nonatomic) NSNumber *isAvtived;
@property (strong,nonatomic) NSNumber *queryAbTime;
@property (strong,nonatomic) NSNumber *isVerifiedCode;
@property (strong,nonatomic) NSString *mobileNumber;
@property (strong,nonatomic) NSNumber *canUploadAb;
@property (strong,nonatomic) NSNumber *uploadAbTime;
@property (strong,nonatomic) NSString *friTimeStamp;
@property (strong,nonatomic) NSString *converTimeStamp;
@property (strong,nonatomic) NSNumber *hasCommendUsers;
@property (strong,nonatomic) NSString *myProfileTimeStamp;
@property (strong,nonatomic) NSString *token;
@property (strong,nonatomic) NSString *suid;
@property (strong,nonatomic) NSString *uid;
@property (strong,nonatomic) NSString *domain;
@property (strong,nonatomic) NSNumber *isUploadDeviceToken;
@property (strong,nonatomic) NSString *deviceToken;
@property (strong,nonatomic) NSNumber *hasSavePersonalInfoName;
@property (assign,nonatomic) BOOL isAutoLogin;
@property (strong,nonatomic) NSString *willCoupleName;
@property (strong,nonatomic) NSString *willCoupleUserName;
@property (strong,nonatomic) NSNumber *willCoupleRealtionType;

-(NSString *)getSelfBgFilePath;
-(NSString *)getSelfHeaderFilePath;
-(NSString *)getSelfCoupleFilePath;
-(NSString *)getSelfBabyFilePath;
@end
