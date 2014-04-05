//
//  AddressBookManagement.h
//  
//
//  Created by yong weiy on 12-3-21.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AddressBook/AddressBook.h>

@protocol addressBookDelegate <NSObject>

@optional
-(void) importAbData;

@end

@interface AbDataManagement : NSObject
{
    ABAddressBookRef               m_addressBook;
	NSDate                       * m_datetime;
}
// 委托调用
@property (nonatomic,assign) id<addressBookDelegate> delegate;
+ (AbDataManagement *) sharedInstance;
- (void) initAddressData;
-(NSMutableArray*)getContacts:(NSDate *)startDateTime;


@end
