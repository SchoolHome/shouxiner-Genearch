//
//  ABPersonMultiValueModel.h
//  
//
//  Created by yong weiy on 12-3-21.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ABPersonMultiValueModel : NSObject
{
	
	NSString     * multiLabel_;
	NSNumber     * multiNumber_;
	NSString     * multiValue_;
	NSDictionary * multiDict_;
}
@property (nonatomic, retain) NSString     * multiLabel;
@property (nonatomic, retain) NSNumber     * multiNumber;
@property (nonatomic, retain) NSString     * multiValue;
@property (nonatomic, retain) NSDictionary * multiDict;
//int 构建实例
-(id)initWithLabelAndNumber:(NSString*)label number:(NSString*)number;
//string 构建实例
-(id)initWithLabelAndString:(NSString*)label string:(NSString*)string;
//字典 构建实例
-(id)initWithLabelAndDictionary:(NSString*)label dictionary:(NSDictionary*)dictionary;

-(NSString *) dictionaryToString;
@end
