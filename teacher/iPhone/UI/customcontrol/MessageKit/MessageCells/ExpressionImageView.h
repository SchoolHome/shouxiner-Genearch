//
//  ExpressionImageView.h
//  Components_xxx
//
//  Created by ming bright on 12-5-2.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ExpressionImageView : UIImageView
{
    NSString *expression;
    UIImage  *defaultImage;
}

@property(nonatomic,strong) NSString *expression;
@property(nonatomic,strong) UIImage  *defaultImage;

- (id)initWithFrame:(CGRect)frame expression:(NSString *)presssion;

@end
