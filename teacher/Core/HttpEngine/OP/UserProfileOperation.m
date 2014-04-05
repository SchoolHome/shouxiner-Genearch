//
//  UserProfileOperation.m
//  teacher
//
//  Created by singlew on 14-3-16.
//  Copyright (c) 2014年 ws. All rights reserved.
//

#import "UserProfileOperation.h"
#import "CPHttpEngineConst.h"
#import "PalmUIManagement.h"
#import "CoreUtils.h"

@interface UserProfileOperation ()
@property (nonatomic) UserProfile type;
@property (nonatomic,strong) NSString* fileName;
-(void) getUserProfile;
-(void) getUserContacts;
-(void) updateUserHeader;
-(void) updateUserHeaderResult;
@end

@implementation UserProfileOperation

-(UserProfileOperation *) initGetUser{
    if ([self initOperation]) {
        self.type = kGetUserProfile;
        CPLGModelAccount *account = [[CPSystemEngine sharedInstance] accountModel];
        NSString *urlStr = [NSString stringWithFormat:@"http://%@/mapi/getUserInfo?uid=%@",K_HOST_NAME_OF_PALM_SERVER,account.uid];
        [self setHttpRequestGetWithUrl:urlStr];
    }
    return self;
}

-(UserProfileOperation *) initGetContacts{
    if ([self initOperation]) {
        self.type = kGetUserContacts;
        NSString *urlStr = [NSString stringWithFormat:@"http://%@/mapi/getContacts",K_HOST_NAME_OF_PALM_SERVER];
        [self setHttpRequestGetWithUrl:urlStr];
    }
    return self;
}

-(UserProfileOperation *) initUpdateUserHeaderImage:(NSData *)imageData{
    if ([self initOperation]) {
        self.type = kUpdateUserHeaderImage;
        CPLGModelAccount *account = [[CPSystemEngine sharedInstance] accountModel];
        NSString *writeFileName = [NSString stringWithFormat:@"%@.%@",[CoreUtils getUUID],@".jpg"];
        BOOL isSave = NO;
        NSString *filePath = [NSString stringWithFormat:@"%@/msg/",account.loginName];
        [CoreUtils createPath:filePath];
        isSave = [CoreUtils writeToFileWithData:imageData file_name:writeFileName andPath:filePath];
        self.fileName = [NSString stringWithFormat:@"%@/%@%@",[CoreUtils getDocumentPath],filePath,writeFileName];
        NSString *urlStr = [NSString stringWithFormat:@"http://%@/attachment/put/open/logo/%@",K_HOST_NAME_OF_PALM_UPLOAD,account.uid];
        [self setHttpRequestPostWithUrl:urlStr params:nil];
    }
    
    return self;
}

-(UserProfileOperation *) initUpdateUserHeader:(NSString *)imageUrlPath{
    if ([self initOperation]) {
        self.type = kUpdateUserHeader;
        NSString *urlStr = [NSString stringWithFormat:@"http://%@/mapi/setUserInfo",K_HOST_NAME_OF_PALM_SERVER];
        [self setHttpRequestPostWithUrl:urlStr params:[NSDictionary dictionaryWithObjectsAndKeys:imageUrlPath,@"avatar", nil]];
    }
    return self;
}

-(void) getUserProfile{
#ifdef TEST
    [self.request addRequestHeader:@"Host" value:@"www.shouxiner.com"];
#endif
    [self.request setRequestCompleted:^(NSDictionary *data){
        dispatch_block_t updateTagBlock = ^{
            [PalmUIManagement sharedInstance].userProfile = data;
        };
        dispatch_async(dispatch_get_main_queue(), updateTagBlock);
    }];
    [self startAsynchronous];
}

-(void) getUserContacts{
#ifdef TEST
    [self.request addRequestHeader:@"Host" value:@"www.shouxiner.com"];
#endif
    [self.request setRequestCompleted:^(NSDictionary *data){
        dispatch_block_t updateTagBlock = ^{
            [PalmUIManagement sharedInstance].userContacts = data;
        };
        dispatch_async(dispatch_get_main_queue(), updateTagBlock);
    }];
    [self startAsynchronous];
}

-(void) updateUserHeader{
#ifdef TEST
    [self.dataRequest addRequestHeader:@"Host" value:@"www.shouxiner.com"];
#endif
    [self.dataRequest setFile:self.fileName withFileName:[self.fileName lastPathComponent] andContentType:@"image/jpeg" forKey:@"file"];
    self.dataRequest.requestCookies = [[NSMutableArray alloc] initWithObjects:[PalmUIManagement sharedInstance].suid,[PalmUIManagement sharedInstance].php, nil];
    [self.dataRequest setRequestCompleted:^(NSDictionary *data){
        dispatch_block_t updateTagBlock = ^{
            [PalmUIManagement sharedInstance].updateUserHeader = data;
        };
        dispatch_async(dispatch_get_main_queue(), updateTagBlock);
    }];
    [self startAsynchronous];
}

-(void) updateUserHeaderResult{
#ifdef TEST
    [self.dataRequest addRequestHeader:@"Host" value:@"www.shouxiner.com"];
#endif
    self.dataRequest.requestCookies = [[NSMutableArray alloc] initWithObjects:[PalmUIManagement sharedInstance].suid,[PalmUIManagement sharedInstance].php, nil];
    [self.dataRequest setRequestCompleted:^(NSDictionary *data){
        dispatch_block_t updateTagBlock = ^{
            [PalmUIManagement sharedInstance].updateUserHeaderResult = data;
        };
        dispatch_async(dispatch_get_main_queue(), updateTagBlock);
    }];
    [self startAsynchronous];
}


-(void) main{
    switch (self.type) {
        case kGetUserProfile:
            [self getUserProfile];
            break;
        case kGetUserContacts:
            [self getUserContacts];
            break;
        case kUpdateUserHeaderImage:
            [self updateUserHeader];
            break;
        case kUpdateUserHeader:
            [self updateUserHeaderResult];
            break;
        default:
            break;
    }
}
@end
