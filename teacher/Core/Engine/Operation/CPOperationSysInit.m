//
//  CPOperationSysInit.m
//  icouple
//
//  Created by yong wei on 12-3-8.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "CPOperationSysInit.h"
#import "CPSystemEngine.h"
#import "CPResManager.h"
#import "CPDBManagement.h"
#import "CPUserManager.h"
#import "ModelConvertUtils.h"
#import "CPSystemManager.h"
#import "CPMsgManager.h"
#import "CPPetManager.h"

@implementation CPOperationSysInit
- (id) initWithType:(NSInteger )type
{
    self = [super init];
    if (self)
    {
        initType = type;
    }
    return self;
}
-(void)initAccountData
{
    [[[CPSystemEngine sharedInstance] dbManagement] initResources];
    
//    [[[CPSystemEngine sharedInstance] petManager] initPetData];
    
    [[[CPSystemEngine sharedInstance] dbManagement] resetMessageStateBySentError];
    [[[CPSystemEngine sharedInstance] msgManager] refreshMsgGroupList];
//    [[[CPSystemEngine sharedInstance] userManager] initUserCommendList];//是不是需要注释掉
    [[CPSystemEngine sharedInstance] autoLogin]; 
}
-(void)initPreInitData
{
//    [[[CPSystemEngine sharedInstance] petManager] initPetData];
}
-(void)initPersonalInfo
{
    //加载个人信息
    NSArray *allPersonalInfos = [[[CPSystemEngine sharedInstance] dbManagement ] findAllPersonalInfos];
    if (allPersonalInfos&&[allPersonalInfos count]>0)
    {
        CPDBModelPersonalInfo *dbPersonal = [allPersonalInfos objectAtIndex:0];
        [[CPSystemEngine sharedInstance] initPersonalDataMainThread:dbPersonal];
    }
}
-(void)initUserList
{
    //加载好友列表信息
    [[[CPSystemEngine sharedInstance] userManager] initUserList];
}
-(void)main
{
    @autoreleasepool 
    {
        switch (initType) 
        {
            case SYS_INIT_TYPE_IMPORT_AB:
                //导入本地通讯录
            {
                [[CPSystemEngine sharedInstance] importAddrBookToDataBase];
                
                NSArray *allContacts = [[[CPSystemEngine sharedInstance] dbManagement] findAllContactsWithUpdate:nil];
                NSMutableArray *uiContactArray = [[NSMutableArray alloc] initWithCapacity:[allContacts count]];
                for(CPDBModelContact *dbContact in allContacts)
                {
                    [uiContactArray addObject:[ModelConvertUtils dbContactToUi:dbContact]];
                }
                [[CPSystemEngine sharedInstance] updateTagWithContacts:uiContactArray];
//                for(CPDBModelContact *contact in allContacts)
//                {
//                    CPLogInfo(@"%@  %@",contact.fullName,contact.contactWayList);
//                }
            }
                break;
            case SYS_INIT_TYPE_LOGED_INIT:
            {
                //加载会话消息列表信息
                //加载上传队列和下载队列   
                NSArray *downloadList = [[[CPSystemEngine sharedInstance] dbManagement] findAllResourcesWillDownload];
                [[[CPSystemEngine sharedInstance] resManager] reloadDownloadCacheWithArray:downloadList];
                NSArray *uploadList = [[[CPSystemEngine sharedInstance] dbManagement] findAllResourcesWillUpload];
                [[[CPSystemEngine sharedInstance] resManager] reloadUploadCacheWithArray:uploadList];
            }
                break;
            case SYS_INIT_TYPE_PRE_INIT:
//                [self initPreInitData];
                break;
                
            case SYS_INIT_TYPE_PRE_INIT_BG_DLD_PETRES:
                {
//                    [[[CPSystemEngine sharedInstance] petManager] startInitialDld];
                }
                break;
            case SYS_INIT_TYPE_INIT_PERSONAL:
                [self initPersonalInfo];
                break;
            case SYS_INIT_TYPE_INIT_USER_LIST:
                [self initUserList];
                break;
            default:
                [self initAccountData];
                break;
        }
    }
}

@end
