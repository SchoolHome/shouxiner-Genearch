//
//  SingleAskExpressionCell.h
//  iCouple
//
//  Created by ming bright on 12-5-16.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "SingleChatInforCellBase.h"

// 偷偷问
@interface SingleAskExpressionCell : SingleChatInforCellBase
{
    UIImageView *displayImageView;
    UIButton    *playButton;
    UILabel     *playTimeLabel;
    
    UILabel     *receiverDescLabel;
}
@end
