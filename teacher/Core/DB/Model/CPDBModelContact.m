#import "CPDBModelContact.h"

#import "CoreUtils.h"
/**
 * 联系人
 */
#define AB_PERSON_HEADER_PATH @"ab_header"

@implementation CPDBModelContact

@synthesize contactID = contactID_;
@synthesize abPersonID = abPersonID_;
@synthesize updateTime = updateTime_;
@synthesize firstName = firstName_;
@synthesize lastName = lastName_;
@synthesize fullName = fullName_;
@synthesize syncTime = syncTime_;
@synthesize syncMark = syncMark_;
@synthesize headerPhotoPath = headerPhotoPath_;

@synthesize contactWayList = contactWayList_;



-(void)setHeaderPhotoPathWithData:(NSData *)headerPhotoData
{
    if (headerPhotoData)
    {
        NSString *fileName = [NSString stringWithFormat:@"%@.jpg",[self.abPersonID stringValue]];
        BOOL isWriteabled = [CoreUtils writeToFileWithData:headerPhotoData file_name:fileName andPath:AB_PERSON_HEADER_PATH];
        if (isWriteabled)
        {
            NSString *path = AB_PERSON_HEADER_PATH;
            [self setHeaderPhotoPath:[NSString stringWithFormat:@"/%@/%@",path,fileName]];
        }
    }
}
@end

