//
//  HomePageDocumentView.m
//  Documents_dev
//
//  Created by ming bright on 12-5-22.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "HomePageDocumentView.h"

#define kLeftRightPadding   20.0f
#define kBetweenLinePadding 25.0f

@implementation HomePageDocumentView
@synthesize delegate;
@synthesize contents;
@synthesize textAlignment;
@synthesize settings;


- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {

    }
    return self;
}


-(void)convertContents{
    [contentsResultArray removeAllObjects];
    for (NSString *str in contents) {
        NSMutableArray *mutableArray = [NSMutableArray array];
        [self parseMessage:str withArray:mutableArray];
        [contentsResultArray addObject:mutableArray];
    }
}

-(id)initWithFrame:(CGRect)frame contents:(NSArray *) contentsArray{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        self.contents = contentsArray;
        self.textAlignment = HPTextAlignmentLeft;
        
        contentsResultArray = [[NSMutableArray alloc] init];
        
        for (NSString *str in contentsArray) {
            NSMutableArray *mutableArray = [NSMutableArray array];
            [self parseMessage:str withArray:mutableArray];
            [contentsResultArray addObject:mutableArray];
        }
        
    }
    return self;
}

-(void)setTextAlignment:(HPTextAlignment)textAlignment_{
    textAlignment = textAlignment_;
    [self setNeedsLayout];
}

-(void)setSettings:(NSMutableDictionary *)settings_{
    settings = settings_;
    
    [self convertContents];
    [self setNeedsLayout];
}

-(void)setContents:(NSArray *)contents_{
    contents = contents_;
    
    [self convertContents];
    [self setNeedsLayout];
}


-(void)allowTaped:(HPDocumentButton *)button{
    button.userInteractionEnabled = YES;
}

-(void)documentButtonTaped:(HPDocumentButton *)sender{
    sender.userInteractionEnabled = NO;
    [self performSelector:@selector(allowTaped:) withObject:sender afterDelay:0.3];
    if (self.delegate&&[self.delegate respondsToSelector:@selector(dateDidTaped:)]) {
        [self.delegate dateDidTaped:self];
    }
}


-(void)parseMessage:(NSString*)message withArray:(NSMutableArray*)array
{
	NSRange range=[message rangeOfString:@"["];
	NSRange range1=[message rangeOfString:@"]"];
    //判断当前字符串是否还有表情的标志。
    if (range.location!=NSNotFound &&range1.location!=NSNotFound) {
        if (range.location>0) {  //文字在先
            
            NSString *expStr = [message substringToIndex:range.location];   //非表情部分,拆分成单个字符
            for (int i= 0; i<[expStr length]; i++) {
                [array addObject:[expStr substringWithRange:NSMakeRange(i, 1)]];  
            }
            //////////////////////////////////////////////////////////////////
            
            NSString *emoStr=[message substringWithRange:NSMakeRange(range.location, range1.location+1-range.location)];
            if ([[self.settings allKeys] containsObject:emoStr]) {
                [array addObject:emoStr];                //表情符号，直接添加到数组
            }else {   
                for (int i= 0; i<[emoStr length]; i++) {  //伪表情，继续拆分成单个字符
                    [array addObject:[emoStr substringWithRange:NSMakeRange(i, 1)]];
                }
            }
            
            NSString *str=[message substringFromIndex:range1.location+1];
            [self parseMessage:str withArray:array];
            
        }else {           //第一个就是表情
            NSString *nextstr=[message substringWithRange:NSMakeRange(range.location, range1.location+1-range.location)];
            //排除文字是“”的
            if (![nextstr isEqualToString:@""]) {
                if ([[self.settings allKeys] containsObject:nextstr]) {  //表情符号，直接添加到数组
                    [array addObject:nextstr];
                }else{   //伪表情，继续拆分成单个字符
                    for (int i= 0; i<[nextstr length]; i++) {  //伪表情，继续拆分成单个字符
                        [array addObject:[nextstr substringWithRange:NSMakeRange(i, 1)]];
                    }
                }
                NSString *str=[message substringFromIndex:range1.location+1];
                [self parseMessage:str withArray:array];
                
            }else {
                return;
            }
        }
    }else {    //没发现有表情符号
        if (![message isEqualToString:@""]){
            for (int i= 0; i<[message length]; i++) {
                [array addObject:[message substringWithRange:NSMakeRange(i, 1)]];  
            }
            return;
        }
    }
}

