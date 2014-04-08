

#import "PalmViewController.h"
#import "BBXXXTableViewCell.h"
#import "SVPullToRefresh.h"

typedef enum{
    NotifyLoadStatusRefresh, // 刷新
    NotifyLoadStatusAppend,  // 追加
} NotifyLoadStatus;

/*
 新消息
 */
@interface BBXXXViewController : PalmViewController<UITableViewDataSource,UITableViewDelegate>
{

    UITableView *xxxTableView;
    
    
    
    
}
@property(nonatomic) NotifyLoadStatus loadStatus;
@property(nonatomic,strong) NSMutableArray *allNotifyList;
@end
