#import "CPDBModelResource.h"

/**
 * 资源
 */

@implementation CPDBModelResource

@synthesize resID = resID_;
@synthesize serverUrl = serverUrl_;
@synthesize createTime = createTime_;
@synthesize fileName = fileName_;
@synthesize filePrefix = filePrefix_;
@synthesize type = type_;
@synthesize mimeType = mimeType_;
@synthesize mark = mark_;
@synthesize objID = objID_;
@synthesize objType = objType_;
@synthesize mediaTime = mediaTime_;
@synthesize fileSize = fileSize_;
-(NSString *)filePrefixPath
{
    NSInteger cpType = [self.objType intValue];
    NSString *prefixPath = @"";
    switch (cpType)
    {
        case RESOURCE_FILE_CP_TYPE_HEADER:
            prefixPath = @"header";
            break;
        case RESOURCE_FILE_CP_TYPE_COUPLE:
            prefixPath = @"couple";
            break;
        case RESOURCE_FILE_CP_TYPE_MSG:
            prefixPath = [NSString stringWithFormat:@"msg/%@/",self.objID];
            break;
        default:
            break;
    }
    return prefixPath;
}
-(BOOL)isVideoMsg
{
    if ([self.type integerValue]==RESOURCE_FILE_TYPE_MSG_VIDEO||[self.type integerValue]==RESOURCE_FILE_GROUP_MSG_VIDEO) 
    {
        return YES;
    }
    return NO;
}
-(BOOL)isAudioMsg
{
    if ([self.type integerValue]==RESOURCE_FILE_TYPE_MSG_AUDIO||[self.type integerValue]==RESOURCE_FILE_GROUP_MSG_AUDIO) 
    {
        return YES;
    }
    return NO;
}
-(BOOL)isImgMsg
{
    if ([self.type integerValue]==RESOURCE_FILE_TYPE_MSG_IMG||[self.type integerValue]==RESOURCE_FILE_GROUP_MSG_IMG) 
    {
        return YES;
    }
    return NO;
}
-(BOOL)isMarkDefault
{
    if ([self.mark integerValue]==MARK_DEFAULT) 
    {
        return YES;
    }
    return NO;
}
@end

