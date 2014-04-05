//
//  HomeCloseFriendTableViewCell.m
//  iCouple
//
//  Created by qing zhang on 4/13/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//
#define CGRect_btnDelete CGRectMake(0, -2.0f, 55/2.f, 55/2.f)
#define CGRect_CellViewBG CGRectMake(10.f, 0, 55, 55)
#define CGRect_viewBG   CGRectMake(22.f+72*i, 7, 72, 82)
#define CGRect_labelUserName   CGRectMake(10, 58.f, 55.f, 13.f)
#define CGRect_messageAlertImgInUserImg  CGRectMake(55-55/2+20, -7.f, 27.5f, 27.5f)

#import "HomeCloseFriendTableViewCell.h"
#import <QuartzCore/QuartzCore.h>
#import "CPUIModelMessageGroupMember.h"
#import "CPUIModelManagement.h"
#import "CPUIModelUserInfo.h"
#import "CPUIModelMessage.h"
#import "HomeInfo.h"
#import "ImageUtil.h"
#import "AFHeadItem.h"
@implementation HomeCloseFriendTableViewCell
@synthesize indexPathRow = _indexPathRow, closeFriendDelegate = _closeFriendDelegate,
            cellSubviews = _cellSubviews;
-(NSMutableArray *)cellSubviews
{
    if (!_cellSubviews) {
        _cellSubviews = [[NSMutableArray alloc] init];
    }
    return _cellSubviews;
}
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        UIImageView *imageviewBG = [[UIImageView alloc] initWithFrame:CGRectMake(25.f, 0.f, 300.f, 82)];
        imageviewBG.backgroundColor = [UIColor colorWithRed:243/255.f green:238/255.f blue:229/255.f alpha:1.f];
        //imageviewBG.backgroundColor = [UIColor greenColor];
        [[self contentView] addSubview:imageviewBG];
        
        [self contentView].tag = cellContentViewTag;
        
        for (int i = 0; i<4; i++) {
            UIView *viewBG = [[UIView alloc] initWithFrame:CGRect_viewBG];
            
            [self addSubview:viewBG];
            
            //self.viewBG = [[UIView alloc] initWithFrame:CGRect_CellViewBG];
            UIView *headImgViewBG =  [[UIView alloc] initWithFrame:CGRect_CellViewBG];
            //headImgViewBG.tag = 3;
            
            UIImageView *imageviewUserImgShadow = [[UIImageView alloc] initWithFrame:CGRectMake(0.f, 0.f,CGRect_CellViewBG.size.width,CGRect_CellViewBG.size.height)];
            imageviewUserImgShadow.image = [UIImage imageNamed:@"headpic_shadow_110x110.png"];
            imageviewUserImgShadow.userInteractionEnabled = NO;
            
            UIImageView *imageviewUserImg = [[UIImageView alloc] initWithFrame:CGRectMake(0.f, 0.f,CGRect_CellViewBG.size.width,CGRect_CellViewBG.size.height)];
            imageviewUserImg.layer.cornerRadius = 5.f;
            [imageviewUserImg.layer setMasksToBounds:YES];
            imageviewUserImg.tag = imageviewUserImgTag;
            [imageviewUserImg addSubview:imageviewUserImgShadow];
            [headImgViewBG addSubview:imageviewUserImg];
            
            [viewBG addSubview:headImgViewBG];
            
            UILongPressGestureRecognizer *longPress = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(longPressHeadIMG:)];
            [viewBG addGestureRecognizer:longPress];
            
