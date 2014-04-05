//
//  HomePageDatePickerView.h
//  iCouple
//
//  Created by ming bright on 12-5-22.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol HomePageDatePickerViewDelegate;
@interface HomePageDatePickerView : UIView
{
    UIDatePicker *datePicker;
    
    UILabel *titleLabel;
}
@property (nonatomic,assign) id<HomePageDatePickerViewDelegate> delegate;

-(void)setTitle:(NSString *)title;
-(void)setDateMode : (UIDatePickerMode)mode;
-(void)showInView:(UIView *)aView;
@end


@protocol HomePageDatePickerViewDelegate <NSObject>

-(void)datePickerDidPickedDate:(NSDate*) date;

@end