-(void)layoutSubviews{
    [super layoutSubviews];

    for (UIView *sub in [self subviews]) {
        [sub removeFromSuperview];
    }
    
    UIFont *fon=[UIFont boldSystemFontOfSize:15.0f];
    
    CGFloat upx;
    CGFloat upy = 0;
    
    
    if (HPTextAlignmentLeft == self.textAlignment) {  //左对齐
        
        upx = kLeftRightPadding;
        
        for (NSArray *array in contentsResultArray) {
            for (NSString *str in array) {
                if ([str isEqualToString:kHomePageDuration]) {
                    CGSize size= [[settings valueForKey:str] sizeWithFont:fon constrainedToSize:CGSizeMake(CGFLOAT_MAX, 20)];
                    
                    HPDocumentButton *button = [[HPDocumentButton alloc] initWithFrame:CGRectMake(upx,upy,size.width, size.height)];
                    button.titleLabel.font = fon;
                    
                    [button setTitle:[settings valueForKey:str] forState:UIControlStateNormal];
                    [self addSubview:button];
                    button.backgroundColor = [UIColor clearColor];
                    [button addTarget:self action:@selector(documentButtonTaped:) forControlEvents:UIControlEventTouchUpInside];
                    
                    upx = upx + size.width;
                }else if([str isEqualToString:kHomePageLocation]||[str isEqualToString:kHomePageLocationOne]||[str isEqualToString:kHomePageLocationTwo]||[str isEqualToString:kHomePageDistance]){
                    CGSize size= [[settings valueForKey:str] sizeWithFont:fon constrainedToSize:CGSizeMake(CGFLOAT_MAX, 20)];
                    HPDocumentLabel *lab = [[HPDocumentLabel alloc] initWithFrame:CGRectMake(upx,upy,size.width, size.height)];
                    lab.font = fon;
                    lab.textColor = [UIColor redColor];
                    lab.backgroundColor = [UIColor clearColor];
                    lab.text = [settings valueForKey:str];
                    [self addSubview:lab];
                    
                    upx = upx + size.width;
                    
                }else {
                    CGSize size= [str sizeWithFont:fon constrainedToSize:CGSizeMake(CGFLOAT_MAX, 20)];
                    
                    HPDocumentLabel *lab = [[HPDocumentLabel alloc] initWithFrame:CGRectMake(upx,upy,size.width, size.height)];
                    lab.font = fon;
                    lab.backgroundColor = [UIColor clearColor];
                    lab.text = str;
                    [self addSubview:lab];
                    
                    upx = upx + size.width;
                }
            }
            upy = upy+kBetweenLinePadding;
            upx = kLeftRightPadding;
        }
        

    }
    ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    
    if (HPTextAlignmentRight == self.textAlignment)  {  //右对齐
        
        upx = self.frame.size.width - kLeftRightPadding;
        
        for (NSArray *array in contentsResultArray) {
            
            for (int i = [array count]-1; i>-1; i--){
                
                //for (NSString *str in array) {
                
                NSString *str = [array objectAtIndex:i];
                if ([str isEqualToString:kHomePageDuration]) {
                    CGSize size= [[settings valueForKey:str] sizeWithFont:fon constrainedToSize:CGSizeMake(CGFLOAT_MAX, 20)];
                    
                    HPDocumentButton *button = [[HPDocumentButton alloc] initWithFrame:CGRectMake(upx - size.width,upy,size.width, size.height)];
                    button.titleLabel.font = fon;
                    
                    [button setTitle:[settings valueForKey:str] forState:UIControlStateNormal];
                    [self addSubview:button];
                    button.backgroundColor = [UIColor clearColor];
                    [button addTarget:self action:@selector(documentButtonTaped:) forControlEvents:UIControlEventTouchUpInside];
                    
                    upx = upx - size.width;
                }else if([str isEqualToString:kHomePageLocation]||[str isEqualToString:kHomePageLocationOne]||[str isEqualToString:kHomePageLocationTwo]||[str isEqualToString:kHomePageDistance]){
                    CGSize size= [[settings valueForKey:str] sizeWithFont:fon constrainedToSize:CGSizeMake(CGFLOAT_MAX, 20)];
                    HPDocumentLabel *lab = [[HPDocumentLabel alloc] initWithFrame:CGRectMake(upx - size.width,upy,size.width, size.height)];
                    lab.font = fon;
                    lab.textColor = [UIColor redColor];
                    lab.backgroundColor = [UIColor clearColor];
                    lab.text = [settings valueForKey:str];
                    [self addSubview:lab];
                    
                    upx = upx - size.width;
                    
                }else {
                    CGSize size= [str sizeWithFont:fon constrainedToSize:CGSizeMake(CGFLOAT_MAX, 20)];
                    
                    HPDocumentLabel *lab = [[HPDocumentLabel alloc] initWithFrame:CGRectMake(upx - size.width,upy,size.width, size.height)];
                    lab.font = fon;
                    lab.backgroundColor = [UIColor clearColor];
                    lab.text = str;
                    [self addSubview:lab];
                    
                    upx = upx - size.width;
                }
            }
            upy = upy+kBetweenLinePadding;
            upx = self.frame.size.width - kLeftRightPadding;
        }
    }
    
    ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    if (HPTextAlignmentCenter == self.textAlignment)  {  //中间对齐
        
        for (NSArray *array in contentsResultArray) {
            
            NSString *destStr = [array componentsJoinedByString:@""];
            
            for (NSString *key in [settings allKeys]) {
                destStr = [destStr stringByReplacingOccurrencesOfString:key withString:[settings valueForKey:key]];
            }

            CGSize size= [destStr sizeWithFont:fon constrainedToSize:CGSizeMake(CGFLOAT_MAX, 20)];  //计算一行的宽度
            upx = (self.frame.size.width - size.width)/2.0f;
            
            for (NSString *str in array) {
                if ([str isEqualToString:kHomePageDuration]) {
                    
                    CGSize size= [[settings valueForKey:str] sizeWithFont:fon constrainedToSize:CGSizeMake(CGFLOAT_MAX, 20)];
                    
                    HPDocumentButton *button = [[HPDocumentButton alloc] initWithFrame:CGRectMake(upx,upy,size.width, size.height)];
                    button.titleLabel.font = fon;
                    
                    [button setTitle:[settings valueForKey:kHomePageDuration] forState:UIControlStateNormal];
                    [self addSubview:button];
                    button.backgroundColor = [UIColor clearColor];
                    [button addTarget:self action:@selector(documentButtonTaped:) forControlEvents:UIControlEventTouchUpInside];
                    
                    upx = upx + size.width;
                }else if([str isEqualToString:kHomePageLocation]||[str isEqualToString:kHomePageLocationOne]||[str isEqualToString:kHomePageLocationTwo]||[str isEqualToString:kHomePageDistance]){
                    CGSize size= [[settings valueForKey:str] sizeWithFont:fon constrainedToSize:CGSizeMake(CGFLOAT_MAX, 20)];
                    HPDocumentLabel *lab = [[HPDocumentLabel alloc] initWithFrame:CGRectMake(upx,upy,size.width, size.height)];
                    lab.font = fon;
                    lab.textColor = [UIColor redColor];
                    lab.backgroundColor = [UIColor clearColor];
                    lab.text = [settings valueForKey:str];
                    [self addSubview:lab];
                    
                    upx = upx + size.width;
                    
                }else {
                    CGSize size= [str sizeWithFont:fon constrainedToSize:CGSizeMake(CGFLOAT_MAX, 20)];
                    
                    HPDocumentLabel *lab = [[HPDocumentLabel alloc] initWithFrame:CGRectMake(upx,upy,size.width, size.height)];
                    lab.font = fon;
                    lab.backgroundColor = [UIColor clearColor];
                    lab.text = str;
                    [self addSubview:lab];
                    
                    upx = upx + size.width;
                }
            }
            upy = upy+kBetweenLinePadding;
            //upx = kLeftRightPadding;
        }
          
    }
    
}

