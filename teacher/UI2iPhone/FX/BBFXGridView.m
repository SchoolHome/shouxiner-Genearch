//
//  BBFXGridView.m
//  teacher
//
//  Created by mac on 14/11/7.
//  Copyright (c) 2014年 ws. All rights reserved.
//

#import "BBFXGridView.h"

@implementation BBFXGridView
@synthesize txtName = _txtName, egoLogo = _egoLogo, flagNew = _flagNew;
-(id)init{
    self = [super init];
    if (self) {
        [self setBackgroundColor:[UIColor clearColor]];
        _egoLogo = [[EGOImageView alloc] initWithPlaceholderImage:[UIImage imageNamed:@""]];
        [_egoLogo setContentMode:UIViewContentModeScaleAspectFit];
        [self addSubview:_egoLogo];
        
        _txtName = [[UILabel alloc] init];
        [_txtName setTextAlignment:NSTextAlignmentCenter];
        [_txtName setTextColor:[UIColor colorWithRed:0.333f green:0.333f blue:0.333f alpha:1.0f]];
        [_txtName setBackgroundColor:[UIColor clearColor]];
        [_txtName setFont:[UIFont boldSystemFontOfSize:12]];
        [self addSubview:_txtName];
        
        _flagNew = [[UIView alloc] init];
        [_flagNew setBackgroundColor:[UIColor redColor]];
        [_flagNew.layer setCornerRadius:5];
        [_flagNew setHidden:YES];
        [self addSubview:_flagNew];
    }
    return self;
}

-(void)setFrame:(CGRect)frame
{
    [super setFrame:frame];
    
    [self.egoLogo setFrame:CGRectMake(7.5f, 0, 40, 40)];
    [self.txtName setFrame:CGRectMake(0, frame.size.height-12, frame.size.width, 12)];
    [self.flagNew setFrame:CGRectMake(frame.size.width-10, 0, 6, 6)];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

-(void)setViewData:(BBFXModel *)model
{
    [self.egoLogo setImageURL:[NSURL URLWithString:model.image]];
    [self.txtName setText:model.title];
    if (model.isNew) {
        [self.flagNew setHidden:NO];
    }
}
@end
