//
//  HomeFriendsTableViewCell.m
//  iCouple
//
//  Created by qing zhang on 4/13/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//
#define CGRect_imageviewBG CGRectMake(9.f, 0.f, 302.f, 56.f)
#define CGRect_imageviewUserImg CGRectMake(16.f, 6.f, 44.f, 44.f)
#define CGRect_imageviewMessageAlert CGRectMake(55/4*3.f+10.f, -44/4.f, 27.5f, 27.5f)
#define CGRect_btnDelete CGRectMake(300-44/2, 12.f, 55/2.f,55/2.f )
#define CGRect_userName CGRectMake(62.f, 11.f, 150.f, 16.f)
#define CGRect_userMessage CGRectMake(62.f, 29.f, 220.f, 15.f)
#define CGRect_messagedDate CGRectMake(235.f, 11.f, 60.f, 9.f)
#define CGRect_bgViewWhenDeleting CGRectMake(9.f, 0.f,302.f, 56.f)

#import "HomeFriendsTableViewCell.h"
#import "HomeInfo.h"
#import <QuartzCore/QuartzCore.h>
#import "CPUIModelMessageGroupMember.h"
#import "CPUIModelManagement.h"
#import "CPUIModelUserInfo.h"
#import "CPUIModelMessage.h"
#import "ColorUtil.h"
@implementation HomeFriendsTableViewCell

@synthesize imageviewBG = _imageviewBG,imageviewMessageAlert = _imageviewMessageAlert,
            imageviewUserImg = _imageviewUserImg, userName = _userName ,
userMessage = _userMessage , messageReceivedDate = _messageReceivedDate,
messagesNumberInAlertImageview = _messagesNumberInAlertImageview,
homeFriendsTableViewCellDelegate = _homeFriendsTableViewCellDelegate,
btnDelete = _btnDelete , messagedDate = _messagedDate, modelMessageGroup = _modelMessageGroup,
bgViewWhenDeleting = _bgViewWhenDeleting , userGroupNumber = _userGroupNumber;
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self contentView].backgroundColor = [UIColor colorWithRed:243/255.f green:238/255.f blue:229/255.f alpha:1.f];
        //右边内容部分的背景图
//        self.imageviewBG = [[UIImageView alloc] initWithFrame:CGRect_imageviewBG];
//        [self.imageviewBG setImage:[UIImage imageNamed:@"bg_info_white.png"]];
//        [self.imageviewBG setHighlightedImage:[UIImage imageNamed:@"bg_info_red.png"]];
//        self.imageviewBG.userInteractionEnabled = YES;
//        [self addSubview:self.imageviewBG];
        
        self.imageviewBG = [UIButton buttonWithType:UIButtonTypeCustom];
        [self.imageviewBG setFrame:CGRect_imageviewBG];
        [self.imageviewBG setBackgroundImage:[UIImage imageNamed:@"bg_info_white.png"] forState:UIControlStateNormal];
        [self.imageviewBG setBackgroundImage:[UIImage imageNamed:@"bg_info_red.png"] forState:UIControlStateHighlighted];
        [self.imageviewBG addTarget:self action:@selector(tapWhenHighlight:) forControlEvents:UIControlEventAllEvents];
        [self.imageviewBG addTarget:self action:@selector(tap) forControlEvents:UIControlEventTouchUpInside];
//        [self.imageviewBG addTarget:self action:@selector(tapOutSide) forControlEvents:UIControlEventTouchUpOutside | UIControlEventTouchDragOutside];
        [self addSubview:self.imageviewBG];
        

        
        //左边用户头像
        self.imageviewUserImg = [[UIImageView alloc] initWithFrame:CGRect_imageviewUserImg];
        self.imageviewUserImg.backgroundColor = [UIColor clearColor];
        [self addSubview:self.imageviewUserImg];
        
        //左边消息提示信息
        self.imageviewMessageAlert = [[UIImageView alloc] initWithFrame:CGRect_imageviewMessageAlert];
        //[self.imageviewMessageAlert setImage:[UIImage imageNamed:@"icon_pin.png"]];
        [self addSubview:self.imageviewMessageAlert];
        
        //为右边背景添加长按手势
        UILongPressGestureRecognizer *longPress = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(longPress:)];
        [self.imageviewBG addGestureRecognizer:longPress];
        
        self.imageviewBG.exclusiveTouch = YES;

        //右边删除状态下出现的蒙板
        self.bgViewWhenDeleting = [[UIView alloc] initWithFrame:CGRect_bgViewWhenDeleting];
        self.bgViewWhenDeleting.backgroundColor    = [UIColor blackColor];
        self.bgViewWhenDeleting.alpha = 0.5f;
        self.bgViewWhenDeleting.layer.cornerRadius = 5.f;
        [self addSubview:self.bgViewWhenDeleting];
        //右边删除状态下出现的删除按钮
