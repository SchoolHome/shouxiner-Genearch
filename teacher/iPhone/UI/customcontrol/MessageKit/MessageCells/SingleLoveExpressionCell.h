//
//  SingleLoveExpressionCell.h
//  iCouple
//
//  Created by ming bright on 12-5-16.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "SingleChatInforCellBase.h"
// 传情
@interface SingleLoveExpressionCell : SingleChatInforCellBase
{
    UIImageView *displayImageView;
    UIButton    *playButton;
    UILabel     *playTimeLabel;
    
    UILabel     *receiverDescLabel;
}

@end
