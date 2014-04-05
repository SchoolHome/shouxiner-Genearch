//
//  KBMagicView.m
//  Keyboard_dev
//
//  Created by ming bright on 12-7-30.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "KBMagicView.h"



#define kWidthOfMagic   (127/2)
#define kHeightOfMagic  (179/2)

#define kLeftPaddingOfMagic ((320-4*kWidthOfMagic)/5)

///////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////

@implementation KBMagicView
@synthesize delagate;
@synthesize magicData = _magicData;

-(void)dealloc{
    [[NSNotificationCenter defaultCenter] removeObserver:self name:kMagicItemDataDownloadFinished object:nil];
}


- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        for (int i = 0; i<7; i++) {
            _item[i] = [[KBMagicItem alloc] init];
            _item[i].backgroundColor = [UIColor clearColor];
            _item[i].exclusiveTouch = YES;
            
        }
        _extraButton = [[KBMagicExtraItem alloc] init];
        _extraButton.exclusiveTouch = YES;
        //[_extraButton setBackgroundImage:[UIImage imageNamed:@"emotion_bg_magic_press_01"] forState:UIControlStateHighlighted];
        
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(magicDataDownloadFinished:) name:kMagicItemDataDownloadFinished object:nil];
    }
    return self;
}

-(void)refreshExtraButton{
    
    BOOL allAvailable = YES;
    
    for (CPUIModelPetMagicAnim *anim in [[CPUIModelManagement sharedInstance] allMagicObjects]) {
        if (![anim isAvailable]) {  // 需要下载的
            allAvailable = NO;
        }
    }
    if (allAvailable) {
        [_extraButton setStateMore];
    }else {
        
        if (downloadAllStarted) {  // 全部下载开启,某一个下载完成的时候，不改变状态
            //
        }else {
            [_extraButton setStateNormal];
        }
    }
}

-(void)magicDataDownloadFinished:(NSNotification *)note{   // 只有下载完成才需要通知
    [self refreshExtraButton];
}

-(void)setMagicData:(NSArray *)magicData_{
    
    if (![_magicData isEqual:magicData_]) {
        _magicData = magicData_;
        for (int i = 0; i<7; i++) {
            int row = i/4;   // 行数
            int line = i%4;  // 列数
            
            _item[i].frame = CGRectMake(line*(kWidthOfMagic+kLeftPaddingOfMagic)+kLeftPaddingOfMagic, row*kHeightOfMagic+5, kWidthOfMagic, kHeightOfMagic);
            [_item[i] addTarget:self action:@selector(magicTaped:) forControlEvents:UIControlEventTouchUpInside];
            [self addSubview:_item[i]];
            
            if ([magicData_ count]>i) {
                [_item[i] setMagicItemData:[_magicData objectAtIndex:i]];
            }
        }
        _extraButton.frame = CGRectMake(3*(kWidthOfMagic+kLeftPaddingOfMagic)+kLeftPaddingOfMagic, 1 * kHeightOfMagic+5, kWidthOfMagic, kHeightOfMagic);
        //[_extraButton setImage:[UIImage imageNamed:@"im_couple_ssdownload"] forState:UIControlStateNormal];
        //[_extraButton setImage:[UIImage imageNamed:@"im_couple_ssdownloadpress"] forState:UIControlStateNormal];
        
        //icon_im_emotion_magic_down_black
        //icon_im_emotion__magic_downing
        //im_couple_ssdownload
        //[_extraButton setImage:[UIImage imageNamed:@"icon_im_emotion_magic_down_black"] stateText:@"下载全部"];
        //[_extraButton setStateLoading];
        [self refreshExtraButton];
        [self addSubview:_extraButton];
        [_extraButton addTarget:self action:@selector(extraTaped:) forControlEvents:UIControlEventTouchUpInside];
    }
}




-(void)magicTaped:(KBMagicItem *)sender{
    
    if(self.delagate&&[self.delagate respondsToSelector:@selector(magicTaped:)]){
        [self.delagate magicTaped:sender];
    }
}

