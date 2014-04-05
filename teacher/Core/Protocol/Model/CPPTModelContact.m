#import "CPPTModelContact.h"
#import "CPPTModelContactWay.h"

#define K_CONTACT_KEY_NAME                  @"name"
#define K_CONTACT_KEY_CONTACT_LIST          @"list"
#define K_CONTACT_VALUE_NULL                @""

/**
 * 联系人
 */

@implementation CPPTModelContact

#if 0
@synthesize contactID = contactID_;
@synthesize abPersonID = abPersonID_;
@synthesize updateTime = updateTime_;
@synthesize firstName = firstName_;
@synthesize lastName = lastName_;
@synthesize fullName = fullName_;
@synthesize syncTime = syncTime_;
@synthesize syncMark = syncMark_;
@synthesize headerPhotoResID = headerPhotoResID_;

@synthesize contactWayList = contactWayList_;
#endif

@synthesize name = name_;
@synthesize contactWayList = contactWayList_;

+ (CPPTModelContact *)fromJsonDict:(NSDictionary *)jsonDict
{
    CPPTModelContact *contact = nil;
    
    if(jsonDict)
    {
        contact = [[CPPTModelContact alloc] init];
        if(contact)
        {
            contact.name = [jsonDict objectForKey:K_CONTACT_KEY_NAME];

            NSMutableArray *contactWayList = [[NSMutableArray alloc] init];
            NSArray * contactArray = [jsonDict objectForKey:K_CONTACT_KEY_CONTACT_LIST];
            for(NSDictionary *dict in contactArray)
            {
                CPPTModelContactWay *contactWay = [CPPTModelContactWay fromJsonDict:dict];
                [contactWayList addObject:contactWay];
            }
            
            contact.contactWayList = contactWayList;
        }
    }
    
    return contact;

}

- (NSMutableDictionary *)toJsonDict
{
    //    NSAssert(phoneNum,@"phoneNum must not be null!");
    
    NSMutableArray *contactWayArray = [[NSMutableArray alloc] init];
    
    for(CPPTModelContactWay* cway in self.contactWayList)
    {
        [contactWayArray addObject:[cway toJsonDict]];
    }
    
    NSMutableDictionary *contactDict = [NSMutableDictionary dictionary];
    [contactDict setObject:self.name forKey:K_CONTACT_KEY_NAME];
    [contactDict setObject:contactWayArray forKey:K_CONTACT_KEY_CONTACT_LIST];
    
    return contactDict;
}

@end

