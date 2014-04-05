//
//  TSortOperator.h
//  iCouple
//
//  Created by lixiaosong on 12-4-12.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TSortOperator : NSObject{
    
    NSArray * sourceKeyArray;
    NSArray * transedKeyArray;
}
- (NSArray *)doTransferFromArray:(NSArray *)stringArray;
- (NSArray *)doSortFromArray:(NSArray *)stringArray;
@end
