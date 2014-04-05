#import <Foundation/Foundation.h>

#import "ProtocolModelDefines.h"
#import "DBModelDefines.h"
#import "UIModelDefines.h"

@interface ModelConvertUtils : NSObject
{

}

+(NSString *)getAccountNameWithName:(NSString *)name;
+(NSString *)getDomainWithName:(NSString *)name;

//PT-->DB
+(CPDBModelContact *)ptContactToDb:(CPPTModelContact *)ptContact;
+(CPDBModelContactWay *)ptContactWayToDb:(CPPTModelContactWay *)ptContactWay;
+(CPDBModelUserInfo *)ptUserInfoToDb:(CPPTModelUserInfo *)ptUserInfo;
+(CPDBModelUserInfoData *)ptUserInfoDataToDb:(CPPTModelUserInfoData *)ptUserInfoData;
+(CPDBModelUserInfoDataAddition *)ptUserInfoDataAdditionToDb:(CPPTModelUserInfoDataAddition *)ptUserInfoDataAddition;
+(CPDBModelMessageGroup *)ptMessageGroupToDb:(CPPTModelMessageGroup *)ptMessageGroup;
+(CPDBModelMessageGroupMember *)ptMessageGroupMemberToDb:(CPPTModelMessageGroupMember *)ptMessageGroupMember;
+(CPDBModelMessage *)ptMessageToDb:(CPPTModelMessage *)ptMessage;
+(CPDBModelPersonalInfo *)ptPersonalInfoToDb:(CPPTModelPersonalInfo *)ptPersonalInfo;
+(CPDBModelPersonalInfo *)ptUserProfileToDbPersonalInfo:(CPPTModelUserProfile *)ptUserProfile;
+(CPDBModelUserInfo *)ptUserProfileToDbUserInfo:(CPPTModelUserProfile *)ptUserProfile;
+(CPUIModelUserInfo *)ptUserProfileToUiUserInfo:(CPPTModelUserProfile *)ptUserProfile;
+(CPDBModelBabyInfoData *)ptBabyInfoDataToDb:(CPPTModelBabyInfoData *)ptBabyInfoData;
+(CPDBModelPersonalInfoData *)ptPersonalInfoDataToDb:(CPPTModelPersonalInfoData *)ptPersonalInfoData;
+(CPDBModelPersonalInfoDataAddition *)ptPersonalInfoDataAdditionToDb:(CPPTModelPersonalInfoDataAddition *)ptPersonalInfoDataAddition;
+(CPDBModelResource *)ptResourceToDb:(CPPTModelResource *)ptResource;

//DB-->PT
+(CPPTModelContact *)dbContactToPt:(CPDBModelContact *)dbContact;
+(CPPTModelContactWay *)dbContactWayToPt:(CPDBModelContactWay *)dbContactWay;
+(CPPTModelUserInfo *)dbUserInfoToPt:(CPDBModelUserInfo *)dbUserInfo;
+(CPPTModelUserInfoData *)dbUserInfoDataToPt:(CPDBModelUserInfoData *)dbUserInfoData;
+(CPPTModelUserInfoDataAddition *)dbUserInfoDataAdditionToPt:(CPDBModelUserInfoDataAddition *)dbUserInfoDataAddition;
+(CPPTModelMessageGroup *)dbMessageGroupToPt:(CPDBModelMessageGroup *)dbMessageGroup;
+(CPPTModelMessageGroupMember *)dbMessageGroupMemberToPt:(CPDBModelMessageGroupMember *)dbMessageGroupMember;
+(CPPTModelMessage *)dbMessageToPt:(CPDBModelMessage *)dbMessage;
+(CPPTModelPersonalInfo *)dbPersonalInfoToPt:(CPDBModelPersonalInfo *)dbPersonalInfo;
+(CPPTModelBabyInfoData *)dbBabyInfoDataToPt:(CPDBModelBabyInfoData *)dbBabyInfoData;
+(CPPTModelPersonalInfoData *)dbPersonalInfoDataToPt:(CPDBModelPersonalInfoData *)dbPersonalInfoData;
+(CPPTModelPersonalInfoDataAddition *)dbPersonalInfoDataAdditionToPt:(CPDBModelPersonalInfoDataAddition *)dbPersonalInfoDataAddition;
+(CPPTModelResource *)dbResourceToPt:(CPDBModelResource *)dbResource;
+(CPPTModelContactInfos *)dbContactsToPt:(NSArray *)dbContactArray;

