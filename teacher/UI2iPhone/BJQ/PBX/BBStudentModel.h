//
//  BBStudentModel.h
//  teacher
//
//  Created by ZhangQing on 14-6-5.
//  Copyright (c) 2014年 ws. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BBStudentModel : NSObject
@property (nonatomic) NSInteger studentID;
@property (nonatomic) BOOL isSelected;
@property (nonatomic) NSString *studentName;
@property (nonatomic, strong) NSIndexPath *currentIndexPath;
@property (nonatomic, strong) NSString *indexStr;
@property NSInteger sectionNumber;
@end
