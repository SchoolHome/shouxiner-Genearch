//
//  AddContractCellBase.m
//  iCouple
//
//  Created by yong wei on 12-3-30.
//  Copyright (c) 2012年 fanxer. All rights reserved.
//

#define TEXT_OFFSET_Y 2.0f

#import "AddContactCellBase.h"

@implementation AddContactCellBase
@synthesize userImageButton = _userImageButton , nameLabel = _nameLabel , nickName = _nickName , contactID = _contactID;
@synthesize nameFont = _nameFont , nickNameFont = _nickNameFont;
@synthesize sectionModel = _sectionModel;
@synthesize saveSectionName = _saveSectionName , isContactData = _isContactData , userName = _userName;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.nameFont = [UIFont fontWithName:@"Times New Roman" size:15.0f];
        self.nickNameFont = [UIFont fontWithName:@"Times New Roman" size:12.0f];
        
        self.userImageButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [self.userImageButton setBackgroundImage:[UIImage imageNamed:@"icon_step2_man.png"] forState:UIControlStateNormal];
        [self.userImageButton setBackgroundImage:[UIImage imageNamed:@"icon_step2_man.png"] forState:UIControlStateHighlighted];
        self.userImageButton.frame = CGRectMake(18, self.frame.size.height / 2.0f - 25.0f / 2.0f, 25, 25);
        [self addSubview:self.userImageButton];
        
        self.nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(60, self.frame.origin.y + TEXT_OFFSET_Y , 120, 40)];
        self.nameLabel.textAlignment = UITextAlignmentLeft;
        self.nameLabel.font = self.nameFont;
        self.nameLabel.lineBreakMode = UILineBreakModeTailTruncation;
        [self addSubview:self.nameLabel];
        
        self.nickName = [[UILabel alloc] initWithFrame:CGRectMake(120, self.frame.origin.y + TEXT_OFFSET_Y, 0, 40)];
        self.nickName.textAlignment = UITextAlignmentLeft;
        self.nickName.font = self.nickNameFont;
        self.nickName.lineBreakMode = UILineBreakModeTailTruncation;
        self.nickName.textColor = [UIColor grayColor];
        [self addSubview:self.nickName];
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated{
    [super setSelected:selected animated:animated];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    CGFloat RowFloat = 44.0;
    return RowFloat;
}

- (UIColor *) colorWithHexString: (NSString *) stringToConvert{
    NSString *cString = [[stringToConvert stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] uppercaseString];
    
    // 传入字符小于六位，返回默认白色
    if ([cString length] < 6) return [UIColor whiteColor];
    
    //不合法行参，一律返回白色
    if ([cString hasPrefix:@"0X"]) cString = [cString substringFromIndex:2];
    if ([cString hasPrefix:@"#"]) cString = [cString substringFromIndex:1];
    if ([cString length] != 6) return [UIColor whiteColor];
    // 分割字符
    NSRange range;
    range.location = 0;
    range.length = 2;
    NSString *rString = [cString substringWithRange:range];
    
    range.location = 2;
    NSString *gString = [cString substringWithRange:range];
    
    range.location = 4;
    NSString *bString = [cString substringWithRange:range];
    
    // 保存数据
    unsigned int r, g, b;
    [[NSScanner scannerWithString:rString] scanHexInt:&r];
    [[NSScanner scannerWithString:gString] scanHexInt:&g];
    [[NSScanner scannerWithString:bString] scanHexInt:&b];
    
    return [UIColor colorWithRed:((float) r / 255.0f) green:((float) g / 255.0f) blue:((float) b / 255.0f) alpha:1.0f];
}

@end
