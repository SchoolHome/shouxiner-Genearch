//
//  AlarmDatePickerView.m
//  iCouple
//
//  Created by wang shuo on 12-8-22.
//
//

#import "AlarmDatePickerView.h"

#import "CoreUtils.h"
@implementation AlarmDatePickerView
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
        doneButton.frame = CGRectMake(245, 245-31, 70, 29);
        [self addSubview:doneButton];
        [doneButton addTarget:self action:@selector(doneButtonTaped:) forControlEvents:UIControlEventTouchUpInside];
        [doneButton setImage:[UIImage imageNamed:@"alarm_im_btn_sent.png"] forState:UIControlStateNormal];
        [doneButton setImage:[UIImage imageNamed:@"alarm_im_btn_sent_press.png"] forState:UIControlStateHighlighted];
        
        datePicker = [[UIDatePicker alloc] initWithFrame:CGRectMake(0, 245, 320, 300)];
        datePicker.datePickerMode = UIDatePickerModeDate;
        datePicker.minuteInterval = 5;
        [self addSubview:datePicker];
        
    }
    return self;
}

-(void)setDate : (NSDate *) date{
    datePicker.date = date;
}

-(void)setTitle:(NSString *)title{
    titleLabel.text = title;
}

-(void)setDateMode:(UIDatePickerMode)mode{
    datePicker.datePickerMode = mode;
}

-(void)showInView:(UIView *)aView{
    
    [datePicker setDate:[NSDate date] animated:NO];
    [aView addSubview:self];
    
    [UIView animateWithDuration:0.3
                     animations:^{
                         self.frame = CGRectMake(0, 20,320,480);
                     }
                     completion:^(BOOL finished) {
                         
                     }];
}

-(void)doneButtonTaped:(id)sender{
    [UIView animateWithDuration:0.3
                     animations:^{
                         self.frame = CGRectMake(0, 460,320,480);
                     }
                     completion:^(BOOL finished) {
                         if (self.delegate&&[self.delegate respondsToSelector:@selector(datePickerDidPickedDate:)]) {
                             [self.delegate datePickerDidPickedDate:[datePicker date]];
                         }
                         
//                         [self removeFromSuperview];
                         [self closeInView];
                     }];
}


-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    
    UITouch *touch = [touches anyObject];
    CGPoint point = [touch locationInView:self];
    if (point.y<205) {
//        [UIView animateWithDuration:0.3
//                         animations:^{
//                             self.frame = CGRectMake(0, 460,320,480);
//                         }
//                         completion:^(BOOL finished) {
//                             [self removeFromSuperview];
//                         }];
        [self closeInView];
    }
}

-(void)closeInView{
    [UIView animateWithDuration:0.3
                     animations:^{
                         self.frame = CGRectMake(0, 460,320,480);
                     }
                     completion:^(BOOL finished) {
                         [self removeFromSuperview];
                     }];
}
@end