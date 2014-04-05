//
//  CPPTModelUserRegisterInfo.h
//  iCouple
//
//  Created by yl s on 12-3-13.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "JSONKit.h"

@interface CPPTModelUserRegisterInfo : NSObject
{

    NSString *uName_;       //6-30 字母数字

    NSString *password_;     //6-30字母数字
    NSString *nickName_;     //1-10汉字字母数字
    NSNumber *gender_;       //1:男； 2：女；
    NSString *phoneNum_;     //phonenum：8-11?手机号
    NSString *phoneArea_;    //phonearea：3-5?手机区号
    NSNumber *relationShip_; //relationship：生活状态    
                                //    不告诉你：1
                                //    单身无敌：2
                                //    默默喜欢：3
                                //    甜蜜情侣：4
                                //    恩爱夫妻：5
                                //    家有宝宝：6
    NSString *imei_;
    NSNumber *os_;
    NSString *os_version_;
    NSString *device_;       
}

@property (strong, nonatomic) NSString *uName;
@property (strong, nonatomic) NSString *password;
@property (strong, nonatomic) NSString *nickName;
@property (strong, nonatomic) NSNumber *gender;
@property (strong, nonatomic) NSString *phoneNum;
@property (strong, nonatomic) NSString *phoneArea;
@property (strong, nonatomic) NSNumber *relationShip;
@property (strong, nonatomic) NSString *imei;
@property (strong, nonatomic) NSNumber *os;
@property (strong, nonatomic) NSString *os_version;
@property (strong, nonatomic) NSString *device;

- (NSMutableDictionary *) toJsonDict;

@end
