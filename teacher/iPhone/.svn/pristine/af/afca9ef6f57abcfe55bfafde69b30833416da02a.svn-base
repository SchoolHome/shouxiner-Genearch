//
//  AFSectionData.m
//  iCouple
//
//  Created by ming bright on 12-8-28.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "AFSectionData.h"

///////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////

#pragma mark - AFSectionData

@implementation AFSectionData

@synthesize sectionData = _sectionData;
@synthesize sectionTitle= _sectionTitle;


+ (AFSectionData *)afSectionDataWith:(NSArray *) data_ title:(NSString *) title_{
    
    AFSectionData *temp = [[AFSectionData alloc] init];
    temp.sectionData = data_;
    temp.sectionTitle = title_;
    
    return temp;
}

@end

///////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////

#pragma mark - AFIndexPath

@implementation AFIndexPath

@synthesize cellIndexPath = _cellIndexPath;
@synthesize itemIndex = _itemIndex;

+(AFIndexPath *)indexPathWithCellIndexPath:(NSIndexPath *) indexPath_ itemIndex:(NSInteger) index_{
    
    AFIndexPath *_newIndexPath = [[AFIndexPath alloc] init];
    _newIndexPath.cellIndexPath = indexPath_;
    _newIndexPath.itemIndex = index_;
    
    return _newIndexPath;
    
}

-(void) print{
    NSLog(@"##AFIndexPath## [section]: %d [row] %d [index] %d ",_cellIndexPath.section,_cellIndexPath.row,_itemIndex);
}

@end

///////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////

#pragma mark - AFHeadState

@implementation AFHeadState 

@synthesize  modelID = _modelID;
@synthesize  enabled = _enabled;
@synthesize  isSelectedMode = _isSelectedMode;
@synthesize  canModifyselected = _canModifyselected;
@synthesize  selected = _selected;
@synthesize  showDelete = _showDelete;

@end


///////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////
#pragma mark - AFHeadStateManager

@implementation AFHeadStateManager
@synthesize totalStates = _totalStates;

-(id)init{
    self = [super init];
    if (self) {
        //
        _totalStates = [[NSMutableDictionary alloc] init];
    }
    return self;
}

+(AFHeadStateManager *)sharedManager{
    static AFHeadStateManager *_instance = nil;
    @synchronized(self){
        if(_instance == nil){
            _instance = [[AFHeadStateManager alloc] init];
        }
    }
    return _instance;
}

-(void)addState:(AFHeadState *)state_{
    [_totalStates setValue:state_ forKey:state_.modelID];
}

-(AFHeadState *)stateForKey:(NSString *) modelID_{
    return (AFHeadState *)[_totalStates valueForKey:modelID_];
}

-(NSArray *)allKeys{
    return [_totalStates allKeys];
}

-(NSArray *)allStates{
    return [_totalStates allValues];
}

-(NSArray *)allSelectedStates{
    
    NSMutableArray *selectedArray = [[NSMutableArray alloc] init];
    
    for (NSString *key in [[AFHeadStateManager sharedManager] allKeys]) {   
        AFHeadState *temp = [[AFHeadStateManager sharedManager] stateForKey:key];
        
        if (1 == temp.selected) {
            [selectedArray addObject:temp];
        }
    }
    return (NSArray *)selectedArray;
}

@end

///////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////