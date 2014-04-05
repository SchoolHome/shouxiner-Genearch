//
//  AddressBookPersonModel.h
//  
//
//  Created by yong weiy on 12-3-21.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AddressBook/AddressBook.h>
typedef enum abPersonState 
{
	AB_PERSON_STATE_DEFAULT = 0,   
	AB_PERSON_STATE_ADD,       
	AB_PERSON_STATE_UPDATE,
	AB_PERSON_STATE_DELETE
}AB_PERSON_STATE;

@interface AbPersonModel : NSObject
{
	NSNumber         *recordID_;
	NSString         *fullName_;
	NSString         *firstName_;
	NSString         *middleName_;
	NSString         *lastName_;
	NSString         *prefix_;
	NSString         *suffix_;
	NSString         *nickname_;
	NSString         *firstNamePhonetic_;
	NSString         *lastNamePhonetic_;
	NSString         *middleNamePhonetic_;
	NSString         *company_;
	NSString         *job_;
	NSString         *department_;
	NSString         *note_;
	NSDate           *birthday_;
	NSDate           *createDate_;
	NSDate           *updateDate_;

	NSArray   *phones_;
	NSArray   *emails_;
	NSArray   *urls_;
	NSArray   *addrs_;
	NSArray   *IMs_;
	
	NSData           *headerPhotoData_;
	AB_PERSON_STATE   abPersonState_;
}
@property (nonatomic, strong) NSNumber         *recordID;
@property (nonatomic, strong) NSString         *fullName;
@property (nonatomic, strong) NSString         *firstName;
@property (nonatomic, strong) NSString         *middleName;
@property (nonatomic, strong) NSString         *lastName;
@property (nonatomic, strong) NSString         *prefix;
@property (nonatomic, strong) NSString         *suffix;
@property (nonatomic, strong) NSString         *nickname;
@property (nonatomic, strong) NSString         *firstNamePhonetic;
@property (nonatomic, strong) NSString         *lastNamePhonetic;
@property (nonatomic, strong) NSString         *middleNamePhonetic;
@property (nonatomic, strong) NSString         *company;
@property (nonatomic, strong) NSString         *job;
@property (nonatomic, strong) NSString         *department;
@property (nonatomic, strong) NSString         *note;
@property (nonatomic, strong) NSDate           *birthday;
@property (nonatomic, strong) NSDate           *createDate;
@property (nonatomic, strong) NSDate           *updateDate;

@property (nonatomic, strong) NSArray   *phones;
@property (nonatomic, strong) NSArray   *emails;
@property (nonatomic, strong) NSArray   *urls;
@property (nonatomic, strong) NSArray   *addrs;
@property (nonatomic, strong) NSArray   *IMs;

@property (nonatomic, strong) NSData           *headerPhotoData;
@property (nonatomic, assign) AB_PERSON_STATE   abPersonState;


#pragma mark public
-(id)initWithABRecordRef:(ABRecordRef)recordref;

-(NSData*)getSmallImage:(CGSize)size;
-(NSData*)getPhotoThumbnail;

@end
