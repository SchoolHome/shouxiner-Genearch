//
//  ButtonWithFace.m
//  iStation
//
//  Created by 郑 帅 on 13-5-23.
//  Copyright (c) 2013年 北京友宝昂莱科技有限公司. All rights reserved.
//

#import "ButtonWithFace.h"
#import "RoundRectEGOImageButton.h"
@implementation ButtonWithFace
{
}
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
      

    }
    return self;
}

-(void)setTargetID:(int)targetID
{
    _button.targetID = targetID;
}
-(int)targetID
{
    return self.targetID;
}
- (id)initWithPlaceholderImage:(UIImage*)anImage withFrame:(CGRect) frame FaceType:(Face_Type)_type
{

    self = [self initWithFrame:frame];
    if (self) {
       
        _button = [[RoundRectEGOImageButton alloc] initWithPlaceholderImage:anImage withFrame:self.bounds];
        [self addSubview:_button];
        _button.addFaceDelegate = self;
        [_button release];
        type = _type;
        if (type!=0) {
        faceView = [[UIImageView alloc] initWithFrame:CGRectMake(12, 12, 17, 17)];
        faceView.image = [UIImage imageNamed:[NSString stringWithFormat:@"face%d",_type]];
        }

  
    }
    
    return self;
}
- (void)setImageURL:(NSURL *)aURL {

    [_button setImageURL:aURL];
}
- (void)showFace
{

    [faceView removeFromSuperview];
    [self addSubview:faceView];

}
-(void)dealloc
{
    [super dealloc];
    
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
