//
//  FXHeaderPanel.h
//  ShakeIcon
//
//  Created by 振杰 李 on 12-4-6.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AGMedallionView.h"

@protocol FXHeaderPanelDelegate <NSObject>

-(void) DoShowLocation;

@end
@interface FXHeaderPanel : UIView {
    
    AGMedallionView *picview;
    
    UILabel *namelabel;
    
    UIButton *locbutton;
    
    id <FXHeaderPanelDelegate> delegate;
}

@property (strong,nonatomic) AGMedallionView *picview;

@property (strong,nonatomic) id <FXHeaderPanelDelegate> delegate;


- (id)initWithFrame:(CGRect)frame picimg:(UIImage *)img contactName:(NSString *)name;

- (void) doLocation;
@end
