#import "CPDBModelUserInfo.h"

/**
 * 用户信息表
 */

@implementation CPDBModelUserInfo

@synthesize userInfoID = userInfoID_;
@synthesize serverID = serverID_;
@synthesize updateTime = updateTime_;
@synthesize type = type_;
@synthesize name = name_;
@synthesize nickName = nickName_;
@synthesize mobileNumber = mobileNumber_;
@synthesize mobileIsBind = mobileIsBind_;
@synthesize emailAddr = emailAddr_;
@synthesize emailIsBind = emailIsBind_;
@synthesize sex = sex_;
@synthesize lifeStatus = lifeStatus_;
@synthesize birthday = birthday_;
@synthesize height = height_;
@synthesize weight = weight_;
@synthesize threeSizes = threeSizes_;
@synthesize citys = citys_;
@synthesize anniversaryMeet = anniversaryMeet_;
@synthesize anniversaryMarry = anniversaryMarry_;
@synthesize anniversaryDating = anniversaryDating_;
@synthesize babyName = babyName_;
@synthesize domain = domain_;

@synthesize dataList = dataList_;

@synthesize coupleAccount = coupleAccount_;
@synthesize headerPath = headerPath_;
@synthesize coupleNickName = coupleNickName_;
@synthesize hasBaby = hasBaby_;
@synthesize singleTime = singleTime_;
-(BOOL)isSysUser
{
    if ([self.type integerValue]>100)
    {
        return YES;
    }
    return NO;
}
@end

