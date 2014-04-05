//
//  AFHeadItem.m
//  AllFriends_dev
//
//  Created by ming bright on 12-8-15.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "AFHeadItem.h"
#import <QuartzCore/QuartzCore.h>
#import "CPUIModelUserInfo.h"
#import "CPUIModelMessageGroup.h"
#import "CPUIModelMessageGroupMember.h"
#import "ColorUtil.h"

///////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////

@interface AFHeadItem(private)
-(UIImage *)groupHeader:(CPUIModelMessageGroup *) groupModel;
-(UIImage *)singleHeader:(CPUIModelUserInfo *)singleModel;
-(UIImage *)roundCoupleHeader:(UIImage *)image;
@end


@implementation AFHeadItem
@synthesize delegate = _delegate;
@synthesize indexPath = _indexPath;
@synthesize headItemData = _headItemData;
@synthesize selected = _selected;
@synthesize headState = _headState;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        _headButton = [[UIButton alloc] initWithFrame:CGRectMake(10, 10, 55, 55)];
        _headButton.backgroundColor = [UIColor colorWithRed:0.95 green:0.95 blue: 0.95 alpha:0];
        [self addSubview:_headButton];
        [_headButton addTarget:self action:@selector(_headButtonTaped:) forControlEvents:UIControlEventTouchUpInside];
        [_headButton setImage:[UIImage imageNamed:@"headpic_shadow_110x110"] forState:UIControlStateNormal];
        [_headButton setBackgroundImage:[UIImage imageNamed:@"headpic_gray_man_110x110"] forState:UIControlStateNormal];
        
        _headButton.layer.masksToBounds = YES;
        _headButton.layer.cornerRadius = 5.0;
        _headButton.layer.borderWidth = 0.5;
        _headButton.layer.borderColor = [[UIColor clearColor] CGColor];
        
        _deleteButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _deleteButton.frame = CGRectMake(0, 0, 25.5, 25.5);
        [_deleteButton setImage:[UIImage imageNamed:@"btn_grid_close"] forState:UIControlStateNormal];
        [_deleteButton setImage:[UIImage imageNamed:@"btn_grid_close_press"] forState:UIControlStateHighlighted];
        _deleteButton.backgroundColor = [UIColor clearColor];
        [self addSubview:_deleteButton];
        [_deleteButton addTarget:self action:@selector(_deleteButtonTaped:) forControlEvents:UIControlEventTouchUpInside];
        _deleteButton.hidden = YES;
        
        _checkedImageView = [[UIImageView alloc] initWithFrame:CGRectMake((frame.size.width - 78/2)/2, (55 - 78/2)/2+10, 78/2, 78/2)];
        _checkedImageView.backgroundColor = [UIColor clearColor];
        [self addSubview:_checkedImageView];
        _checkedImageView.hidden = YES;
        
        _nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, _headButton.frame.size.height + 5+10, 55, 15)];
        _nameLabel.textAlignment = UITextAlignmentCenter;
        _nameLabel.textColor = [UIColor grayColor];
        _nameLabel.font = [UIFont systemFontOfSize:12];
        [self addSubview:_nameLabel];
        _nameLabel.text = @"昵称";
        
        UILongPressGestureRecognizer *gestureRecognizer = [[UILongPressGestureRecognizer alloc] initWithTarget:self 
                                                                                                        action:@selector(_itemGestureRecognizer:)];
        [self addGestureRecognizer:gestureRecognizer];
        
    }
    return self;
}

-(void)setEnabled:(BOOL) enabled_{
    _headButton.enabled = enabled_;
}

-(void)_headButtonTaped:(UIButton *)sender{
    
    [self.indexPath print];
    [[NSNotificationCenter defaultCenter] postNotificationName:kAFHeadItemTapNotification object:self];
}

-(void)_itemGestureRecognizer:(UILongPressGestureRecognizer *) gestureRecognizer_{
    if (gestureRecognizer_.state == UIGestureRecognizerStateBegan) {
        [[NSNotificationCenter defaultCenter] postNotificationName:kAFHeadItemLongPressNotification object:self];
    }
}

-(void)_deleteButtonTaped:(UIButton *)sender{
    [[NSNotificationCenter defaultCenter] postNotificationName:kAFHeadItemDeleteTapNotification object:self];
}


- (void)setSelected:(BOOL)selected_ {
    
    _selected = selected_;
    _checkedImageView.hidden = NO;
    
    if (_selected) {
        _checkedImageView.image = [UIImage imageNamed:@"wall_item_select_press"];
    }
    else {
        _checkedImageView.image = [UIImage imageNamed:@"wall_item_select_nor"];
    }
}

