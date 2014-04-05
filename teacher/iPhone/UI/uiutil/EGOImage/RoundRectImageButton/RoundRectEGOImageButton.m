//
//  RoundRectEGOImageButton.m
//  iStation
//
//  Created by 郑 帅 on 13-5-23.
//  Copyright (c) 2013年 北京友宝昂莱科技有限公司. All rights reserved.
//

#import "RoundRectEGOImageButton.h"

@implementation RoundRectEGOImageButton

@synthesize addFaceDelegate;

- (id)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code   

        self.targetID = 0;
        self.layer.cornerRadius = 4;
        self.layer.masksToBounds = YES;
        
        [self addTarget:self action:@selector(ButtonDown) forControlEvents:UIControlEventTouchUpInside];

    }
    return self;
}
-(void)RemoveDefaultAction
{
    [self removeTarget:self action:@selector(ButtonDown) forControlEvents:UIControlEventTouchUpInside];
    
}
- (id)initWithPlaceholderImage:(UIImage*)anImage withFrame:(CGRect) frame {
	if((self = [self initWithFrame:frame])) {
        UIImage *resizedImage = nil;
        if (nil != anImage) {
            resizedImage = [self resizedImage:anImage];
        }
        
		self.placeholderImage = resizedImage;
		self.delegate = nil;
        self.addFaceDelegate = nil;
        [self setBackgroundImage:resizedImage forState:UIControlStateNormal];
	}
	return self;
}

-(UIImage *) resizedImage:(UIImage *)anImage{
    return [anImage resizedImageWithContentMode:UIViewContentModeScaleAspectFill bounds:CGSizeMake(self.frame.size.width, self.frame.size.height) interpolationQuality:kCGInterpolationDefault];
}

- (void)setImageURL:(NSURL *)aURL {
	if(self.imageURL) {
		[[EGOImageLoader sharedImageLoader] removeObserver:self forURL:self.imageURL];
        [imageURL release];
		imageURL = nil;
	}
	
	if(!aURL) {
        [self setBackgroundImage:self.placeholderImage forState:UIControlStateNormal];
		imageURL = nil;
		return;
	} else {
		imageURL = [aURL retain];
	}
  
	UIImage* anImage = [[EGOImageLoader sharedImageLoader] imageForURL:aURL shouldLoadWithObserver:self];
	
	if(anImage) {
		[self setBackgroundImage:[self resizedImage:anImage] forState:UIControlStateNormal];
        if([self.addFaceDelegate respondsToSelector:@selector(showFace)]) {
            [self.addFaceDelegate showFace];
        }
    
    } else {
        [self setBackgroundImage:self.placeholderImage forState:UIControlStateNormal];
	}
 
}

- (void)imageLoaderDidLoad:(NSNotification*)notification {
	if(![[[notification userInfo] objectForKey:@"imageURL"] isEqual:self.imageURL]) return;
	
	UIImage* anImage = [[notification userInfo] objectForKey:@"image"];
    [self setBackgroundImage:[self resizedImage:anImage] forState:UIControlStateNormal];
	if([self.addFaceDelegate respondsToSelector:@selector(showFace)]) {
		[self.addFaceDelegate showFace];
	}
	[self setNeedsDisplay];
	
	if([self.delegate respondsToSelector:@selector(circleImageButtonLoadedImage:)]) {
		[self.delegate imageButtonLoadedImage:self];
	}
}
-(void)ButtonDown
{
    if (self.targetID ==0) {
        CLog(@"targetID  为0");
    }else
    {
    
        CLog(@"%d",self.targetID);
        [[NSNotificationCenter defaultCenter] postNotificationName:Notification_ShowProfile object:[NSNumber numberWithInt:self.targetID]];

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

@end
