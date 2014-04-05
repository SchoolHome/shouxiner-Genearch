//
//  CPOperationPersonalUpdate.h
//  iCouple
//
//  Created by yong wei on 12-3-17.
//  Copyright (c) 2012年 fanxer. All rights reserved.
//

#import "CPOperation.h"

typedef enum
{
    UPDATE_PERSONAL_TYPE_DEFAULT = 0,
    UPDATE_PERSONAL_TYPE_PROTOCOL = 1,
    UPDATE_PERSONAL_TYPE_INFO_DATA = 2,

    UPDATE_PERSONAL_TYPE_NAME = 3,
    UPDATE_PERSONAL_TYPE_RECENT = 4,
    UPDATE_PERSONAL_TYPE_SINGLE_TIME = 5,
    UPDATE_PERSONAL_TYPE_BABY = 6,

}UpdateType;
@class CPDBModelPersonalInfo;
@class CPUIModelPersonalInfo;
@class CPDBModelPersonalInfoData;
@interface CPOperationPersonalUpdate : CPOperation
{
    NSInteger updateType;
    CPDBModelPersonalInfo *personalInfo;
    CPUIModelPersonalInfo *uiPersonalInfo;
    NSObject *personalObj;
    CPDBModelPersonalInfoData *personalData;
}
- (id) initWithInfo:(CPDBModelPersonalInfo *)dbPersonalInfo;
- (id) initWithObj:(NSObject *)obj;
- (id) initWithPersonalInfoData:(CPDBModelPersonalInfoData *)personalInfoData;

- (id) initWithInfo:(CPDBModelPersonalInfo *)dbPersonalInfo andType:(NSInteger)type;
- (id) initWithPersonalInfo:(CPUIModelPersonalInfo *)uiUpdatePersonalInfo andType:(NSInteger)type;
@end