-(void)setHeadState:(AFHeadState *)headState_{
    
    _headState = headState_;

    if (_headState.enabled) {
        _headButton.enabled = YES;
    }else {
        _headButton.enabled = NO;
    }

    if (_headState.isSelectedMode) {
        _checkedImageView.hidden = NO;
    }else {
        _checkedImageView.hidden = YES;
    }

    switch (_headState.selected) {
        case -1:
            //
            self.selected = NO;
            _checkedImageView.hidden = YES;
            break;
        case 0:
            //
            self.selected = NO;
            break;
        case 1:
            //
            self.selected = YES;
            break;
        default:
            break;
    }
    
    if (_headState.showDelete) {
        _deleteButton.hidden = NO;
    }else {
        _deleteButton.hidden = YES;
    }
}


-(void)setHeadItemData:(id)headItemData_{
    _headItemData = headItemData_;
    
    if (_headItemData) {
        if ([_headItemData isKindOfClass:[CPUIModelUserInfo class]]) {   // 好友
            
            CPUIModelUserInfo *info = (CPUIModelUserInfo *) _headItemData;
            _nameLabel.text = info.nickName;
            //UIImage *image = [[UIImage alloc] initWithContentsOfFile:info.headerPath];
            [_headButton setImage:[self singleHeader:info] forState:UIControlStateNormal];
            
            NSString *key;
            
            switch ([info.type intValue]) {
                case USER_RELATION_TYPE_COMMON:
                case USER_RELATION_TYPE_CLOSED: 
                case USER_RELATION_TYPE_LOVER:
                case USER_RELATION_TYPE_COUPLE:
                case USER_RELATION_TYPE_MARRIED:   // 普通人
                {
                    key = [NSString stringWithFormat:@"%@%d",kAFHeadStatePrefixUser,[info.userInfoID intValue]];
                }
                    //
                    break;
                case USER_MANAGER_FANXER:
                case USER_MANAGER_SYSTEM:
                case USER_MANAGER_XIAOSHUANG:   // 系统
                {
                    key = [NSString stringWithFormat:@"%@%d",kAFHeadStatePrefixSystem,[info.userInfoID intValue]];
                }
                    //
                    break;   
                default:
                    break;
            }
            
            self.headState = [[AFHeadStateManager sharedManager] stateForKey:key];
            
           // NSLog(@" self.headState    %@",  self.headState);
            
        }else if ([_headItemData isKindOfClass:[CPUIModelMessageGroup class]]){  // 群
            CPUIModelMessageGroup *info = (CPUIModelMessageGroup *) _headItemData;
            
            [_headButton setImage:[self groupHeader:info] forState:UIControlStateNormal];
            _nameLabel.text = info.groupName;
            //
            NSString *key = [NSString stringWithFormat:@"%@%d",kAFHeadStatePrefixGroup,[info.msgGroupID intValue]];
            self.headState = [[AFHeadStateManager sharedManager] stateForKey:key];
        }

        self.hidden = NO;
    }else {
        self.hidden = YES;
    }
    
}



#pragma mark - create header images

