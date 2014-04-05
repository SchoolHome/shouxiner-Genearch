//
//  ABPersonMultiValueModel.m
//  
//
//  Created by yong weiy on 12-3-21.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "ABPersonMultiValueModel.h"

@implementation ABPersonMultiValueModel

@synthesize multiLabel = multiLabel_;
@synthesize multiNumber = multiNumber_;
@synthesize multiValue = multiValue_;
@synthesize multiDict = multiDict_;


-(id)initWithLabelAndNumber:(NSString*)label number:(NSString*)number
{
    self=[super init];
	if (self) 
	{
		self.multiLabel = label;
        self.multiNumber = [NSNumber numberWithInt:[number intValue]];
	}
	return self;
}
-(id)initWithLabelAndString:(NSString*)label string:(NSString*)string
{
    self=[super init];
	if (self) 
	{
		self.multiLabel = label;
        self.multiValue = string;
	}
	return self;
}
-(id)initWithLabelAndDictionary:(NSString*)label dictionary:(NSDictionary*)dictionary
{
    self=[super init];
	if (self) 
	{
		self.multiLabel = label;
        self.multiDict = dictionary;
	}
	return self;
}
-(NSString *)dictionaryToString
{
	NSString * string = [NSString stringWithFormat:@"%@:",self.multiLabel];
    for (int i=0; i<[self.multiDict count]; i++) 
    {
		string = [string stringByAppendingFormat:@"%@",[self.multiDict valueForKey:[[self.multiDict allKeys] objectAtIndex:i]]];
	}
	return string;
}
-(void)dealloc
{
}

@end
