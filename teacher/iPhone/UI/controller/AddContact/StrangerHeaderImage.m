//
//  StrangerHeaderImage.m
//  iCouple
//
//  Created by shuo wang on 12-6-20.
//  Copyright (c) 2012年 fanxer. All rights reserved.
//

#import "StrangerHeaderImage.h"
#import "CPUIModelUserInfo.h"
#import "CoreUtils.h"


static StrangerHeaderImage *strangeImage = nil;

@implementation StrangerHeaderImageModel

@synthesize userName = _userName;
@synthesize headerImagePath = _headerImagePath;
@synthesize bgImagePath = _bgImagePath;
@synthesize sex = _sex;
@synthesize babyImagePath = _babyImagePath;
@synthesize hasBaby = _hasBaby;
@end

@interface StrangerHeaderImage ()
@property(nonatomic,strong) NSString *serverUrl;
@property(nonatomic,strong) NSString *serverBgUrl;
@property(nonatomic,strong) NSString *userName;
@property(nonatomic,strong) NSNumber *userSex;
@property(nonatomic,strong) NSString *serverBabyUrl;
@property(nonatomic) BOOL userHasBaby;
-(void) notification;
@end

@implementation StrangerHeaderImage
@synthesize serverUrl = _serverUrl;
@synthesize userName = _userName;
@synthesize serverBgUrl = _serverBgUrl;
@synthesize userSex = _userSex;
@synthesize serverBabyUrl = _serverBabyUrl;
@synthesize userHasBaby = _userHasBaby;

+(StrangerHeaderImage *) sharedInstance{
    if (nil == strangeImage) {
        strangeImage = [[StrangerHeaderImage alloc] init];
    }
    return strangeImage;
}

-(id) init{
    self = [super init];
    if (self) {
        [[CPUIModelManagement sharedInstance] addObserver:self forKeyPath:@"getFriendProfileDic" options:0 context:@"getFriendProfileDic"];
        [[CPUIModelManagement sharedInstance] addObserver:self forKeyPath:@"resourceServerUrlDic" options:0 context:@"resourceServerUrlDic"];
    }
    return self;
}

-(void) getUserHeaderImage:(NSString *)userName{
    //#define get_friend_profile_user_profile    @"userProfile"
    //#define get_friend_profile_user_name       @"userName"

    //#define resource_server_url         @"serverUrl"
    if (nil == userName || [userName isEqualToString:@""]) {
//        NSLog(@"userName is nil!!!!!");
        return;
    }
    CPUIModelUserInfo *userInfor = [[CPUIModelUserInfo alloc] init];
    [userInfor setName:userName];
    [[CPUIModelManagement sharedInstance] getUserProfileWithUser:userInfor];
}

-(void) observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context{
    if ([keyPath isEqualToString:@"getFriendProfileDic"]) {
        CPUIModelUserInfo *userProfile = [[CPUIModelManagement sharedInstance].getFriendProfileDic objectForKey:get_friend_profile_user_profile];
        if (nil == userProfile) {
            return;
        }else {
            self.serverUrl = userProfile.headerPath;
            self.serverBgUrl = userProfile.selfBgImgPath;
            self.serverBabyUrl = userProfile.selfBabyHeaderImgPath;
            self.userName = userProfile.name;
            self.userSex = userProfile.sex;
            self.userHasBaby = [userProfile.hasBaby boolValue];
            [self notification];
        }
    }else if ([keyPath isEqualToString:@"resourceServerUrlDic"]) {
        NSString *Url = [[CPUIModelManagement sharedInstance].resourceServerUrlDic objectForKey:resource_server_url];
        if ( [CoreUtils stringIsNotNull: self.serverUrl] && [self.serverUrl isEqualToString:Url]) {
            [self notification];
        }else if ([CoreUtils stringIsNotNull: self.serverBgUrl] && [self.serverBgUrl isEqualToString:Url]) {
            [self notification];
        }
//        else if ([CoreUtils stringIsNotNull:self.serverBabyUrl] && [self.serverBabyUrl isEqualToString:Url]){
//            [self notification];
//        }
    }
}

-(void) notification{
    NSString *headerPath = [[CPUIModelManagement sharedInstance] getFilePathWithServerUrl:self.serverUrl];
    NSString *bgImage = [[CPUIModelManagement sharedInstance] getFilePathWithServerUrl:self.serverBgUrl];
//    NSString *babyImage = [[CPUIModelManagement sharedInstance] getFilePathWithServerUrl:self.serverBabyUrl];
    
    UIImage *image = [UIImage imageWithContentsOfFile:headerPath];
    if (nil != image) {
        StrangerHeaderImageModel *headerImageModel = [[StrangerHeaderImageModel alloc] init];
        headerImageModel.userName = self.userName;
        headerImageModel.headerImagePath = headerPath;
        headerImageModel.sex = self.userSex;
        headerImageModel.hasBaby = self.userHasBaby;
        NSNotification* strangerHeaderImageNotification = [NSNotification notificationWithName:@"StrangerHeaderImage" object:headerImageModel];
        [[NSNotificationCenter defaultCenter] postNotification:strangerHeaderImageNotification];
    }
    
    image = [UIImage imageWithContentsOfFile:bgImage];
    if (nil != image) {
        StrangerHeaderImageModel *bgImageModel = [[StrangerHeaderImageModel alloc] init];
        bgImageModel.userName = self.userName;
        bgImageModel.bgImagePath = bgImage;
        bgImageModel.sex = self.userSex;
        bgImageModel.hasBaby = self.userHasBaby;
        NSNotification* strangerHeaderImageNotification = [NSNotification notificationWithName:@"StrangerHeaderImage" object:bgImageModel];
        [[NSNotificationCenter defaultCenter] postNotification:strangerHeaderImageNotification];
    }
    
//    image = [UIImage imageWithContentsOfFile:babyImage];
//    if (nil != image) {
//        StrangerHeaderImageModel *babyImageModel = [[StrangerHeaderImageModel alloc] init];
//        babyImageModel.userName = self.userName;
//        babyImageModel.babyImagePath = babyImage;
//        babyImageModel.sex = self.userSex;
//        babyImageModel.hasBaby = self.userHasBaby;
//        NSNotification* strangerHeaderImageNotification = [NSNotification notificationWithName:@"StrangerHeaderImage" object:babyImageModel];
//        [[NSNotificationCenter defaultCenter] postNotification:strangerHeaderImageNotification];
//    }
    
}

-(void) dealloc{
    [[CPUIModelManagement sharedInstance] removeObserver:self forKeyPath:@"getFriendProfileDic" context:@"getFriendProfileDic"];
    [[CPUIModelManagement sharedInstance] removeObserver:self forKeyPath:@"resourceServerUrlDic" context:@"resourceServerUrlDic"];
}















@end
