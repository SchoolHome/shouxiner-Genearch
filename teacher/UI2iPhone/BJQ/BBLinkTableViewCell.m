//
//  BBLinkTableViewCell.m
//  BBTeacher
//
//  Created by xxx on 14-3-4.
//  Copyright (c) 2014年 xxx. All rights reserved.
//

#import "BBLinkTableViewCell.h"

@implementation BBLinkTableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        
        title = [[UILabel alloc] initWithFrame:CGRectMake(K_LEFT_PADDING, 0, 225, 20)];
        [self addSubview:title];
        title.textColor = [UIColor colorWithHexString:@"#4a7f9d"];
        
        content = [[UILabel alloc] init];
        [self addSubview:content];
        
        link = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        [self addSubview:link];
        [link setBackgroundImage:[UIImage imageNamed:@"BBNotification"] forState:UIControlStateNormal];
        
        linkIcon = [[EGOImageView alloc] initWithFrame:CGRectMake(10, 10, 45, 45)];
        [link addSubview:linkIcon];
        
        linkTitle = [[UILabel alloc] initWithFrame:CGRectMake(65, 5, 160, 20)];
        [link addSubview:linkTitle];
        
        linkContent = [[UILabel alloc] initWithFrame:CGRectMake(65, 25, 160, 30)];
        [link addSubview:linkContent];
        linkContent.textColor = [UIColor colorWithHexString:@"#4a7f9d"];
    }
    return self;
}


-(void)setData:(BBTopicModel *)data{
    [super setData:data];
    
    content.frame = CGRectMake(K_LEFT_PADDING, 20, 225, 30);//
    
    link.frame = CGRectMake(K_LEFT_PADDING, kViewFoot(content)+5, 222, 63);//
//    link.backgroundColor = [UIColor whiteColor];
//    CALayer *roundedLayer = [link layer];
//    [roundedLayer setMasksToBounds:YES];
//    roundedLayer.cornerRadius = 8.0;
//    roundedLayer.borderWidth = 1;
//    roundedLayer.borderColor = [[UIColor lightGrayColor] CGColor];
    
    linkIcon.backgroundColor = [UIColor grayColor];
    
    title.text = self.data.title;
    title.font = [UIFont systemFontOfSize:14];
    
    content.text = self.data.content;
    content.font = [UIFont systemFontOfSize:14];
    content.numberOfLines = 0;
    
    linkTitle.text = self.data.forword.title;
    linkTitle.font = [UIFont systemFontOfSize:14];
    
    linkContent.text = self.data.forword.summary;
    linkContent.font = [UIFont systemFontOfSize:12];
    linkContent.numberOfLines = 2;
    
    linkIcon.imageURL = [NSURL URLWithString:self.data.forword.author_avatar];
    
    self.like.frame = CGRectMake(165, kViewFoot(link)+5, 62, 27);
    self.reply.frame = CGRectMake(165+70, kViewFoot(link)+5, 62, 27);
    
    self.time.frame = CGRectMake(K_LEFT_PADDING, kViewFoot(link)+5, 60, 27);
    self.time.text = [self timeStringFromNumber:self.data.ts];
    
    if ([self.data.praisesStr length]>0||[self.data.commentsStr length]>0) {
        //
        self.relpyContent.hidden = NO;
        self.likeContent.hidden = NO;
        self.relpyContentBack.hidden = NO;
        
        CGSize s = [self.data.commentsStr sizeConstrainedToSize:CGSizeMake(210, CGFLOAT_MAX)];
        self.relpyContent.frame = CGRectMake(K_LEFT_PADDING+5, kViewFoot(self.time)+10+45, 210, s.height);
        self.relpyContent.attributedText = self.data.commentsStr;
        
        self.likeContent.frame = CGRectMake(K_LEFT_PADDING+40, kViewFoot(self.time)+10+16, 175, 20);
        self.likeContent.text = self.data.praisesStr;
        
        UIImage *image2 = [UIImage imageNamed:@"BBComentBG"];
        image2 = [image2 resizableImageWithCapInsets:UIEdgeInsetsMake(45,100,14,100) resizingMode:UIImageResizingModeStretch];
        
        self.relpyContentBack.frame = CGRectMake(K_LEFT_PADDING, kViewFoot(self.time)+10, 210+10, s.height+10+45);
        self.relpyContentBack.image = image2;
    }else{
        self.relpyContent.hidden = YES;
        self.likeContent.hidden = YES;
        self.relpyContentBack.hidden = YES;
    }
    
    //[self showDebugRect:YES];
}

@end