-(void)extraTaped:(UIButton *)sender{
    if(self.delagate&&[self.delagate respondsToSelector:@selector(extraTaped:)]){
        [self.delagate extraTaped:sender];
    }
    
    int downloadCount = 0;
    CGFloat downloadSize = 0.0;
    
    for (CPUIModelPetMagicAnim *anim in [[CPUIModelManagement sharedInstance] allMagicObjects]) {
        if (![anim isAvailable]) {  // 需要下载的
            downloadCount = downloadCount +1;
            downloadSize = downloadSize + [[anim size] intValue];
        }
    }
    
    if (0==downloadCount) {  // 全部下载完毕

    }else {

        downloadAllStarted = YES;
        [_extraButton setStateLoading];
    }
    
}

@end


///////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////

@implementation KBMagicItem
@synthesize magicItemData = _magicItemData;
@synthesize isAvailable = _isAvailable;
-(id)init{
    if (self = [super init]) {
        
        [self setBackgroundImage:[UIImage imageNamed:@"emotion_bg_magic_press_01"] forState:UIControlStateHighlighted];
        _background = [[UIImageView alloc] init];
        _background.backgroundColor = [UIColor clearColor];
        [self addSubview:_background];
        _background.image = nil;
        
        _nameLabel = [[UILabel alloc] init];
        _nameLabel.backgroundColor = [UIColor clearColor];
        _nameLabel.font = [UIFont systemFontOfSize:10];
        _nameLabel.textAlignment = UITextAlignmentCenter;
        _nameLabel.textColor =[UIColor colorWithHexString:@"#9A9A9A"];
        _nameLabel.text = @"";
        
        [self addSubview:_nameLabel];
        
        //[self addSpin];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(magicDataDownloadFinished:) name:kMagicItemDataDownloadFinished object:nil];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(magicDataDownloadLoading:) name:kMagicItemDataDownloadStarted  object:nil];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(magicDataDownloadFailed:) name:kMagicItemDataDownloadFailed object:nil];
        
    }
    return self;
}

-(void)dealloc{
    [[NSNotificationCenter defaultCenter] removeObserver:self name:kMagicItemDataDownloadFinished object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:kMagicItemDataDownloadStarted object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:kMagicItemDataDownloadFailed object:nil];
}



-(void)magicDataDownloadFinished:(NSNotification *)note{
    CPUIModelPetMagicAnim *anim = (CPUIModelPetMagicAnim *)[note object];
    
    if ([_magicItemData.petID isEqualToString:anim.petID]&&[_magicItemData.resourceID isEqualToString:anim.resourceID]) {
        [self setMagicItemData:anim];
        [self removeSpin];
    }
}

-(void)magicDataDownloadFailed:(NSNotification *)note{
    CPUIModelPetMagicAnim *anim = (CPUIModelPetMagicAnim *)[note object];
    
    if ([_magicItemData.petID isEqualToString:anim.petID]&&[_magicItemData.resourceID isEqualToString:anim.resourceID]) {
        [self setMagicItemData:anim];
        [self removeSpin];
    }
}

-(void)magicDataDownloadLoading:(NSNotification *)note{
   
    CPUIModelPetMagicAnim *anim = (CPUIModelPetMagicAnim *)[note object];
    
    if ([_magicItemData.petID isEqualToString:anim.petID]&&[_magicItemData.resourceID isEqualToString:anim.resourceID]) {
        [self setMagicItemData:anim];
        [self addSpin];
    }
}


