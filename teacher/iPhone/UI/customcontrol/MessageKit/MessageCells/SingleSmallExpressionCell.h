//
//  SingleSmallExpressionCell.h
//  iCouple
//
//  Created by ming bright on 12-5-2.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "SingleChatInforCellBase.h"
#import "ExpressionsParser.h"

#define kExpressionSizeWidth  35
#define kExpressionSizeHeight 35

#define kTextSizeHeight       18  //14号字的行高

//行之间的距离
#define kTwoLinePadding       5


@protocol TextDisplayViewDelegate;
@interface TextDisplayView :UIView {
    ExpressionsParser *parser;
    BOOL isBelongMe;
}

@property (nonatomic,assign) id<TextDisplayViewDelegate> delegate;
@property (nonatomic,assign) BOOL isBelongMe;
@property (nonatomic,strong) ExpressionsParser *parser;
@property (nonatomic,strong) ExMessageModel *exModel;

-(void)refreshAnim;

@end

@protocol TextDisplayViewDelegate <NSObject>
-(void)textDisplayViewTaped:(TextDisplayView *)textDisplayView_;
@end


@interface SingleSmallExpressionCell : SingleChatInforCellBase<TextDisplayViewDelegate>{
    TextDisplayView *textDisplayView;
}
-(CGSize)calculateTextDisplayViewSize:(ExMessageModel *)model;
@end
