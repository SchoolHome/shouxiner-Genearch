//
//  AFSectionData.h
//  iCouple
//
//  Created by ming bright on 12-8-28.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

///////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////

#pragma mark - AFSectionData

@interface AFSectionData : NSObject
{
}
@property(nonatomic,strong) NSArray  *sectionData;
@property(nonatomic,strong) NSString *sectionTitle;

+ (AFSectionData *)afSectionDataWith:(NSArray *) data_ title:(NSString *) title_;

@end

///////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////

#pragma mark - AFIndexPath

@interface AFIndexPath : NSObject
{
    NSIndexPath *_cellIndexPath;
    NSInteger   _itemIndex;
}

@property(nonatomic,strong) NSIndexPath *cellIndexPath;
@property(nonatomic,assign) NSInteger   itemIndex;

+(AFIndexPath *)indexPathWithCellIndexPath:(NSIndexPath *) indexPath_ itemIndex:(NSInteger) index_;
-(void) print;
@end

///////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////

#pragma mark - AFHeadState

@interface AFHeadState : NSObject
{
    NSString *_modelID; // 唯一标识,加前缀拼接  system_userInfoID ## user_userInfoID ## group_msgGroupID
    
    BOOL _enabled; // 是否可用
    BOOL _isSelectedMode; // 是否是选中聊天模式
    BOOL _canModifyselected; // 能否修改选中状态
    NSInteger _selected; // 无状态：－1 非选中状态 0 选中状态 1
    
    BOOL _showDelete; // 显示删除
}

@property(nonatomic,strong) NSString *modelID;
@property(nonatomic,assign) BOOL enabled;
@property(nonatomic,assign) BOOL isSelectedMode;
@property(nonatomic,assign) BOOL canModifyselected;
@property(nonatomic,assign) NSInteger selected;
@property(nonatomic,assign) BOOL showDelete;

@end


///////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////

#pragma mark - AFHeadStateManager

@class AFHeadState;
@interface AFHeadStateManager : NSObject
{
    NSMutableDictionary *_totalStates; // 所有状态缓存
    
}

@property(nonatomic,strong) NSMutableDictionary *totalStates;

+(AFHeadStateManager *)sharedManager;

-(void)addState:(AFHeadState *)state_;

-(AFHeadState *)stateForKey:(NSString *) modelID_;

-(NSArray *)allKeys; // element: NSString

-(NSArray *)allStates; // element: AFHeadState

-(NSArray *)allSelectedStates; // 所有被勾选中的状态 element: AFHeadState

@end

///////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////