//            UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapHeadIMG:)];
//            [viewBG addGestureRecognizer:tap];
            
            UIImageView *messageAlertImgInUserImg = [[UIImageView alloc] initWithFrame:CGRect_messageAlertImgInUserImg];
            //[messageAlertImgInUserImg setImage:[UIImage imageNamed:@"icon_voice.png"]];
            messageAlertImgInUserImg.tag = messageAlertImgInUserImgTag;
            [viewBG addSubview:messageAlertImgInUserImg];
            
            UILabel *labelNumber = [[UILabel alloc] initWithFrame:CGRectMake(3.f, 6.f, messageAlertImgInUserImg.frame.size.width-6.f, 14)];
            labelNumber.textColor = [UIColor colorWithRed:245/255.f green:245/255.f blue:245/255.f alpha:1.f];
            //labelNumber.font = [UIFont systemFontOfSize:12];
            labelNumber.font = [UIFont fontWithName:@"Helvetica-Bold" size:14.f];
            labelNumber.backgroundColor = [UIColor clearColor];
            labelNumber.textAlignment = UITextAlignmentCenter;
            labelNumber.tag = UnCloseFriendReadMessageNumberTag;
            [messageAlertImgInUserImg addSubview:labelNumber];  
            
            UILabel *labelUserName = [[UILabel alloc] initWithFrame:CGRect_labelUserName];       
            labelUserName.backgroundColor = [UIColor clearColor];
            labelUserName.textAlignment = UITextAlignmentCenter;
            labelUserName.textColor = [UIColor colorWithRed:154/255.f green:153/255.f blue:148/255.f alpha:1.0];
            labelUserName.font = [UIFont systemFontOfSize:12.f];
            labelUserName.shadowColor = [UIColor whiteColor];
            labelUserName.shadowOffset = CGSizeMake(0, 1.0f);
            labelUserName.lineBreakMode = UILineBreakModeTailTruncation;
            labelUserName.tag = labelUserNameTag;
            [viewBG addSubview:labelUserName];
            
      
//            UILabel *labelUserMemberListNumber = [[UILabel alloc] initWithFrame:CGRectZero];
//            labelUserMemberListNumber.backgroundColor = [UIColor clearColor];
//            labelUserMemberListNumber.textAlignment = UITextAlignmentCenter;
//            labelUserMemberListNumber.textColor = [UIColor colorWithRed:154/255.f green:153/255.f blue:148/255.f alpha:1.0];
//            labelUserMemberListNumber.font = [UIFont systemFontOfSize:11.f];
//            labelUserMemberListNumber.shadowColor = [UIColor colorWithRed:169/255.f green:171/255.f blue:170/255.f alpha:1.0f];
//            labelUserMemberListNumber.shadowOffset = CGSizeMake(0, -0.5f);
//            labelUserMemberListNumber.tag=2002;
//            [viewBG addSubview:labelUserMemberListNumber];
            
            
            
            
                UIButton *btnDel = [UIButton buttonWithType:UIButtonTypeCustom];
                [btnDel setFrame:CGRect_btnDelete];
                [btnDel setBackgroundImage:[UIImage imageNamed:@"btn_grid_close.png"] forState:UIControlStateNormal];
                [btnDel setBackgroundImage:[UIImage imageNamed:@"btn_grid_close_press.png"] forState:UIControlStateHighlighted];
                [btnDel addTarget:self action:@selector(removeCloseFriend:) forControlEvents:UIControlEventTouchUpInside];
                btnDel.tag = btnCloseFriendDelTag;
                btnDel.hidden = YES;
                [viewBG addSubview:btnDel];                
            
            
            [self.cellSubviews addObject:viewBG];
        }
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}


