//
//  RelationshipBrain.h
//  iCouple
//
//  Created by shuo wang on 12-6-6.
//  Copyright (c) 2012年 fanxer. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ExMessageModel.h"
#import "CPUIModelManagement.h"

typedef enum{
    // 跳转到陌生人加关系的页面 -- AddContactWithProfileViewController
    OpenAddContactWithProfile,
    // 跳转到应答页面 -- AddContactAnswerViewController
    OpenAddContactWithAnswer,
    // 跳转到陌生人加关系页面 -- AddContactWithProfileViewController
    OpenAddContactWithCommendProfile,
    // 跳转到独立陌生人profile -- SingleIndependentProfileViewController
    OpenSingleIndependentProfile,
    // 什么都不做
    OpenInvalidate
}AddContactAnalysis;

@interface RelationshipBrain : NSObject

+(RelationshipBrain *) sharedInstance;
// 获得关系分析
-(AddContactAnalysis) getContactAnalysis : (ExMessageModel *)exModel;
@end
