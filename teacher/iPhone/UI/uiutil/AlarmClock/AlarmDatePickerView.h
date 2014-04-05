//
//  AlarmDatePickerView.h
//  iCouple
//
//  Created by wang shuo on 12-8-22.
//
//

#import <UIKit/UIKit.h>

@protocol AlarmDatePickerViewDelegate;
@interface AlarmDatePickerView : UIView{
    UIDatePicker *datePicker;
    UILabel *titleLabel;
}
@property (nonatomic,assign) id<AlarmDatePickerViewDelegate> delegate;

-(void)setTitle:(NSString *)title;
-(void)setDate : (NSDate *) date;
-(void)setDateMode : (UIDatePickerMode)mode;
-(void)showInView:(UIView *)aView;
-(void)closeInView;
@end


@protocol AlarmDatePickerViewDelegate <NSObject>
@required
-(void)datePickerDidPickedDate:(NSDate*) date;

@end