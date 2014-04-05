//
//  HomePageDatePickerView.m
//  iCouple
//
//  Created by ming bright on 12-5-22.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "HomePageDatePickerView.h"
#import "CPUIModelManagement.h"
#import "CPUIModelPersonalInfo.h"
#import "CoreUtils.h"
@implementation HomePageDatePickerView
@synthesize delegate;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.backgroundColor = [UIColor clearColor];
        
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 245-34.5, 320, 34.5)];
        [self addSubview:imageView];
        imageView.backgroundColor = [UIColor grayColor];
        imageView.image = [UIImage imageNamed:@"item_index_greypiece"];
        
        titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, 8, 240, 20)];
        [imageView addSubview:titleLabel];
        titleLabel.font = [UIFont systemFontOfSize:13];
        titleLabel.backgroundColor = [UIColor clearColor];
        titleLabel.textColor = [UIColor darkGrayColor];
        titleLabel.shadowColor = [UIColor whiteColor];
        titleLabel.shadowOffset = CGSizeMake(0, 1);
        
        
        UIButton *doneButton =[UIButton buttonWithType:UIButtonTypeCustom];
        doneButton.frame = CGRectMake(260, 245-34.5, 60, 34.5);
        [self addSubview:doneButton];
        [doneButton addTarget:self action:@selector(doneButtonTaped:) forControlEvents:UIControlEventTouchUpInside];
        [doneButton setImage:[UIImage imageNamed:@"btn_index_ok"] forState:UIControlStateNormal];
        [doneButton setImage:[UIImage imageNamed:@"btn_index_okpress"] forState:UIControlStateHighlighted];
        
        datePicker = [[UIDatePicker alloc] initWithFrame:CGRectMake(0, 245, 320, 300)];
        datePicker.datePickerMode = UIDatePickerModeDate;
        [self addSubview:datePicker];
        
    }
    return self;
}



-(void)setTitle:(NSString *)title{
    titleLabel.text = title;
}

-(void)setDateMode:(UIDatePickerMode)mode{
    datePicker.datePickerMode = mode;
}

-(void)showInView:(UIView *)aView{
    
    // 设置初始时间
    CPUIModelPersonalInfo *personalInfo = [CPUIModelManagement sharedInstance].uiPersonalInfo;
    
    if ([personalInfo.singleTime doubleValue]>0) {
        NSDate *date = [CoreUtils getDateFormatWithLong:personalInfo.singleTime];
        [datePicker setDate:date animated:NO];
    }
    

    [aView addSubview:self];
    [UIView animateWithDuration:0.3 
                     animations:^{
                         self.frame = CGRectMake(0, 0,320,480);
                     } 
                     completion:^(BOOL finished) {
                         
                     }];
}


-(void)doneButtonTaped:(id)sender{
    
    
    [UIView animateWithDuration:0.3 
                     animations:^{
                         self.frame = CGRectMake(0, 480,320,480);
                     } 
                     completion:^(BOOL finished) {
                         if (self.delegate&&[self.delegate respondsToSelector:@selector(datePickerDidPickedDate:)]) {
                             [self.delegate datePickerDidPickedDate:[datePicker date]];
                         }
                         
                         [self removeFromSuperview];
                     }];
    
}


-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    
    UITouch *touch = [touches anyObject];
    
    CGPoint point = [touch locationInView:self];
    
    if (point.y<205) {
        [UIView animateWithDuration:0.3 
                         animations:^{
                             self.frame = CGRectMake(0, 480,320,480);
                         } 
                         completion:^(BOOL finished) {
                             [self removeFromSuperview];
                         }];
    }
    
}

@end
