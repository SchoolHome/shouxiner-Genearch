#import "CPDBModelContactWay.h"

#import "CoreUtils.h"
/**
 * 联系方式
 */

#define MOBILE_MAX_COUNT 11
#define PHONENO  @"\\b(1)[358][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]\\b"//手机号正则表达式

@implementation CPDBModelContactWay

@synthesize contactWayID = contactWayID_;
@synthesize contactID = contactID_;
@synthesize regType = regType_;
@synthesize type = type_;
@synthesize name = name_;
@synthesize value = value_;
@synthesize regionNumber = regionNumber_;


-(void)initMobileNumberWithData:(NSString *)stringData
{
    if (stringData)
    {
        NSString *string = [CoreUtils filterMobileNumber:stringData];
        NSInteger stringLength = [string length];
        NSString *mobileString = nil;
        if (stringLength>MOBILE_MAX_COUNT)
        {
            NSString *regionCode = [string substringToIndex:stringLength-MOBILE_MAX_COUNT];
            [self setRegionNumber:regionCode];
            mobileString = [string substringFromIndex:stringLength-MOBILE_MAX_COUNT]; 
        }
        else 
        {
            mobileString = string;
        }
        NSString *regexStr = PHONENO;  
        NSPredicate *predicatePhone = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regexStr]; 
        if ([predicatePhone evaluateWithObject:mobileString])
        {
            [self setValue:mobileString];
        }
    }
}
@end

