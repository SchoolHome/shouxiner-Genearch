#import "CPUIModelMessageGroupMember.h"

#import "pinyin.h"
/**
 * 群组成员
 */

@implementation CPUIModelMessageGroupMember


@synthesize msgGroupMemID = msgGroupMemID_;
@synthesize msgGroupID = msgGroupID_;
@synthesize mobileNumber = mobileNumber_;
@synthesize userName = userName_;
@synthesize nickName = nickName_;
@synthesize sign = sign_;
@synthesize headerResourceID = headerResourceID_;
@synthesize userInfo = userInfo_;
@synthesize headerPath = headerPath_;
@synthesize domain = domain_;


- (NSString*)getChineseString:(NSString *)string
{
	if ([string length] > 0) 
    {
		unichar char_string = [string characterAtIndex:0];
		if (char_string > HANZI_START && char_string < (HANZI_START + HANZI_COUNT) ) 
        {
			char cc_string = pinyinFirstLetter(char_string);
			
			//特殊汉字拼音的转换
			if(char_string == [[NSString stringWithString:@"曾"] characterAtIndex:0])
			{
				cc_string = 'z';
			}
			else if(char_string == [[NSString stringWithString:@"解"] characterAtIndex:0])
			{
				cc_string = 'x';
			}
			else if(char_string == [[NSString stringWithString:@"仇"] characterAtIndex:0])
			{
				cc_string = 'q';
			}
			else if(char_string == [[NSString stringWithString:@"朴"] characterAtIndex:0])
			{
				cc_string = 'p';
			}
			else if(char_string == [[NSString stringWithString:@"查"] characterAtIndex:0])
			{
				cc_string = 'z';
			}
			else if(char_string == [[NSString stringWithString:@"能"] characterAtIndex:0])
			{
				cc_string = 'n';
			}
			else if(char_string == [[NSString stringWithString:@"乐"] characterAtIndex:0])
			{
				cc_string = 'y';
			}
			else if(char_string == [[NSString stringWithString:@"单"] characterAtIndex:0])
			{
				cc_string = 's';
			}
			string = [NSString stringWithFormat:@"%c%@",cc_string,string];
		}
	}
	return string;//[string uppercaseString];
}

- (BOOL)startwithnumber:(NSString *)string
{
	if ([string length] > 0) 
    {
		unichar char_string = [string characterAtIndex:0];
		if (char_string > 47 && char_string < 58) 
        {
			return YES;
		}
	}
	return NO;
}
- (BOOL)startwithchar:(NSString *)string
{
	if ([string length] > 0) 
    {
		unichar char_string = [string characterAtIndex:0];
		if (char_string > HANZI_START && char_string < (HANZI_START + HANZI_COUNT) ) 
        {
			return YES;
		}
		if (char_string > 64 && char_string < 91) 
        {
			return YES;
		}
		if (char_string > 96 && char_string < 123) 
        {
			return YES;
		}
	}
	return NO;
}

//特殊符号开头
- (BOOL)startwithSpecial:(NSString *)string
{
	return ![self startwithchar:string] && ![self startwithnumber:string];
}

-(NSComparisonResult) orderNameWithGroupMember:(CPUIModelMessageGroupMember *)groupMem
{    
	if ([self startwithSpecial:self.nickName] && ![self startwithSpecial:groupMem.nickName]) 
    {
		return NSOrderedDescending;
	}
	else if(![self startwithSpecial:self.nickName] && [self startwithSpecial:groupMem.nickName]) 
    {
		return NSOrderedAscending;
	}
    
	if ([self startwithnumber:self.nickName] && ![self startwithnumber:groupMem.nickName]) 
    {
		return NSOrderedDescending;
	}
	else if(![self startwithnumber:self.nickName] && [self startwithnumber:groupMem.nickName]) 
    {
		return NSOrderedAscending;
	}
	
	return [[self getChineseString:self.nickName] localizedStandardCompare:[self getChineseString:groupMem.nickName]];
}

-(BOOL)isHiddenMember
{
    if ([self.headerResourceID longLongValue]>0)
    {
        return YES;
    }
    return NO;
}
@end