@end

@implementation HPDocumentButton

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        self.exclusiveTouch = YES;
        line = [[UILabel alloc] initWithFrame:CGRectMake(0, frame.size.height, frame.size.width, 2)];
        line.backgroundColor = [UIColor redColor];
        [self addSubview:line];
        //line = nil;
        
        UILabel *line1 = [[UILabel alloc] initWithFrame:CGRectMake(0, frame.size.height+2, frame.size.width, 1)];
        line1.backgroundColor = [UIColor colorWithRed:0.0 green:0.0 blue:0.0 alpha:0.45];
        [self addSubview:line1];
        line1 = nil;
        
        [self setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
        [self setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
        
        self.titleLabel.shadowOffset = CGSizeMake(0.0,1.0);
        self.titleLabel.shadowColor = [UIColor colorWithRed:0.0 green:0.0 blue:0.0 alpha:0.45];
    }
    return self;
}

@end

/////////////////////////////////////////////////////////////////////////

@implementation HPDocumentLabel

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        self.backgroundColor = [UIColor clearColor];
        self.textColor = [UIColor whiteColor];
        self.shadowOffset = CGSizeMake(0.0,1.0);
        self.shadowColor = [UIColor colorWithRed:0.0 green:0.0 blue:0.0 alpha:0.45];
    }
    return self;
}
@end

/////////////////////////////////////////////////////////////////////////
