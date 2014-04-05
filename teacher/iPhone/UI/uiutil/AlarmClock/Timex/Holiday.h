//
//  Holiday.h
//  Timex
//
//  Created by wang shuo on 12-9-4.
//  Copyright (c) 2012年 wang shuo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Holiday : NSObject

-(id) initHoliday : (int) day withMonth : (int) withMonth withDayOfWeek : (int) dayOfWeek withWeekOfMonth : (int) weekOfMouth;

-(void) setCalendar : (NSCalendar *) calendar withDateComponents : (NSDateComponents *) dateComponents;
@end