-(void)setMagicItemData:(CPUIModelPetMagicAnim *)magicItemData_{
    
    if (![_magicItemData isEqual:magicItemData_]) {
        _magicItemData = magicItemData_;
        
        _isAvailable = [_magicItemData isAvailable];
        _nameLabel.text = [_magicItemData name];
        
        if ([_magicItemData isAvailable]) {  // 可用
            UIImage *image = [UIImage imageWithContentsOfFile:_magicItemData.thumbNail];
            _background.image = image;
            [self removeSpin];
        }else {
            //
            NSString *magicID = _magicItemData.resourceID;
            
            if([magicID isEqualToString:@"anweini"]){
                _background.image = [UIImage imageNamed:@"anweini_e.png"];
            }
            else if([magicID isEqualToString:@"baobao"]){
                _background.image = [UIImage imageNamed:@"baobao_e.png"];
            }
            else if([magicID isEqualToString:@"jiaban"]){
                _background.image = [UIImage imageNamed:@"jiaban_e.png"];
            }
            else if([magicID isEqualToString:@"psdh"]){
                _background.image = [UIImage imageNamed:@"psdh_e.png"];
            }
            else if([magicID isEqualToString:@"tiaodou"]){
                _background.image = [UIImage imageNamed:@"tiaodou_e.png"];
            }
            else if([magicID isEqualToString:@"xianyinqin"]){
                _background.image = [UIImage imageNamed:@"xianyinqin_e.png"];
            }else if([magicID isEqualToString:@"qiaoqiaoni"]){
                //
                _background.image = [UIImage imageNamed:@"qiaoqiaoni_e.png"];
            }else {
                //
            }
            
            if (_magicItemData.downloadStatus == K_PETRES_DOWNLOD_STATUS_DOWNLOADING) { // 正在下载
                [self addSpin];
            }
        }

    }
}

-(void)addSpin{
    
    if (!_spin) {
        
        _spin = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhite];
        _spin.frame = CGRectMake(0, 0, 32.0, 32.0);
        _spin.center = CGPointMake(self.frame.size.width/2, self.frame.size.height/2);

        
    }
    
    [self addSubview:_spin];
    [_spin startAnimating];
    
}

-(void)removeSpin{
    [_spin removeFromSuperview];
}

-(void)setFrame:(CGRect)frame{
    [super setFrame:frame];
    _background.frame = CGRectMake((frame.size.width-108/2)/2, 5, 108/2, 132/2);
    
    _nameLabel.frame = CGRectMake(_background.frame.origin.x, 
                                  _background.frame.origin.y+_background.frame.size.height+3,
                                  _background.frame.size.width, 
                                  10);
    
    _spin.center = CGPointMake(frame.size.width/2, frame.size.height/2);
}



@end

///////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////


///////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////

@implementation KBMagicExtraItem


-(id)init{
    if (self = [super init]) {
        
        [self setBackgroundImage:[UIImage imageNamed:@"emotion_bg_magic_press_01"] forState:UIControlStateHighlighted];
        _background = [[UIImageView alloc] init];
        _background.backgroundColor = [UIColor clearColor];
        [self addSubview:_background];
        _background.image = nil;
        
        _nameLabel = [[UILabel alloc] init];
        _nameLabel.backgroundColor = [UIColor clearColor];
        _nameLabel.font = [UIFont systemFontOfSize:10];
        _nameLabel.textAlignment = UITextAlignmentCenter;
        _nameLabel.textColor =[UIColor colorWithHexString:@"#9A9A9A"];
        _nameLabel.text = @"";
        
        [self addSubview:_nameLabel];   
    }
    return self;
}

-(void)setFrame:(CGRect)frame{
    [super setFrame:frame];
    _background.frame = CGRectMake((frame.size.width-58/2)/2, 5, 58/2, 130/2);
    
    _nameLabel.frame = CGRectMake(0, 
                                  _background.frame.origin.y+_background.frame.size.height+3,
                                  frame.size.width, 
                                  10);
    
}

-(void)setImage:(UIImage *) image stateText:(NSString *)text{
    _background.image = image;
    _nameLabel.text = text;
}

-(void)setStateNormal{
    [self setImage:[UIImage imageNamed:@"im_couple_ssdownload"] stateText:@"下载全部"];
}

-(void)setStateLoading{
    [self setImage:[UIImage imageNamed:@"icon_im_emotion__magic_downing"] stateText:@"下载中..."];
}

-(void)setStateMore{
    [self setImage:[UIImage imageNamed:@"icon_im_emotion_magic_down_black"] stateText:@"想要更多"];
}

@end

///////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////

