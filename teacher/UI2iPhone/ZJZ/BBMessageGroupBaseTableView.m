//
//  BBMessageGroupBaseTableView.m
//  teacher
//
//  Created by ZhangQing on 14-3-17.
//  Copyright (c) 2014年 ws. All rights reserved.
//

#import "BBMessageGroupBaseTableView.h"

@implementation BBMessageGroupBaseTableView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        

    }
    return self;
}
-(id)initWithFrame:(CGRect)frame style:(UITableViewStyle)style
{
    self = [super initWithFrame:frame style:style];
    if (self) {
        UITapGestureRecognizer *tapGes = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tableViewTapped:)];
        tapGes.delaysTouchesBegan = YES;
        tapGes.delegate = self;
        [self addGestureRecognizer:tapGes];
    }
    return self;
}

-(void)tableViewTapped:(UIGestureRecognizer *)gesture
{
    
    if ([self.messageGroupBaseTableViewdelegate respondsToSelector:@selector(tableviewHadTapped)]) {
        [self.messageGroupBaseTableViewdelegate tableviewHadTapped];
    }
}

-(BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch
{
    if ([NSStringFromClass([touch.view class]) isEqualToString:@"UITableViewCellContentView"]) {
        if ([gestureRecognizer isKindOfClass:[UITapGestureRecognizer class]]) {
            return NO;
        }
        return YES;
        
    }
    return YES;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