//        UIButton *btnDeleted = [UIButton buttonWithType:UIButtonTypeCustom];
//        [btnDeleted setFrame:CGRect_btnDelete];
//        //[self.btnDelete setTitle:@"x" forState:UIControlStateNormal];
//        [btnDeleted setBackgroundImage:[UIImage imageNamed:@"btn_grid_close.png"] forState:UIControlStateNormal];
//        [btnDeleted setBackgroundImage:[UIImage imageNamed:@"btn_grid_close_press.png"] forState:UIControlStateHighlighted];
//        [btnDeleted addTarget:self action:@selector(removeCell) forControlEvents:UIControlEventTouchUpInside];
//  //      [self addSubview:btnDeleted];
////        [btnDeleted setHidden:YES];
//        [self.bgViewWhenDeleting addSubview:btnDeleted];
        [self.bgViewWhenDeleting setHidden:YES];
        self.btnDelete = [UIButton buttonWithType:UIButtonTypeCustom];
        [self.btnDelete setFrame:CGRect_btnDelete];
        //[self.btnDelete setTitle:@"x" forState:UIControlStateNormal];
        [self.btnDelete setBackgroundImage:[UIImage imageNamed:@"btn_grid_close.png"] forState:UIControlStateNormal];
        [self.btnDelete setBackgroundImage:[UIImage imageNamed:@"btn_grid_close_press.png"] forState:UIControlStateHighlighted];
        [self.btnDelete addTarget:self action:@selector(removeCell) forControlEvents:UIControlEventTouchUpInside];
        [self.btnDelete setHidden:YES];
        [self addSubview:self.btnDelete];
        
        //右边name
        self.userName = [[UILabel alloc] initWithFrame:CGRect_userName];
        self.userName.backgroundColor = [UIColor clearColor];
        [self.userName setHighlightedTextColor:[UIColor whiteColor]];
        self.userName.lineBreakMode = UILineBreakModeTailTruncation;
        self.userName.textColor = [UIColor colorWithHexString:@"#333333"];
        //self.userName.font = [UIFont systemFontOfSize:14.f];
        self.userName.font = [UIFont boldSystemFontOfSize:14.f];
        [self.imageviewBG addSubview:self.userName];
        
        self.userGroupNumber = [[UILabel alloc] initWithFrame:CGRectZero];
        self.userGroupNumber.backgroundColor = [UIColor clearColor];
        [self.userGroupNumber setHighlightedTextColor:[UIColor whiteColor]];
        self.userGroupNumber.font = [UIFont systemFontOfSize:14.f];
//        self.userGroupNumber.font = [UIFont fontWithName:@"Helvetica CE" size:10.f];
        self.userGroupNumber.textColor = [UIColor colorWithRed:65.0f/255.0f green:65.0f/255.f blue:65/255.f alpha:1.f];
        [self.imageviewBG addSubview:self.userGroupNumber];
        //右边内容
        
        self.userMessage = [[UILabel alloc] initWithFrame:CGRect_userMessage];
        self.userMessage.font = [UIFont systemFontOfSize:12.f];
        //self.userMessage.textColor = [UIColor colorWithRed:192/255.f green:192/255.f blue:192/255.f alpha:1.f];
        self.userMessage.textColor = [UIColor colorWithHexString:@"#999999"];
        self.userMessage.backgroundColor = [UIColor clearColor];
        [self.userMessage setHighlightedTextColor:[UIColor whiteColor]];
        [self.imageviewBG addSubview:self.userMessage];
        
        //右边时间
        self.messagedDate = [[UILabel alloc] initWithFrame:CGRect_messagedDate];
        self.messagedDate.textAlignment = UITextAlignmentRight;
        self.messagedDate.font = [UIFont systemFontOfSize:9.f];
        self.messagedDate.backgroundColor = [UIColor clearColor];
        [self.messagedDate setHighlightedTextColor:[UIColor whiteColor]];
        self.messagedDate.textColor = [UIColor colorWithRed:192/255.f green:192/255.f blue:192/255.f alpha:1.f];
        [self.imageviewBG addSubview:self.messagedDate];        


    }
    return self;
}

