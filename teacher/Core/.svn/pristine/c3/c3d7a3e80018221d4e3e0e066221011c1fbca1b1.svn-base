#import "CPUIModelUserInfo.h"

#import "ChineseToPinyin.h"
/**
 * 用户信息表
 */

@implementation CPUIModelUserInfo


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
@synthesize birthday = birthday_;
@synthesize height = height_;
@synthesize weight = weight_;
@synthesize threeSizes = threeSizes_;
@synthesize citys = citys_;
@synthesize anniversaryMeet = anniversaryMeet_;
@synthesize anniversaryMarry = anniversaryMarry_;
@synthesize anniversaryDating = anniversaryDating_;
@synthesize babyName = babyName_;
@synthesize lifeStatus = lifeStatus_;
@synthesize domain = domain_;

@synthesize fullName = fullName_;
@synthesize coupleAccount = coupleAccount_;
@synthesize headerPath = headerPath_;
@synthesize dataList = dataList_;
@synthesize coupleUserInfo = coupleUserInfo_;

@synthesize searchTextArray = searchTextArray_;
@synthesize searchTextPinyinArray = searchTextPinyinArray_;
@synthesize searchTextQuanPinWithChar = searchTextQuanPinWithChar_;
@synthesize searchTextQuanPinWithInt = searchTextQuanPinWithInt_;

@synthesize selfBgImgPath = selfBgImgPath_;
@synthesize selfCoupleHeaderImgPath = selfCoupleHeaderImgPath_;
@synthesize selfHeaderImgPath = selfHeaderImgPath_;
@synthesize selfBabyHeaderImgPath = selfBabyHeaderImgPath_;

@synthesize recentType = recentType_;
@synthesize recentContent = recentContent_;
@synthesize recentUpdateTime = recentUpdateTime_;

@synthesize coupleNickName = coupleNickName_;
@synthesize hasBaby = hasBaby_;
@synthesize singleTime = singleTime_;

-(BOOL)hasCouple
{
    return self.coupleAccount&&![@"" isEqualToString:self.coupleAccount]&&
    ([self.type intValue]==USER_RELATION_TYPE_COUPLE||[self.type intValue]==USER_RELATION_TYPE_MARRIED);
}
-(BOOL)hasLover
{
    return self.coupleAccount&&![@"" isEqualToString:self.coupleAccount]&&
    ([self.type intValue]==USER_RELATION_TYPE_LOVER);
}

-(void)initSearchData
{
    if (self.nickName&&![@"" isEqualToString:self.nickName]) 
    {
//        NSMutableArray *textArray = [[NSMutableArray alloc] init];
        NSMutableArray *textPinYinArray = [[NSMutableArray alloc] init];
        NSMutableString *textQuanPinStr = [[NSMutableString alloc] init];
        NSMutableString *textQuanPinInt = [[NSMutableString alloc] init];
        NSInteger strLength = [self.nickName length];
        for (int i = 0; i < strLength; i++)
        {
            NSRange range;
            range.length = 1;
            range.location = i;
            NSString *temp = [self.nickName substringWithRange:range];
            int isChinese = [temp characterAtIndex:0];
            if (isChinese > 0x4e00 && isChinese < 0x9fff) 
            {
                NSString *quanpin = [[ChineseToPinyin pinyinFromChiniseString:temp] uppercaseString];
                if (  quanpin && ![quanpin isEqualToString:@""] ) 
                {
                    [textQuanPinStr appendString:quanpin];
                    [textQuanPinInt appendString:[NSString stringWithFormat:@"%d",isChinese]];
                    [textPinYinArray addObject:[quanpin substringWithRange:NSMakeRange(0, 1)]];
                }else 
                {
                    CPLogError(@"没有汉字：%@的拼音",temp);
                }
            }else 
            {
                [textQuanPinStr appendString:[temp uppercaseString]];
                [textQuanPinInt appendString:[temp uppercaseString]];
                if (i == 0 && ![temp isEqualToString:@" "]) 
                {
                    [textPinYinArray addObject:[temp uppercaseString]];
                }else if (i > 0 && ![temp isEqualToString:@" "])
                {
                    NSString *perchar = [self.nickName substringWithRange:NSMakeRange(i-1, 1)];
                    int isChinese2 = [perchar characterAtIndex:0];
                    if ( (isChinese2 > 0x4e00 && isChinese2 <0x9fff) || [perchar isEqualToString:@" "]) 
                    {
                        [textPinYinArray addObject:[temp uppercaseString]];
                    }
                }
            }
        }
        [self setSearchTextPinyinArray:textPinYinArray];
        [self setSearchTextQuanPinWithChar:textQuanPinStr];
        [self setSearchTextQuanPinWithInt:textQuanPinInt];
    }
    

}
@end