-(UIImage *)groupHeader:(CPUIModelMessageGroup *) groupModel{
    
    
    UIImage *backImage = [UIImage imageNamed:@"headpic_group_110x110"];
    
    
    if (NULL != UIGraphicsBeginImageContextWithOptions)
        UIGraphicsBeginImageContextWithOptions(backImage.size, NO, [UIScreen mainScreen].scale);
    else
        UIGraphicsBeginImageContext(backImage.size);
    
    [backImage drawInRect:CGRectMake(0, 0, backImage.size.width, backImage.size.height)];
    
    int count = 0;
    
    for (int i = 0; i < [groupModel.memberList count]; i++) {
        
        CPUIModelMessageGroupMember *member =  [groupModel.memberList objectAtIndex:i]; 
        if (![member isHiddenMember]) {
            
            CPUIModelUserInfo *userInfo = member.userInfo;
            UIImage *image;
            if (userInfo) {
                image = [UIImage imageWithContentsOfFile:userInfo.headerPath];
            }else {
                image = [UIImage imageWithContentsOfFile:member.headerPath];
            }
            
            CGFloat radius = 5.0f;
            
            if (image) {
                if (0 == count) {
                    [image drawInRect:CGRectMake(5, 5, 20, 20)];
                    
                    [[UIColor colorWithHexString:@"#DDDDDD"] set];  // 底图颜色
                    //[[UIColor redColor] set];
                    UIBezierPath* roundedRectanglePath = [UIBezierPath bezierPathWithRoundedRect: 
                                                          CGRectMake(5-radius/2, 5-radius/2, 20+radius, 20+radius) cornerRadius: radius];
                    [roundedRectanglePath setLineWidth:radius];
                    [roundedRectanglePath stroke];
                }else if (1 == count) {
                    [image drawInRect:CGRectMake(30, 5, 20, 20)];
                    UIBezierPath* roundedRectanglePath = [UIBezierPath bezierPathWithRoundedRect: 
                                                          CGRectMake(30-radius/2, 5-radius/2, 20+radius, 20+radius) cornerRadius: radius];
                    [roundedRectanglePath setLineWidth:radius];
                    [roundedRectanglePath stroke];
                }else if (2 == count) {
                    [image drawInRect:CGRectMake(5, 30, 20, 20)];
                    UIBezierPath* roundedRectanglePath = [UIBezierPath bezierPathWithRoundedRect: 
                                                          CGRectMake(5-radius/2, 30-radius/2, 20+radius, 20+radius) cornerRadius: radius];
                    [roundedRectanglePath setLineWidth:radius];
                    [roundedRectanglePath stroke];
                }else if (3 == count) {
                    [image drawInRect:CGRectMake(30, 30, 20, 20)];
                    UIBezierPath* roundedRectanglePath = [UIBezierPath bezierPathWithRoundedRect: 
                                                          CGRectMake(30-radius/2, 30-radius/2, 20+radius, 20+radius) cornerRadius: radius];
                    [roundedRectanglePath setLineWidth:radius];
                    [roundedRectanglePath stroke];
                    break;
                }
                count ++;
            }
        }
    }
    UIImage *resultingImage = UIGraphicsGetImageFromCurrentImageContext();  
    UIGraphicsEndImageContext();  
    
    return resultingImage;  
}

-(UIImage *)roundCoupleHeader:(UIImage *)image{
    UIImageView *coupleImageView = [[UIImageView alloc] initWithFrame: CGRectMake(10, 10, 24, 24)];
    coupleImageView.image = image;
    UIColor *color=[UIColor colorWithRed:0.95 green:0.95 blue: 0.95 alpha:1];
    [coupleImageView setBackgroundColor:color];
    coupleImageView.layer.masksToBounds = YES;
    coupleImageView.layer.cornerRadius = 12;
    coupleImageView.layer.borderWidth = 2;
    coupleImageView.layer.borderColor = [[UIColor whiteColor] CGColor];
    
    if (NULL != UIGraphicsBeginImageContextWithOptions)
        UIGraphicsBeginImageContextWithOptions(coupleImageView.bounds.size, NO, 0);
    else
        UIGraphicsBeginImageContext(coupleImageView.bounds.size);
    
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    [coupleImageView.layer renderInContext:ctx];
    UIImage* roundImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    coupleImageView = nil;
    
    return roundImage;
}

-(UIImage *)singleHeader:(CPUIModelUserInfo *)singleModel{
    
    UIImage *image = [[UIImage alloc] initWithContentsOfFile:singleModel.headerPath];
    UIImage *backImage = [UIImage imageNamed:@"headpic_group_110x110"];
    if (NULL != UIGraphicsBeginImageContextWithOptions)
        UIGraphicsBeginImageContextWithOptions(backImage.size, NO, [UIScreen mainScreen].scale);
    else
        UIGraphicsBeginImageContext(backImage.size);
    
    if (image) {
        [image drawInRect:CGRectMake(0, 0, backImage.size.width, backImage.size.height)];
    }else {  // 没有头像，用默认的
        [backImage drawInRect:CGRectMake(0, 0, backImage.size.width, backImage.size.height)];
    }
    
    if(singleModel.coupleAccount != nil){ // 有另一半
        if(singleModel.coupleUserInfo!=nil){ // 另一半和我是好友
            NSString * photoPath_ = singleModel.coupleUserInfo.headerPath;
            if(photoPath_!=nil){
                UIImage *coupleHeader = [[UIImage alloc] initWithContentsOfFile:photoPath_];
                [[self roundCoupleHeader:coupleHeader] drawInRect:CGRectMake(3, 27, 24, 24)];
            }
        }else{ // 另一半和我不是好友
            UIImage *coupleMark = [UIImage imageNamed:@"icon_coupleNotFriend"];
            [coupleMark drawInRect:CGRectMake(0, 38.f, 17.f, 17.f)];
        }
        
        UIImage *resultingImage = UIGraphicsGetImageFromCurrentImageContext();  
        UIGraphicsEndImageContext();  
        
        return resultingImage;
        
    }else{ // 没有另一半
        return image;
    }
    
    return nil;
}

@end


///////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////