-(void)longPress : (UILongPressGestureRecognizer *)gesture
{

    isLongPressing = YES;
    self.userName.textColor = [UIColor colorWithRed:65.0f/255.0f green:65.0f/255.f blue:65/255.f alpha:1.f];
    self.userGroupNumber.textColor = [UIColor colorWithRed:65.0f/255.0f green:65.0f/255.f blue:65/255.f alpha:1.f];
    self.userMessage.textColor = [UIColor colorWithHexString:@"#999999"];
    self.messagedDate.textColor = [UIColor colorWithRed:192/255.f green:192/255.f blue:192/255.f alpha:1.f];
   // [self changeContainerStatus:YES];
    //是否在删除状态下，如果否则进去删除状态
    if (![HomeInfo shareObject].isDeletingInCell && gesture.state == UIGestureRecognizerStateBegan) {
        if (self.bgViewWhenDeleting.hidden) {
            //显示删除按钮
            self.bgViewWhenDeleting.hidden = NO;
        }   
        if (self.btnDelete.hidden) {
            self.btnDelete.hidden = NO;
        }

        //存储对应删除 情况下的信息，记录row和indexpath
        [HomeInfo shareObject].deletedCellIndexRow = [self.modelMessageGroup.msgGroupID integerValue];
        //[HomeInfo shareObject].deletedCellIndexRow = indexpathInCell.row;
        [HomeInfo shareObject].deletedCellIndexPath = indexpathInCell;
        
        //将删除状态改为是
        [HomeInfo shareObject].isDeletingInCell = YES;
        //如果右边背景图是高亮状态则关闭高亮
//        if (self.imageviewBG.highlighted) {
//            self.imageviewBG.highlighted = NO;
//        }
        if ([self.homeFriendsTableViewCellDelegate respondsToSelector:@selector(beignDeleteStatusFromFriend)]) {
            [self.homeFriendsTableViewCellDelegate beignDeleteStatusFromFriend];
        }
    }else {
        
    }



 
    
}
-(void)tapWhenHighlight:(UIButton *)sender
{
    if (sender.isHighlighted) {
        self.userName.textColor = [UIColor whiteColor];
        self.userMessage.textColor = [UIColor whiteColor];
        self.messagedDate.textColor = [UIColor whiteColor];
        self.userGroupNumber.textColor = [UIColor whiteColor];        
    }else {
        self.userName.textColor = [UIColor colorWithRed:65.0f/255.0f green:65.0f/255.f blue:65/255.f alpha:1.f];
        self.userGroupNumber.textColor = [UIColor colorWithRed:65.0f/255.0f green:65.0f/255.f blue:65/255.f alpha:1.f];
        self.userMessage.textColor = [UIColor colorWithHexString:@"#999999"];
        self.messagedDate.textColor = [UIColor colorWithRed:192/255.f green:192/255.f blue:192/255.f alpha:1.f];        
    }

}
-(void)tapOutSide
{
    self.userName.textColor = [UIColor colorWithRed:65.0f/255.0f green:65.0f/255.f blue:65/255.f alpha:1.f];
    self.userGroupNumber.textColor = [UIColor colorWithRed:65.0f/255.0f green:65.0f/255.f blue:65/255.f alpha:1.f];
    self.userMessage.textColor = [UIColor colorWithHexString:@"#999999"];
    self.messagedDate.textColor = [UIColor colorWithRed:192/255.f green:192/255.f blue:192/255.f alpha:1.f];
}
-(void)tap
{
    //[self changeContainerStatus:YES];
    //如果是删除状态则取消，反之进入IM
    if ([HomeInfo shareObject].isDeletingInCell ) {
        if ([self.homeFriendsTableViewCellDelegate respondsToSelector:@selector(recoverDeletingStatus)]) {
            [self.homeFriendsTableViewCellDelegate recoverDeletingStatus];    
        }
    }else{
        if([self.homeFriendsTableViewCellDelegate respondsToSelector:@selector(gotoIMViewControllerFromFriends:)]) 
        {
        
         [self.homeFriendsTableViewCellDelegate gotoIMViewControllerFromFriends:self.modelMessageGroup];
         
        }
    }
    self.userName.textColor = [UIColor colorWithRed:65.0f/255.0f green:65.0f/255.f blue:65/255.f alpha:1.f];
    self.userGroupNumber.textColor = [UIColor colorWithRed:65.0f/255.0f green:65.0f/255.f blue:65/255.f alpha:1.f];
    self.userMessage.textColor = [UIColor colorWithHexString:@"#999999"];
    self.messagedDate.textColor = [UIColor colorWithRed:192/255.f green:192/255.f blue:192/255.f alpha:1.f];

}
#pragma mark method
-(void)changeContainerStatus:(BOOL)isHighlight
{
    if (isHighlight) {
        [self.userGroupNumber setHighlighted:YES];
        [self.userName setHighlighted:YES];
        [self.userMessage setHighlighted:YES];
        [self.messagedDate setHighlighted:YES];
    }else {
        [self.userGroupNumber setHighlighted:NO];
        [self.userName setHighlighted:NO];
        [self.userMessage setHighlighted:NO];
        [self.messagedDate setHighlighted:NO];
    }
}
//取消imageview的高亮状态，主要用于touch事件中只点一下的情况
//-(void)cancelImageviewBgHighlighted
//{
//    if (self.imageviewBG.highlighted) {
//        
//        self.imageviewBG.highlighted = NO;
//    }
//}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
-(void)setContentWhenfriendViewNotNeedRefreshData:(NSIndexPath *)indexpath modelMessageGroup:(CPUIModelMessageGroup *)messageGropu
{
    if ([messageGropu.msgGroupID integerValue] != self.msgGroupId) {
       [self setContent:indexpath modelMessageGroup:messageGropu];
    }
}
//为cell填充内容
-(void)setContent :(NSIndexPath *)indexpath modelMessageGroup:(CPUIModelMessageGroup *)messageGropu
{

    /******
     填充cell中的数据
     ******/
    indexpathInCell = indexpath;
    self.userGroupNumber.text = @"";
    self.msgGroupId = [messageGropu.msgGroupID integerValue];
   // [self.imageviewUserImg setImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle]pathForResource:@"icon_im_ss_onbar" ofType:@"png"]]];
    //判断当前indexpath是否和已经出现删除的cell是同一个，防止tableview滚动时重新加载改变了删除按钮的状态

    self.modelMessageGroup = messageGropu;
    
    
    int i = 0;
    if (messageGropu.memberList.count > 0) {
        if ([messageGropu isMsgMultiGroup]) {
            for (CPUIModelMessageGroupMember *eachMember in messageGropu.memberList) {
                if (![eachMember isHiddenMember]) {
                    
                    i++;
                }
            }
            
        }else {
            i = 1;
        }
    }

    
    if (i > 0) {
        CPUIModelMessageGroupMember *member =  [messageGropu.memberList objectAtIndex:0];   
        CPUIModelUserInfo *userInfo = member.userInfo;  
        
        if ([messageGropu.type integerValue] == MSG_GROUP_UI_TYPE_SINGLE) {
            self.userName.text = userInfo.nickName;
            UIImage *image = [UIImage imageWithContentsOfFile:userInfo.headerPath];

            if (!image) {
                image = [UIImage imageNamed:@"headpic_gray_man_110x110.png"];
            }else {
                image = [image imageByScalingAndCroppingForSizeExe:CGSizeMake(self.imageviewUserImg.frame.size.width,self.imageviewUserImg.frame.size.height)];
            }
            [self.imageviewUserImg setImage:image];
            
            self.imageviewUserImg.layer.cornerRadius = 5.f;
            [self.imageviewUserImg.layer setMasksToBounds:YES];
            
            if (imageviewUserImgShadow) {
                imageviewUserImgShadow = [[UIImageView alloc] initWithFrame:CGRectMake(0.0f, 0.0f, 44.0f, 44.0f)];
                imageviewUserImgShadow.image = [UIImage imageNamed:@"headpic_shadow_110x110.png"];
                imageviewUserImgShadow.userInteractionEnabled = NO;
                [self.imageviewUserImg addSubview:imageviewUserImgShadow];                
            }

           
        }else if ([messageGropu.type integerValue] == MSG_GROUP_UI_TYPE_CONVER || [messageGropu.type integerValue] == MSG_GROUP_UI_TYPE_MULTI){
            //群头像
            //[self.imageviewUserImg setImage:[UIImage returnGroupImgByPeopleNumber:messageGropu]];
            [self.imageviewUserImg setImage:[UIImage groupHeaderForFriendWall:messageGropu]];
            for (CPUIModelMessageGroupMember *eachMember in messageGropu.memberList) {
                 if(![eachMember.nickName isEqualToString:@""]){
                    self.userName.text = eachMember.nickName;        
                    break;
                }
            }
        
            
            
            CGSize size = [[HomeInfo shareObject] returnSizeForLabelText:self.userName];
            [self.userGroupNumber setFrame:CGRectMake(self.userName.frame.origin.x + size.width,self.userName.frame.origin.y-1, 50.f, 16.f)];
            self.userGroupNumber.text = [NSString stringWithFormat:@"(%d人)",i+1];
        }
    }else {
        [self.imageviewUserImg setImage:[UIImage imageNamed:@"btn_nobody.png"]];
        self.userName.text = @"多人会话";
        CGSize size = [[HomeInfo shareObject] returnSizeForLabelText:self.userName];
        [self.userGroupNumber setFrame:CGRectMake(self.userName.frame.origin.x + size.width,self.userName.frame.origin.y-1, 50.f, 16.f)];
        self.userGroupNumber.text = @"(1人)";
        
        
        self.imageviewUserImg.layer.cornerRadius = 5.f;
        [self.imageviewUserImg.layer setMasksToBounds:YES];
        if (imageviewUserImgShadow) {
            imageviewUserImgShadow = [[UIImageView alloc] initWithFrame:CGRectMake(0.0f, 0.0f, 44.0f, 44.0f)];
            imageviewUserImgShadow.image = [UIImage imageNamed:@"headpic_shadow_110x110.png"];
            imageviewUserImgShadow.userInteractionEnabled = NO;
            [self.imageviewUserImg addSubview:imageviewUserImgShadow];                
        }
    }



        if (messageGropu.msgList.count >0) {
            /*
             "ReceivePicture" = "发来一张图片";
             "ReceiveAudio" ="发来一段语音";                
             "ReceiveVideo" ="发来一段视频";    
             "ReceiveMagic" ="发来魔法表情";    
             "ReceiveCS" ="托小双带来一段传声";                
             "ReceiveCQ"= "托小双带来传情";                
             "ReceiveTTW"= "有好友托小双匿名问你问题哦";  
             */
            CPUIModelMessage *message = [messageGropu.msgList objectAtIndex:messageGropu.msgList.count-1];
            if ([message.flag integerValue] == MSG_FLAG_RECEIVE) {
                switch ([message.contentType integerValue]) {
                    case MSG_CONTENT_TYPE_TEXT:
                    {
                        self.userMessage.text = message.msgText;
                    }
                        break;
                    case MSG_CONTENT_TYPE_IMG:
                    {
                        self.userMessage.text = NSLocalizedString(@"ReceivePicture", nil) ;
                    }
                        break;
                    case MSG_CONTENT_TYPE_AUDIO:
                    {
                        self.userMessage.text = NSLocalizedString(@"ReceiveAudio", nil);                
                    }
                        break;
                    case MSG_CONTENT_TYPE_VIDEO:
                    {
                        self.userMessage.text = NSLocalizedString(@"ReceiveVideo", nil);    
                    }
                        break;
                    case MSG_CONTENT_TYPE_MAGIC:
                    {
                        self.userMessage.text = NSLocalizedString(@"ReceiveMagic", nil);    
                    }
                        break;
                    case MSG_CONTENT_TYPE_CS:
                    {
                        self.userMessage.text = NSLocalizedString(@"ReceiveCS", nil);                
                    }
                        break;
                    case MSG_CONTENT_TYPE_CQ:
                    {
                        self.userMessage.text = NSLocalizedString(@"ReceiveCQ", nil);                
                    }
                        break;
                    case MSG_CONTENT_TYPE_TTW:
                    {
                        self.userMessage.text = NSLocalizedString(@"ReceiveTTW", nil);
                    }
                        break;
                    case MSG_CONTENT_TYPE_TTD:
                    {  
                        self.userMessage.text = NSLocalizedString(@"ReceiveTTD", nil);
                    }
                        break;
                    case MSG_CONTENT_TYPE_ALARMED_TEXT: //文本的提醒过的
                    case   MSG_CONTENT_TYPE_ALARM_TEXT ://文本的提醒
                    {
                        self.userMessage.text = @"发了个闹闹给你";
                    }
                        break;
                    case MSG_CONTENT_TYPE_ALARMED_AUDIO://语音的提醒过的    
                    case MSG_CONTENT_TYPE_ALARM_AUDIO:    //语音的提醒
                    {
                        self.userMessage.text = @"托小双捎了个闹闹给你";
                    }
                        break;
                    
                    default:
                    {
                        self.userMessage.text = message.msgText;
                    }
                        break;
                }
                
            }else if ([message.flag integerValue] == MSG_FLAG_SEND)
            {
                switch ([message.contentType integerValue]) {
                    case MSG_CONTENT_TYPE_TEXT:
                    {
                        self.userMessage.text = [NSString stringWithFormat:@"我:%@",message.msgText];
                    }
                        break;
                    case MSG_CONTENT_TYPE_IMG:
                    {
                        self.userMessage.text = NSLocalizedString(@"SendPicture", nil) ;
                    }
                        break;
                    case MSG_CONTENT_TYPE_AUDIO:
                    {
                        self.userMessage.text = NSLocalizedString(@"SendAudio", nil);                
                    }
                        break;
                    case MSG_CONTENT_TYPE_VIDEO:
                    {
                        self.userMessage.text = NSLocalizedString(@"SendVideo", nil);    
                    }
                        break;
                    case MSG_CONTENT_TYPE_MAGIC:
                    {
                        self.userMessage.text = NSLocalizedString(@"SendMagic", nil);    
                    }
                        break;
                    case MSG_CONTENT_TYPE_CS:
                    {
                        self.userMessage.text = NSLocalizedString(@"SendCS", nil);                
                    }
                        break;
                    case MSG_CONTENT_TYPE_CQ:
                    {
                        self.userMessage.text = NSLocalizedString(@"SendCQ", nil);                
                    }
                        break;
                    case MSG_CONTENT_TYPE_TTW:
                    {
                        self.userMessage.text = NSLocalizedString(@"SendTTW", nil);
                    }
                        break;
                    case MSG_CONTENT_TYPE_ALARMED_TEXT: //文本的提醒过的
                    case   MSG_CONTENT_TYPE_ALARM_TEXT ://文本的提醒
                    {
                        self.userMessage.text = @"我：发出一个闹闹";
                    }
                        break;
                    case MSG_CONTENT_TYPE_ALARMED_AUDIO://语音的提醒过的    
                    case MSG_CONTENT_TYPE_ALARM_AUDIO:    //语音的提醒
                    {
                        self.userMessage.text = @" 我：托小双送出一个闹闹";
                    }
                        break;
                    default:
                    {
                        self.userMessage.text = message.msgText;
                    }
                        break;
                }
            }
            if ([message.date longLongValue]/1000 > [messageGropu.updateDate longLongValue]/1000 ) {
                NSDate *messageDate = [NSDate dateWithTimeIntervalSince1970:[message.date longLongValue]/1000];
                //NSString *messageStr = [[HomeInfo shareObject] compareDate:messageDate];
                NSString *messageStr = [[[DateUtil alloc] init] compareDate:messageDate];
                self.messagedDate.text = messageStr;
                
            }else {
                NSDate *messageDate = [NSDate dateWithTimeIntervalSince1970:[messageGropu.updateDate longLongValue]/1000];
                //NSString *messageStr = [[HomeInfo shareObject] compareDate:messageDate];
                NSString *messageStr = [[[DateUtil alloc] init] compareDate:messageDate];
                self.messagedDate.text = messageStr;
                
            }
        }else{
            NSDate *messageDate = [NSDate  dateWithTimeIntervalSince1970:[messageGropu.updateDate longLongValue]/1000];
            self.messagedDate.text = [[[DateUtil alloc]init] compareDate:messageDate];
            
            self.userMessage.text = @"你们还没聊过天哦，快来说两句";
        }    
    
    
    if ([messageGropu.unReadedCount integerValue] < 100) {
        CGSize unReaderTextSize = [[NSString stringWithFormat:@"%d",[messageGropu.unReadedCount integerValue]] sizeWithFont:[UIFont systemFontOfSize:12]];
        [self.imageviewMessageAlert setFrame:CGRectMake(55/4*3.f+10.f-unReaderTextSize.width/2.f, -55/4.f+15.f, unReaderTextSize.width + 20.5f, 27.5)];        
    }else {
        CGSize unReaderTextSize = [[NSString stringWithFormat:@"%d+",99] sizeWithFont:[UIFont systemFontOfSize:12]];
        [self.imageviewMessageAlert setFrame:CGRectMake(55/4*3.f+10.f-unReaderTextSize.width/2.f, -55/4.f+15.f, unReaderTextSize.width + 20.5f, 27.5)];
    }

    //未读数
    UILabel *labelUnReaded = (UILabel *)[self viewWithTag:UnReadMessageNumberTag];

    if (!labelUnReaded) {
        labelUnReaded = [[UILabel alloc] initWithFrame:CGRectMake(3.f, 6.f, self.imageviewMessageAlert.frame.size.width-6, 14)];
        labelUnReaded.textColor = [UIColor colorWithRed:245/255.f green:245/255.f blue:245/255.f alpha:1.f];
        labelUnReaded.font = [UIFont fontWithName:@"Helvetica-Bold" size:14.f];
        labelUnReaded.backgroundColor = [UIColor clearColor];
        labelUnReaded.textAlignment = UITextAlignmentCenter;
        labelUnReaded.tag = UnReadMessageNumberTag;
        [self.imageviewMessageAlert addSubview:labelUnReaded];           
    }else {
        [labelUnReaded setFrame:CGRectMake(3.f, 6.f, self.imageviewMessageAlert.frame.size.width-6, 12)];
    }
    if ([messageGropu.unReadedCount integerValue] < 100) {
        labelUnReaded.text = [NSString stringWithFormat:@"%d",[messageGropu.unReadedCount integerValue]];
    }else {
        labelUnReaded.text = @"99+";
    }
    
    if ([self.modelMessageGroup.unReadedCount integerValue] > 0 && messageGropu.msgList.count > 0) {
        labelUnReaded.hidden = YES;
        UIImage *image1 = [UIImage imageNamed:@"item_index_redcircle.png"];
        UIImage *image = [image1 stretchableImageWithLeftCapWidth:image1.size.width/2.f topCapHeight:0];
        [self.imageviewMessageAlert setImage:image];
        CPUIModelMessage *message = [messageGropu.msgList objectAtIndex:messageGropu.msgList.count-1];
        self.imageviewMessageAlert.hidden = NO;
        if ([messageGropu.unReadedCount integerValue] == 1) {
            if ([message.flag integerValue] == MSG_FLAG_RECEIVE) {
                switch ([message.contentType integerValue]) {
                    case MSG_CONTENT_TYPE_TEXT:
                    {
                        labelUnReaded.hidden = NO;
                       //[self.imageviewMessageAlert setImage:[UIImage imageNamed:@"icon_info_bg.png"]];
                    }
                        break;
                    case MSG_CONTENT_TYPE_IMG:
                    {
                       [self.imageviewMessageAlert setImage:[UIImage imageNamed:@"icon_photo.png"]];
                    }
                        break;
                    case MSG_CONTENT_TYPE_AUDIO:
                    {
                        [self.imageviewMessageAlert setImage:[UIImage imageNamed:@"icon_voice.png"]];
                    }
                        break;
                    case MSG_CONTENT_TYPE_VIDEO:
                    {
                        [self.imageviewMessageAlert setImage:[UIImage imageNamed:@"icon_video.png"]];
                    }
                        break;
                    case MSG_CONTENT_TYPE_MAGIC:
                    {
                        [self.imageviewMessageAlert setImage:[UIImage imageNamed:@"icon_video.png"]];
                    }
                        break;
                    case MSG_CONTENT_TYPE_CS:
                    {
                        [self.imageviewMessageAlert setImage:[UIImage imageNamed:@"icon_voice.png"]];
                    }
                        break;
                    case MSG_CONTENT_TYPE_CQ:
                    {
                        [self.imageviewMessageAlert setImage:[UIImage imageNamed:@"icon_video.png"]];
                    }
                        break;
                    case MSG_CONTENT_TYPE_SYS:
                    {
                        labelUnReaded.hidden = NO;
                    }
                        break;
                    case MSG_CONTENT_TYPE_TTW:
                    {
                        [self.imageviewMessageAlert setImage:[UIImage imageNamed:@"icon_voice.png"]];
                    }
                        break;
                    case MSG_CONTENT_TYPE_TTD:
                    {
                        [self.imageviewMessageAlert setImage:[UIImage imageNamed:@"icon_voice.png"]];
                    }
                        break;
                    case MSG_CONTENT_TYPE_ALARMED_TEXT: //文本的提醒过的
                    case   MSG_CONTENT_TYPE_ALARM_TEXT ://文本的提醒
                    case MSG_CONTENT_TYPE_ALARM_AUDIO:    //语音的提醒
                    case MSG_CONTENT_TYPE_ALARMED_AUDIO://语音的提醒过的
                    {
                        [self.imageviewMessageAlert setImage:[UIImage imageNamed:@"icon_alarm.png"]];
                    }
                        break;
                    default:
                    {
                        labelUnReaded.hidden = NO;
                    }
                        break;
                }
                
            }
            
            
        }else if ([messageGropu.unReadedCount integerValue] >1 && [self.modelMessageGroup.unReadedCount integerValue] < 100){
            labelUnReaded.hidden = NO;
        }else if ([messageGropu.unReadedCount integerValue] >= 100) {
            labelUnReaded.hidden = NO;
        }
    }else {
        self.imageviewMessageAlert.hidden = YES;
    }
    //根据msgGroupID 判断是否在删除状态
    if ([messageGropu.msgGroupID integerValue] == [HomeInfo shareObject].deletedCellIndexRow) {
        [self.btnDelete setHidden:NO];            
        [self.bgViewWhenDeleting setHidden:NO];
    }else {
        [self.btnDelete setHidden:YES];
        [self.bgViewWhenDeleting setHidden:YES];
    }

}
//删除cell，通过删除按钮触发
-(void)removeCell
{
    if ([self.homeFriendsTableViewCellDelegate respondsToSelector:@selector(deleteRowBymessageGroup:)]) {

    
   // CPUIModelMessageGroup *group = [[HomeInfo shareObject].friendMessageArray objectAtIndex:[HomeInfo shareObject].deletedCellIndexPath.row];
        for (CPUIModelMessageGroup *group in [HomeInfo shareObject].friendMessageArray) {
        
            if ([group.msgGroupID integerValue] == [HomeInfo shareObject].deletedCellIndexRow) {
                [self.homeFriendsTableViewCellDelegate deleteRowBymessageGroup:group];                      
                break;
            }
      
        }


        
    }
  
}
-(void)changeTextColor
{
    if (self.imageviewBG.highlighted) {
        self.imageviewBG.highlighted = NO;
        self.userName.textColor = [UIColor colorWithRed:65.0f/255.0f green:65.0f/255.f blue:65/255.f alpha:1.f];
        self.userGroupNumber.textColor = [UIColor colorWithRed:65.0f/255.0f green:65.0f/255.f blue:65/255.f alpha:1.f];
        self.userMessage.textColor = [UIColor colorWithHexString:@"#999999"];
        self.messagedDate.textColor = [UIColor colorWithRed:192/255.f green:192/255.f blue:192/255.f alpha:1.f];          
    }

}
#pragma mark touch

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    
    isLongPressing = NO;
    
    UITouch *touch = [touches anyObject];
    CGPoint point  = [touch locationInView:self];
    
    if ([self.homeFriendsTableViewCellDelegate respondsToSelector:@selector(closeScrollable)]) {
        [self.homeFriendsTableViewCellDelegate closeScrollable];
    }
    
    //如果正在删除状态则取消删除状态，任何情况都将imageview高亮
    if (![HomeInfo shareObject].isDeletingInCell) {
        if (CGRectContainsPoint(self.imageviewUserImg.frame, point)) {
            self.imageviewBG.highlighted = YES;
            self.userName.textColor = [UIColor whiteColor];
            self.userMessage.textColor = [UIColor whiteColor];
            self.messagedDate.textColor = [UIColor whiteColor];
            self.userGroupNumber.textColor = [UIColor whiteColor];
        } 
    }
}
-(void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event
{

    // [self performSelector:@selector(cancelImageviewBgHighlighted) withObject:nil afterDelay:0.0f];
    [self changeTextColor];
    if (self.imageviewBG.highlighted) {
        self.imageviewBG.highlighted = NO;
    }
    if ([self.homeFriendsTableViewCellDelegate respondsToSelector:@selector(openScrollable)]) {
        [self.homeFriendsTableViewCellDelegate openScrollable];
    }
}
-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self changeTextColor];
   
}
//结束时触发一下右边背景图变色的效果
-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    CGPoint point  = [touch locationInView:self];
    [self changeTextColor];
    if ([HomeInfo shareObject].isDeletingInCell) {
        if ([self.homeFriendsTableViewCellDelegate respondsToSelector:@selector(recoverDeletingStatus)]) {
            [self.homeFriendsTableViewCellDelegate recoverDeletingStatus];    
        } 
    }else {
        if ([self.homeFriendsTableViewCellDelegate respondsToSelector:@selector(gotoIMViewControllerFromFriends:)] && CGRectContainsPoint(self.imageviewUserImg.frame, point)) {
            [self.homeFriendsTableViewCellDelegate gotoIMViewControllerFromFriends:self.modelMessageGroup];
        }           
    }

    if ([self.homeFriendsTableViewCellDelegate respondsToSelector:@selector(openScrollable)]) {
        [self.homeFriendsTableViewCellDelegate openScrollable];
    }
    
//    if (![HomeInfo shareObject].isDeletingInCell && !isLongPressing) {
//        if ([self.homeFriendsTableViewCellDelegate respondsToSelector:@selector(gotoIMViewControllerFromFriends:)] && CGRectContainsPoint(self.imageviewBG.frame, point)) {
//
//            [self.homeFriendsTableViewCellDelegate gotoIMViewControllerFromFriends:self.modelMessageGroup];
//        }
//    }else {
//        if ([self.homeFriendsTableViewCellDelegate respondsToSelector:@selector(recoverDeletingStatus)]) {
//            [self.homeFriendsTableViewCellDelegate recoverDeletingStatus];    
//        }
//    }
    // [self performSelector:@selector(cancelImageviewBgHighlighted) withObject:nil afterDelay:0.06f];

}

@end
