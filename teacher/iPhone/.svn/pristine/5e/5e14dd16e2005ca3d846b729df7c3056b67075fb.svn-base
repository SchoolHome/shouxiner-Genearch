//
//  HomePageDocumentView.h
//  Documents_dev
//
//  Created by ming bright on 12-5-22.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

// 全部转义字符
#define kHomePageLocation    @"[位置]"
#define kHomePageDuration    @"[时长]"
#define kHomePageLocationOne @"[位置1]"
#define kHomePageLocationTwo @"[位置2]"
#define kHomePageDistance    @"[距离]"

typedef enum {
    HPTextAlignmentLeft = 0,
    HPTextAlignmentCenter,
    HPTextAlignmentRight                   
} HPTextAlignment;


@class HPDocumentButton;
@class HPDocumentLabel;

@protocol HomePageDocumentViewDelegate;

@interface HomePageDocumentView : UIView
{
    HPTextAlignment textAlignment;
    
    NSArray *contents;
    NSMutableDictionary *settings;
    NSArray *settingsArray;
    NSMutableArray *contentsResultArray;
}
@property (nonatomic,assign) id<HomePageDocumentViewDelegate>delegate;
@property (nonatomic,assign)  HPTextAlignment textAlignment;
@property (nonatomic,strong)  NSArray *contents;
@property (nonatomic,strong)  NSMutableDictionary *settings;

-(id)initWithFrame:(CGRect)frame contents:(NSArray *) contentsArray;

@end

@protocol HomePageDocumentViewDelegate <NSObject>
-(void)dateDidTaped:(HomePageDocumentView *)dcView;
@end


/////////////////////////////////////////////////////////////////////////

@interface HPDocumentButton : UIButton
{
    UILabel *line;
}
@end

/////////////////////////////////////////////////////////////////////////

@interface HPDocumentLabel : UILabel
@end

/////////////////////////////////////////////////////////////////////////