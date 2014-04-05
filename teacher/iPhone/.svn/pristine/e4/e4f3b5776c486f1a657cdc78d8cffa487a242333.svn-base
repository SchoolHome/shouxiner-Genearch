//
//  FXStatusView.m
//  iCouple
//
//  Created by lixiaosong on 12-3-13.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "FXStatusPanel.h"

@implementation FXStatusPanel
@synthesize delegate;


- (id)initWithFrame:(CGRect)frame withArray:(NSArray *)array
{
    self = [super initWithFrame:frame];
    if (self) {
        
     
        background=[[UIImageView alloc] initWithFrame:self.bounds];
        
        background.image=STATUS_PANEL_IMG;
        
        [self addSubview:background];
        
        float beginx=15.0;
        float beginy=12.0;
        
        
        for (int i=0; i<[array count]; i++) {
            StatusPanelItem *item=(StatusPanelItem *)[array objectAtIndex:i];
            item.delegate=self;
            CGRect rect=item.frame;
            rect.origin.x=beginx;
            rect.origin.y=beginy;
            rect.size.width=124.0/2.0;
            rect.size.height=124.0/2.0;
            item.frame=rect;
            [self addSubview:item];
            beginx+=rect.size.width+20;
            
            if (i==(3-1)) {
                
                beginy+=rect.size.height+30;
                
                beginx=15.0;
            }
        }
    }
    return self;
}


#pragma mark -
#pragma mark StatusPanelItemDelegate method

-(void)doChooseStatus:(NSInteger)status{
    
    if (delegate!=nil) {
        [delegate ChooseStatus:status];
    }
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/
- (void)do_select_status_int:(int)status_int{
    
}
@end