//UI-->DB
+(CPDBModelContact *)uiContactToDb:(CPUIModelContact *)uiContact;
+(CPDBModelContactWay *)uiContactWayToDb:(CPUIModelContactWay *)uiContactWay;
+(CPDBModelUserInfo *)uiUserInfoToDb:(CPUIModelUserInfo *)uiUserInfo;
+(CPDBModelUserInfoData *)uiUserInfoDataToDb:(CPUIModelUserInfoData *)uiUserInfoData;
+(CPDBModelUserInfoDataAddition *)uiUserInfoDataAdditionToDb:(CPUIModelUserInfoDataAddition *)uiUserInfoDataAddition;
+(CPDBModelMessageGroup *)uiMessageGroupToDb:(CPUIModelMessageGroup *)uiMessageGroup;
+(CPDBModelMessageGroupMember *)uiMessageGroupMemberToDb:(CPUIModelMessageGroupMember *)uiMessageGroupMember;
+(CPDBModelMessage *)uiMessageToDb:(CPUIModelMessage *)uiMessage;
+(CPDBModelPersonalInfo *)uiPersonalInfoToDb:(CPUIModelPersonalInfo *)uiPersonalInfo;
+(CPDBModelBabyInfoData *)uiBabyInfoDataToDb:(CPUIModelBabyInfoData *)uiBabyInfoData;
+(CPDBModelPersonalInfoData *)uiPersonalInfoDataToDb:(CPUIModelPersonalInfoData *)uiPersonalInfoData;
+(CPDBModelPersonalInfoDataAddition *)uiPersonalInfoDataAdditionToDb:(CPUIModelPersonalInfoDataAddition *)uiPersonalInfoDataAddition;
+(CPDBModelResource *)uiResourceToDb:(CPUIModelResource *)uiResource;

//DB-->UI
+(CPUIModelContact *)dbContactToUi:(CPDBModelContact *)dbContact;
+(CPUIModelContactWay *)dbContactWayToUi:(CPDBModelContactWay *)dbContactWay;
+(CPUIModelUserInfo *)dbUserInfoToUi:(CPDBModelUserInfo *)dbUserInfo;
+(void)convertDbUserInfoToUi:(CPDBModelUserInfo *)dbUserInfo withUiUserInfo:(CPUIModelUserInfo *)uiUserInfo;
+(CPUIModelUserInfoData *)dbUserInfoDataToUi:(CPDBModelUserInfoData *)dbUserInfoData;
+(CPUIModelUserInfoDataAddition *)dbUserInfoDataAdditionToUi:(CPDBModelUserInfoDataAddition *)dbUserInfoDataAddition;
+(CPUIModelMessageGroup *)dbMessageGroupToUi:(CPDBModelMessageGroup *)dbMessageGroup;
+(CPUIModelMessageGroupMember *)dbMessageGroupMemberToUi:(CPDBModelMessageGroupMember *)dbMessageGroupMember;
+(CPUIModelMessage *)dbMessageToUi:(CPDBModelMessage *)dbMessage;
+(CPUIModelPersonalInfo *)dbPersonalInfoToUi:(CPDBModelPersonalInfo *)dbPersonalInfo;
+(CPUIModelBabyInfoData *)dbBabyInfoDataToUi:(CPDBModelBabyInfoData *)dbBabyInfoData;
+(CPUIModelPersonalInfoData *)dbPersonalInfoDataToUi:(CPDBModelPersonalInfoData *)dbPersonalInfoData;
+(CPUIModelPersonalInfoDataAddition *)dbPersonalInfoDataAdditionToUi:(CPDBModelPersonalInfoDataAddition *)dbPersonalInfoDataAddition;
+(CPUIModelResource *)dbResourceToUi:(CPDBModelResource *)dbResource;

//UI-->PT
+(CPPTModelContact *)uiContactToPt:(CPUIModelContact *)uiContact;
+(CPPTModelContactWay *)uiContactWayToPt:(CPUIModelContactWay *)uiContactWay;
+(CPPTModelUserInfo *)uiUserInfoToPt:(CPUIModelUserInfo *)uiUserInfo;
+(CPPTModelUserInfoData *)uiUserInfoDataToPt:(CPUIModelUserInfoData *)uiUserInfoData;
+(CPPTModelUserInfoDataAddition *)uiUserInfoDataAdditionToPt:(CPUIModelUserInfoDataAddition *)uiUserInfoDataAddition;
+(CPPTModelMessageGroup *)uiMessageGroupToPt:(CPUIModelMessageGroup *)uiMessageGroup;
+(CPPTModelMessageGroupMember *)uiMessageGroupMemberToPt:(CPUIModelMessageGroupMember *)uiMessageGroupMember;
+(CPPTModelMessage *)uiMessageToPt:(CPUIModelMessage *)uiMessage;
+(CPPTModelPersonalInfo *)uiPersonalInfoToPt:(CPUIModelPersonalInfo *)uiPersonalInfo;
+(CPPTModelBabyInfoData *)uiBabyInfoDataToPt:(CPUIModelBabyInfoData *)uiBabyInfoData;
+(CPPTModelPersonalInfoData *)uiPersonalInfoDataToPt:(CPUIModelPersonalInfoData *)uiPersonalInfoData;
+(CPPTModelPersonalInfoDataAddition *)uiPersonalInfoDataAdditionToPt:(CPUIModelPersonalInfoDataAddition *)uiPersonalInfoDataAddition;
+(CPPTModelResource *)uiResourceToPt:(CPUIModelResource *)uiResource;


+(CPPTModelUserRegisterInfo *)uiRegInfoToPt:(CPUIModelRegisterInfo *)regInfo;

//PT-->UI
+(CPUIModelUserInfo *)ptUserInfoToUI:(CPPTModelUserInfo *)ptUserInfo;

@end
