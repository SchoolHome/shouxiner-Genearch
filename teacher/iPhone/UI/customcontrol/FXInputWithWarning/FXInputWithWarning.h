//
//  FXInputWithWarning.h
//  iCouple
//
//  Created by 振杰 李 on 12-3-14.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FanxerHeader.h"
@interface FXInputWithWarning : UIView{
    
    UIImageView *background;
    
    UIImageView *prefiximg;
    
    UITextField *textfield;
}


@property (strong,nonatomic) UITextField *textfield;


-(id)initWithFrame:(CGRect)frame withPrefixImg:(UIImage *)img contentStr:(NSString *)contentstr;



@end
