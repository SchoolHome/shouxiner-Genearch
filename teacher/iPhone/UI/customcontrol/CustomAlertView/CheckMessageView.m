//
//  CheckMessageView.m
//  iCouple
//
//  Created by shuo wang on 12-5-29.
//  Copyright (c) 2012年 fanxer. All rights reserved.
//

#import "CheckMessageView.h"
#import "ColorUtil.h"


@interface CheckMessageView ()
@property (nonatomic,strong) UILabel *messageLabel;
-(void) confirm;
-(void) cancel;
-(void) changeChecked;
@property (nonatomic,strong) UIFont *messageTextFont;
@property (nonatomic,strong) UIFont *tipFont;
@property (nonatomic) BOOL hasChecked;
@property (nonatomic ,strong) UIButton *checkButton;
@end

@implementation CheckMessageView
@synthesize messageString = _messageString;
@synthesize messageLabel = _messageLabel;
@synthesize delegate = _delegate;
@synthesize messageTextFont =_messageTextFont , tipFont = _tipFont;
@synthesize hasChecked = _hasChecked , checkButton = _checkButton;
@synthesize context = _context;

-(id) initWithMessage:(NSString *)messageString withButtonType : (AlertButtonType) type withContext:(id)context{
    self = [super init];
    if (self) {
        
        self.messageTextFont = [UIFont systemFontOfSize:15.0f];
        self.tipFont = [UIFont systemFontOfSize:11.0f];
        self.hasChecked = NO;
        self.context = context;
        
        UIImageView *imageView = [[UIImageView alloc] init];
        imageView.userInteractionEnabled = YES;
        UIImage *bgImage = [UIImage imageNamed:@"float_im_magicdownload.png"];
        bgImage = [bgImage stretchableImageWithLeftCapWidth:25 topCapHeight:25];
        imageView.image = bgImage;
        
        self.messageLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        self.messageLabel.backgroundColor = [UIColor clearColor];
        self.messageLabel.textColor = [UIColor whiteColor];
        self.messageLabel.font = self.messageTextFont;
        self.messageLabel.numberOfLines = 0;
        self.messageString = messageString;
        
        NSString *leftButtonStr = @"确定";
        NSString *rightButtonStr = @"取消";
        if (type == AccpetAndRefuse) {
            leftButtonStr = @"同意";
            rightButtonStr = @"拒绝";
        }else if (type == ComfirmAndCancel) {
            leftButtonStr = @"确定";
            rightButtonStr = @"取消";
        }
        
        // comfirm 按钮
        UIButton *confirmButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [confirmButton setBackgroundImage:[UIImage imageNamed:@"sure_im_magicdownload.png"] forState:UIControlStateNormal];
        [confirmButton setBackgroundImage:[UIImage imageNamed:@"surepress_im_magicdownload.png"] forState:UIControlStateHighlighted];
        [confirmButton setFrame:CGRectMake(25.0f , 
                                           self.messageLabel.frame.origin.y + self.messageLabel.frame.size.height + 22.5f,
                                           86.0f , 
                                           36.0f)];
        
        confirmButton.titleLabel.font = [UIFont systemFontOfSize:15.0f];
        [confirmButton setTitleColor:[UIColor colorWithRed:245/255.f green:245/255.f blue:245/255.f alpha:1.0f] forState:UIControlStateNormal];
        [confirmButton setTitle:leftButtonStr forState:UIControlStateNormal];
        confirmButton.titleLabel.backgroundColor = [UIColor clearColor];
        confirmButton.titleLabel.textAlignment = UITextAlignmentCenter;
        [confirmButton addTarget:self action:@selector(confirm) forControlEvents:UIControlEventTouchUpInside];
        
        // cancel 按钮
        UIButton *cancelButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [cancelButton setBackgroundImage:[UIImage imageNamed:@"cancle_im_magicdownload.png"] forState:UIControlStateNormal];
        [cancelButton setBackgroundImage:[UIImage imageNamed:@"canclepress_im_magicdownload.png"] forState:UIControlStateHighlighted];
        [cancelButton setFrame:CGRectMake(25.0f + confirmButton.frame.size.width + 10.0f , 
                                          confirmButton.frame.origin.y,
                                          86.5f,
                                          36.5f)];
        
        cancelButton.titleLabel.font = [UIFont systemFontOfSize:15.0f];
        [cancelButton setTitleColor:[UIColor colorWithRed:66/255.f green:66/255.f blue:66/255.f alpha:1.0f] forState:UIControlStateNormal];
        [cancelButton setTitle:rightButtonStr forState:UIControlStateNormal];
        cancelButton.titleLabel.backgroundColor = [UIColor clearColor];
        cancelButton.titleLabel.textAlignment = UITextAlignmentCenter;
        [cancelButton addTarget:self action:@selector(cancel) forControlEvents:UIControlEventTouchUpInside];
        
        // check button
        self.checkButton = [[UIButton alloc] initWithFrame:CGRectMake(70.0f, 
                                                                           confirmButton.frame.origin.y + confirmButton.frame.size.height + 12.5f,
                                                                           11.5f, 10.5f)];
        [self.checkButton setBackgroundImage:[UIImage imageNamed:@"icon_sign_check_no.png"] forState:UIControlStateNormal];
        [self.checkButton setBackgroundImage:[UIImage imageNamed:@"icon_sign_check_no.png"] forState:UIControlStateHighlighted];
        [self.checkButton addTarget:self action:@selector(changeChecked) forControlEvents:UIControlEventTouchUpInside];
        
        
        UILabel *tipLabel = [[UILabel alloc] init];
        tipLabel.backgroundColor = [UIColor clearColor];
        tipLabel.font = self.tipFont;
        tipLabel.textColor = [UIColor colorWithHexString:@"#cccccc"];
        tipLabel.text = @"下次不再提示";
        [tipLabel sizeToFit];
        tipLabel.frame = CGRectMake(90.0f, self.checkButton.frame.origin.y - 1.2f, tipLabel.frame.size.width, tipLabel.frame.size.height);
        
        float height = 22.5f + self.messageLabel.frame.size.height + 22.5f + confirmButton.frame.size.height + 12.5f + tipLabel.frame.size.height + 12.5f;
        
        self.frame = CGRectMake(0.0f, 0.0f, 320.0f, 480.0f);
        imageView.frame = CGRectMake( ( 320.0f - 241.5 ) / 2.0f , (480.0f - height) / 2.0f , 241.5, height);
        
        [imageView addSubview:self.messageLabel];
        [imageView addSubview:confirmButton];
        [imageView addSubview:cancelButton];
        [imageView addSubview:self.checkButton];
        [imageView addSubview:tipLabel];
        
        self.backgroundColor = [UIColor clearColor];
        [self addSubview:imageView];
        [[UIApplication sharedApplication].keyWindow addSubview:self];

    }
    return self;
}

