#import "CPPTModelContactWay.h"

/**
 * 联系方式
 */

#define K_CONTACTWAY_KEY_PHONE_NUM         @"phnum"
#define K_CONTACTWAY_KEY_PHONE_AREA        @"pharea"
#define K_CONTACTWAY_VALUE_NULL            @""

@implementation CPPTModelContactWay

#if 0
@synthesize contactWayID = contactWayID_;
@synthesize contactID = contactID_;
@synthesize regType = regType_;
@synthesize type = type_;
@synthesize name = name_;
@synthesize value = value_;
#endif

@synthesize phoneNum = phoneNum_;
@synthesize phoneArea = phoneArea_;

+ (CPPTModelContactWay *)fromJsonDict:(NSDictionary *)jsonDict
{
    CPPTModelContactWay *contactWay = nil;
    
    if(jsonDict)
    {
        contactWay = [[CPPTModelContactWay alloc] init];
        if(contactWay)
        {
            contactWay.phoneNum = [jsonDict objectForKey:K_CONTACTWAY_KEY_PHONE_NUM];
            contactWay.phoneArea = [jsonDict objectForKey:K_CONTACTWAY_KEY_PHONE_AREA];
        }
    }
    
    return contactWay;
}

- (NSMutableDictionary *)toJsonDict
{
    //    NSAssert(phoneNum,@"phoneNum must not be null!");
    
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    [dict setObject:self.phoneNum forKey:K_CONTACTWAY_KEY_PHONE_NUM];
    
    if(self.phoneArea && self.phoneArea.length != 0)
    {
        [dict setObject:self.phoneArea forKey:K_CONTACTWAY_KEY_PHONE_AREA];
    }
    else
    {
        [dict setObject:K_CONTACTWAY_VALUE_NULL forKey:K_CONTACTWAY_KEY_PHONE_AREA];
    }
    
    return dict;
}

@end

