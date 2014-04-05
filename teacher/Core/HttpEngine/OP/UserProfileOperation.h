//
//  UserProfileOperation.h
//  teacher
//
//  Created by singlew on 14-3-16.
//  Copyright (c) 2014年 ws. All rights reserved.
//

typedef enum{
    kGetUserProfile,
    kGetUserContacts,
    kUpdateUserHeaderImage,
    kUpdateUserHeader,
}UserProfile;

#import "PalmOperation.h"

@interface UserProfileOperation : PalmOperation
-(UserProfileOperation *) initGetUser;

-(UserProfileOperation *) initGetContacts;

-(UserProfileOperation *) initUpdateUserHeaderImage : (NSData*)imageData;

-(UserProfileOperation *) initUpdateUserHeader:(NSString *)imageUrlPath;
@end
