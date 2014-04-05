//
//  FxProcessFixed.h
//  SweetAlarm
//
//  Created by 振杰 李 on 12-2-4.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FanxerHeader.h"

enum{
    PROCESS_1,
    PROCESS_2,
    PROCESS_3,
};
@interface FxProcessFixed : UIImageView{
    
    UILabel *contentlabel;
    
}

- (id)initWithFrame:(CGRect)frame withstep:(NSInteger)step withtitle:(NSString *)title;

@end