-(void)setContent:(NSIndexPath *)indexpath messageGroup : (NSMutableArray *)messageGroups
{
    
    for (int i = indexpath.row * 4; i < indexpath.row*4+4; i++) {
        
        int j = i - indexpath.row  * 4;
        UIView *viewBG = [self.cellSubviews objectAtIndex:j];    
        if (i < messageGroups.count ) {
            CPUIModelMessageGroup *group = [messageGroups objectAtIndex:i];

            int k = 0;
            if (group.memberList.count > 0) {
                if ([group isMsgMultiGroup]) {
                    for (CPUIModelMessageGroupMember *eachMember in group.memberList) {
                        if (![eachMember isHiddenMember]) {
                            k++;
                        }
                    }
                    
                }else {
                    k = 1;
                }
            }
            

            [viewBG setHidden:NO];
            [viewBG setTag:[group.msgGroupID integerValue]+1000];
            UILabel *labelUserName = (UILabel *)[viewBG viewWithTag:labelUserNameTag];
            UIImageView *imageviewUserImg = (UIImageView *)[viewBG viewWithTag:imageviewUserImgTag];    
            UIImageView *imageviewMessageAlert = (UIImageView *)[viewBG viewWithTag:messageAlertImgInUserImgTag];
            UIButton *btnDel = (UIButton *)[viewBG viewWithTag:btnCloseFriendDelTag];
            if (k > 0) {
                
                    CPUIModelMessageGroupMember *member =  [group.memberList objectAtIndex:0];   
                    CPUIModelUserInfo *userInfo = member.userInfo;            
                if ([HomeInfo shareObject].isDeletingInCloseFriendCell && [userInfo.type integerValue] != USER_MANAGER_XIAOSHUANG) {
                    [btnDel setHidden:NO];
                }else {
                    [btnDel setHidden:YES];
                }

                if ([group isMsgSingleGroup]) {
                    labelUserName.text = userInfo.nickName;
                    UIImage *image = [UIImage imageWithContentsOfFile:userInfo.headerPath];
                    if (!image) {
                        image = [UIImage imageNamed:@"headpic_gray_man_110x110.png"];
                    }else {
                        image = [image imageByScalingAndCroppingForSizeExe:CGSizeMake(55.f, 55.f)];
                    }
                    [imageviewUserImg setImage:image];
                }else if ([group isMsgMultiGroup])
                {
                    labelUserName.text = group.groupName;
                    //UIImage *image = [UIImage returnGroupImgByPeopleNumber:group];
                    UIImage *image = [UIImage groupHeader:group];
                    
                    if (image) {
                        [imageviewUserImg setImage:image];
                    }
                }
                //未读数
                if ([group.unReadedCount integerValue] > 0) {
                    UILabel *labelUnReaded = (UILabel *)[imageviewMessageAlert viewWithTag:UnCloseFriendReadMessageNumberTag];
                    if (labelUnReaded) {
                        if ([group.unReadedCount integerValue] < 100) {
                            labelUnReaded.text = [NSString stringWithFormat:@"%d",[group.unReadedCount integerValue]];    
                        }else {
                            labelUnReaded.text = @"99+";
                        }
                    }
                    
                    if ([group.unReadedCount integerValue] < 100) {
                        CGSize unReaderTextSize = [[NSString stringWithFormat:@"%d",[group.unReadedCount integerValue]] sizeWithFont:[UIFont systemFontOfSize:12]];
                        //-55/4.f+5.f
                        [imageviewMessageAlert setFrame:CGRectMake(55/4*3.f+13.f-unReaderTextSize.width/2.f,-7.f , unReaderTextSize.width + 20.5f, 27.5)];
                    }else {
                        CGSize unReaderTextSize = [[NSString stringWithFormat:@"%d+",99] sizeWithFont:[UIFont systemFontOfSize:12]];
                        [imageviewMessageAlert setFrame:CGRectMake(55/4*3.f+13.f-unReaderTextSize.width/2.f, -7.f, unReaderTextSize.width + 20.5f, 27.5)];
                    }

                        [labelUnReaded setFrame:CGRectMake(3.f, 6.f, imageviewMessageAlert.frame.size.width-6.f, 12)];
                        imageviewMessageAlert.hidden = NO;
                        labelUnReaded.hidden = YES;
                    UIImage *image1 = [UIImage imageNamed:@"item_index_redcircle.png"];
                    UIImage *image = [image1 stretchableImageWithLeftCapWidth:image1.size.width/2.f topCapHeight:0];
                    [imageviewMessageAlert setImage:image];
                    
                    if ([group.unReadedCount integerValue] == 1 && group.msgList.count > 0) {
                        
                        CPUIModelMessage *message = [group.msgList objectAtIndex:group.msgList.count-1];
                        if ([message.flag integerValue] == MSG_FLAG_RECEIVE) {
                            switch ([message.contentType integerValue]) {
                                case MSG_CONTENT_TYPE_TEXT:
                                {
                                    labelUnReaded.hidden = NO;
                                    //[imageviewMessageAlert setImage:[UIImage imageNamed:@"icon_info_bg.png"]];
                                }
                                    break;
                                case MSG_CONTENT_TYPE_IMG:
                                {
                                    [imageviewMessageAlert setImage:[UIImage imageNamed:@"icon_photo.png"]];
                                }
                                    break;
                                case MSG_CONTENT_TYPE_AUDIO:
                                case MSG_CONTENT_TYPE_TTD:
                                case MSG_CONTENT_TYPE_TTW:
                                {
                                    [imageviewMessageAlert setImage:[UIImage imageNamed:@"icon_voice.png"]];
                                }
                                    break;
                                case MSG_CONTENT_TYPE_VIDEO:
                                {
                                    [imageviewMessageAlert setImage:[UIImage imageNamed:@"icon_video.png"]];
                                }
                                    break;
                                case MSG_CONTENT_TYPE_MAGIC:
                                {
                                    [imageviewMessageAlert setImage:[UIImage imageNamed:@"icon_video.png"]];
                                }
                                    break;
                                case MSG_CONTENT_TYPE_CS:
                                {
                                    [imageviewMessageAlert setImage:[UIImage imageNamed:@"icon_voice.png"]];
                                }
                                    break;
                                case MSG_CONTENT_TYPE_CQ:
                                {
                                    [imageviewMessageAlert setImage:[UIImage imageNamed:@"icon_video.png"]];
                                }
                                    break;
                                    
                                case MSG_CONTENT_TYPE_ALARMED_TEXT: //文本的提醒过的
                                case   MSG_CONTENT_TYPE_ALARM_TEXT ://文本的提醒
                                case MSG_CONTENT_TYPE_ALARM_AUDIO:    //语音的提醒
                                case MSG_CONTENT_TYPE_ALARMED_AUDIO://语音的提醒过的
                                {
                                    [imageviewMessageAlert setImage:[UIImage imageNamed:@"icon_alarm.png"]];
                                }
                                    break;
                                    
                                default:
                                {
                                 labelUnReaded.hidden = NO;
                                }
                                    break;
                            }
                            
                        }

                    }else if([group.unReadedCount integerValue] >1 && [group.unReadedCount integerValue] < 100){
                        labelUnReaded.hidden = NO;
                       // [imageviewMessageAlert setImage:[UIImage imageNamed:@"icon_info_bg.png"]];

                    }else if ([group.unReadedCount integerValue] >= 100)
                    {
                        labelUnReaded.hidden = NO;
                    }
                
                }else {
                    imageviewMessageAlert.hidden = YES;
                }
        
            }else {
                if ([HomeInfo shareObject].isDeletingInCloseFriendCell) {
                    [btnDel setHidden:NO];
                }else {
                    [btnDel setHidden:YES];
                }
                
                labelUserName.text = group.groupName;
                
                UIImage *image = [UIImage imageNamed:@"btn_nobody.png"];
                if (image) {
                    [imageviewUserImg setImage:image];
                }
            
          
            
            
                if ([group.unReadedCount integerValue] > 0) {
                    
                    UILabel *labelUnReaded = (UILabel *)[imageviewMessageAlert viewWithTag:UnCloseFriendReadMessageNumberTag];
                    if (labelUnReaded) {
                        if ([group.unReadedCount integerValue] < 100) {
                            labelUnReaded.text = [NSString stringWithFormat:@"%d",[group.unReadedCount integerValue]];    
                        }else {
                            labelUnReaded.text = @"99+";
                        }
                        
                    }
                    
                    if ([group.unReadedCount integerValue] < 100) {
                        CGSize unReaderTextSize = [[NSString stringWithFormat:@"%d",[group.unReadedCount integerValue]] sizeWithFont:[UIFont systemFontOfSize:12]];
                        [imageviewMessageAlert setFrame:CGRectMake(55/4*3.f+13.f-unReaderTextSize.width/2.f, -7.f, unReaderTextSize.width + 20.5f, 27.5)];
                    }else {
                        CGSize unReaderTextSize = [[NSString stringWithFormat:@"%d+",99] sizeWithFont:[UIFont systemFontOfSize:12]];
                        [imageviewMessageAlert setFrame:CGRectMake(55/4*3.f+13.f-unReaderTextSize.width/2.f, -7.f, unReaderTextSize.width + 20.5f, 27.5)];
                    }
                    
                    [labelUnReaded setFrame:CGRectMake(3.f, 6.f, imageviewMessageAlert.frame.size.width-6.f, 12)];
                    imageviewMessageAlert.hidden = NO;
                    labelUnReaded.hidden = YES;
                    UIImage *image1 = [UIImage imageNamed:@"item_index_redcircle.png"];
                    UIImage *image = [image1 stretchableImageWithLeftCapWidth:image1.size.width/2.f topCapHeight:0];
                    [imageviewMessageAlert setImage:image];
                    if ([group.unReadedCount integerValue] == 1 && group.msgList.count > 0) {
                        
                        CPUIModelMessage *message = [group.msgList objectAtIndex:group.msgList.count-1];
                        if ([message.flag integerValue] == MSG_FLAG_RECEIVE) {
                            switch ([message.contentType integerValue]) {
                                case MSG_CONTENT_TYPE_TEXT:
                                {
                                    labelUnReaded.hidden = NO;
                                    //[imageviewMessageAlert setImage:[UIImage imageNamed:@"icon_info_bg.png"]];
                                }
                                    break;
                                case MSG_CONTENT_TYPE_IMG:
                                {
                                    [imageviewMessageAlert setImage:[UIImage imageNamed:@"icon_photo.png"]];
                                }
                                    break;
                                case MSG_CONTENT_TYPE_AUDIO:
                                case MSG_CONTENT_TYPE_TTD:
                                case MSG_CONTENT_TYPE_TTW:
                                {
                                    [imageviewMessageAlert setImage:[UIImage imageNamed:@"icon_voice.png"]];
                                }
                                    break;
                                case MSG_CONTENT_TYPE_VIDEO:
                                {
                                    [imageviewMessageAlert setImage:[UIImage imageNamed:@"icon_video.png"]];
                                }
                                    break;
                                case MSG_CONTENT_TYPE_MAGIC:
                                {
                                    [imageviewMessageAlert setImage:[UIImage imageNamed:@"icon_video.png"]];
                                }
                                    break;
                                case MSG_CONTENT_TYPE_CS:
                                {
                                    [imageviewMessageAlert setImage:[UIImage imageNamed:@"icon_voice.png"]];
                                }
                                    break;
                                case MSG_CONTENT_TYPE_CQ:
                                {
                                    [imageviewMessageAlert setImage:[UIImage imageNamed:@"icon_video.png"]];
                                }
                                    break;
                                case   MSG_CONTENT_TYPE_ALARM_TEXT ://文本的提醒
                                case MSG_CONTENT_TYPE_ALARMED_TEXT: //文本的提醒过的
                                case MSG_CONTENT_TYPE_ALARM_AUDIO:    //语音的提醒
                                case MSG_CONTENT_TYPE_ALARMED_AUDIO://语音的提醒过的
                                {
                                   [imageviewMessageAlert setImage:[UIImage imageNamed:@"icon_alarm.png"]];
                                }
                                    break;
                                default:
                                {
                                    labelUnReaded.hidden = NO;
                                }
                                    break;
                            }
                            
                        }
                        
                    }else if([group.unReadedCount integerValue] >1 && [group.unReadedCount integerValue] < 100){
                        labelUnReaded.hidden = NO;
                        // [imageviewMessageAlert setImage:[UIImage imageNamed:@"icon_info_bg.png"]];
                        
                    }else if ([group.unReadedCount integerValue] >= 100)
                    {
                        labelUnReaded.hidden = NO;
                    }
                    
                }else {
                imageviewMessageAlert.hidden = YES;
            }
    
                
        }
        }
        else {
            [viewBG setHidden:YES];
        }

    }
    
}
-(void)tapHeadIMG:(UITapGestureRecognizer *)gesture
{

   
}
-(void)longPressHeadIMG:(UILongPressGestureRecognizer *)gesture
{
    if (gesture.state == UIGestureRecognizerStateBegan) {
        CPUIModelMessageGroup *messageGroup = [self returnMessageGroup:gesture.view.tag-1000];
        if (messageGroup.memberList.count > 0) {
            CPUIModelMessageGroupMember *member = [messageGroup.memberList objectAtIndex:0];
            CPUIModelUserInfo *userInfo = member.userInfo;
            if ([userInfo.type integerValue] == USER_MANAGER_XIAOSHUANG) {
                return;
            }
        }
       // NSMutableArray *arrInOneSection = [[HomeInfo shareObject].closeFriendMessageDictionary objectForKey:[[HomeInfo shareObject].homeCloseSectionMutableArray objectAtIndex:0]];
        //&& arrInOneSection.count !=1
        
        if ([[HomeInfo shareObject].closeFriendMessageDictionary allKeys] !=0 ) {
            if ([self.closeFriendDelegate respondsToSelector:@selector(beignChangeDeleteStatusFromCloseFriend:)]) {
                [HomeInfo shareObject].deletedTaginCloseFriend = gesture.view.tag;
                [self.closeFriendDelegate beignChangeDeleteStatusFromCloseFriend:YES];
            }            
        }

    }

}
-(void)removeCloseFriend : (UIButton *)sender
{
   
        if ([self.closeFriendDelegate respondsToSelector:@selector(deleteRowBymessageGroup:)]) {
            [self.closeFriendDelegate deleteRowBymessageGroup:[self returnMessageGroup:sender.superview.tag - 1000]];
        }
}
-(CPUIModelMessageGroup *)returnMessageGroup  : (NSInteger)tag
{
    
//    if (tag == -1) {
//    tag = [HomeInfo shareObject].deletedTaginCloseFriend;
//    }
//    
//    NSString *dicKey = [[HomeInfo shareObject].homeCloseSectionMutableArray objectAtIndex:tag/100];
//    NSMutableArray *messageGroups = [[HomeInfo shareObject].closeFriendMessageDictionary objectForKey:dicKey];
//    CPUIModelMessageGroup *messageGroup = [messageGroups objectAtIndex:tag%100];
//    return messageGroup;
        for (CPUIModelMessageGroup *group in [HomeInfo shareObject].homeCloseMessageGroups) {
            if ([group.msgGroupID integerValue] == tag) {
                
                return group;
            }
        }
    return nil;
}
-(void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event 
{

    isMoved = NO;
}
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event 
{
    if ([HomeInfo shareObject].isDeletingInCloseFriendCell) {
        if ([self.closeFriendDelegate respondsToSelector:@selector(beignChangeDeleteStatusFromCloseFriend:)]) {
            [self.closeFriendDelegate beignChangeDeleteStatusFromCloseFriend:NO];
        }        
    }
}
-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    isMoved = YES;
}
-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    if (touch.view.tag != cellContentViewTag && touch.view.superview.tag >= 1000 && !isMoved) {
    
        if ([HomeInfo shareObject].isDeletingInCloseFriendCell) {
            if ([self.closeFriendDelegate respondsToSelector:@selector(beignChangeDeleteStatusFromCloseFriend:)]) {
                [self.closeFriendDelegate beignChangeDeleteStatusFromCloseFriend:NO];
            }  
        }else {
            
            if ([self.closeFriendDelegate respondsToSelector:@selector(gotoIMViewControllerFromFriends:)]) {
                [self.closeFriendDelegate gotoIMViewControllerFromFriends:[self returnMessageGroup:touch.view.superview.tag - 1000]];
            }
            
        }
        

         
    }
    
    isMoved = NO;
    
}
@end