-(void) changeChecked{
    if (self.hasChecked) {
        [self.checkButton setBackgroundImage:[UIImage imageNamed:@"icon_sign_check_no.png"] forState:UIControlStateNormal];
        [self.checkButton setBackgroundImage:[UIImage imageNamed:@"icon_sign_check_no.png"] forState:UIControlStateHighlighted];
        self.hasChecked = NO;
    }else {
        [self.checkButton setBackgroundImage:[UIImage imageNamed:@"icon_sign_check.png"] forState:UIControlStateNormal];
        [self.checkButton setBackgroundImage:[UIImage imageNamed:@"icon_sign_check.png"] forState:UIControlStateHighlighted];
        self.hasChecked = YES;
    }
}

-(void) setMessageString:(NSString *)messageString{
    if ( nil == messageString || [self.messageLabel.text isEqualToString:messageString]) {
        return;
    }else {
        CGSize size = [messageString sizeWithFont:self.messageTextFont constrainedToSize:CGSizeMake(191.5f, MAXFLOAT)];
        self.messageLabel.frame = CGRectMake( 25.0f, 22.5f, size.width, size.height);
        self.messageLabel.text = messageString;
    }
}

-(void) confirm{
    if (nil == self.delegate || ![self.delegate respondsToSelector:@selector(clickConfirm:withContext:)]) {
        return;
    }
    
    [self.delegate clickConfirm : self.hasChecked withContext:self.context];
    [self removeFromSuperview];
}

-(void) cancel{
    if (nil == self.delegate || ![self.delegate respondsToSelector:@selector(clickCancel:)]) {
        return;
    }
    
    [self.delegate clickCancel:self.context];
    [self removeFromSuperview];
}

@end
