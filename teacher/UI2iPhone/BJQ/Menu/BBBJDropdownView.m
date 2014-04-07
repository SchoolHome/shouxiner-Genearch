//
//  BBBJDropdownView.m
//  teacher
//
//  Created by xxx on 14-3-17.
//  Copyright (c) 2014年 ws. All rights reserved.
//

#import "BBBJDropdownView.h"
#define kDropdownWidth      130
#define kDropdownCellHeight 36

@implementation BBBJDropdownView


-(void)setListData:(NSArray *)listData{
    _listData = listData;
    [_list reloadData];
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        self.unfolded = NO;
        self.backgroundColor = [UIColor clearColor];
        
//        _listData = [[NSArray alloc] initWithObjects:
//                     @"三年级（4）班",@"三年级（3）班",@"三年级（2）班",@"三年级（1）班", nil];
        
        _list = [[UITableView alloc] initWithFrame:CGRectMake((self.frame.size.width-kDropdownWidth)/2, 44+20, kDropdownWidth, 0) style:UITableViewStylePlain];
        _list.rowHeight = kDropdownCellHeight;
        _list.dataSource = self;
        _list.delegate = self;
        _list.scrollEnabled = NO;
        _list.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.55];
        _list.separatorColor = [UIColor darkGrayColor];//[UIColor colorWithHexString:@"515151"];
        
        [self addSubview:_list];
        
        _list.layer.borderWidth = 1;
        _list.layer.borderColor = [UIColor darkGrayColor].CGColor;
        
        [self addTarget:self action:@selector(close) forControlEvents:UIControlEventTouchUpInside];
        
    }
    return self;
}

-(void)close{

    [self dismiss];
    if (self.delegate&&[self.delegate respondsToSelector:@selector(bbBJDropdownViewTaped:)]) {
        [self.delegate bbBJDropdownViewTaped:self];
    }
}

-(void)dismiss{
    [UIView animateWithDuration:0.3
                     animations:^{
                         _list.frame = CGRectMake((self.frame.size.width-kDropdownWidth)/2, 44+20, kDropdownWidth, 0);
                     }
                     completion:^(BOOL finished) {
                         self.unfolded = NO;
                         [self removeFromSuperview];
                     }];
}

-(void)show{
    
    _list.frame = CGRectMake((self.frame.size.width-kDropdownWidth)/2, 44+20, kDropdownWidth, 0);
    [UIView animateWithDuration:0.3
                     animations:^{
                         _list.frame = CGRectMake((self.frame.size.width-kDropdownWidth)/2, 44+20, kDropdownWidth, kDropdownCellHeight*[_listData count]);
                     }
                     completion:^(BOOL finished) {
                         self.unfolded = YES;
                     }];
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [_listData count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        cell.backgroundColor = [UIColor clearColor];
        
        cell.backgroundView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 83, 44)];
        cell.backgroundView.backgroundColor = [UIColor colorWithRed:0.8 green:0.8 blue:0.8 alpha:0.7];
        
        cell.selectedBackgroundView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 83, 44)];
        cell.selectedBackgroundView.backgroundColor = [UIColor orangeColor];
        
    }
    
    BBGroupModel *group = _listData[indexPath.row];
    
    cell.textLabel.text = group.alias;
    cell.textLabel.font = [UIFont systemFontOfSize:13];
    cell.textLabel.textAlignment = UITextAlignmentCenter;
    cell.textLabel.textColor = [UIColor colorWithRed:0.3 green:0.3 blue:0.3 alpha:1.0];//[UIColor colorWithHexString:@"cccccc"];
    // Configure the cell...
    
    return cell;
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self dismiss];
    
    if (self.delegate&&[self.delegate respondsToSelector:@selector(bbBJDropdownView:didSelectedAtIndex:)]) {
        [self.delegate bbBJDropdownView:self didSelectedAtIndex:indexPath.row];
    }
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

@end
