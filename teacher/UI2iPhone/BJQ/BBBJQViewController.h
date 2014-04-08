
#import "PalmViewController.h"
#import "BBLinkTableViewCell.h"
#import "BBWorkTableViewCell.h"
#import "BBImageTableViewCell.h"
#import "BBFZYViewController.h"

#import "BBBJDropdownView.h"
#import "BBFSDropdownView.h"


#import "BBInputView.h"
#import "BBGroupModel.h"

#import "SVPullToRefresh.h"
#import "EGOImageView.h"


typedef enum{
    TopicLoadStatusRefresh, // 刷新
    TopicLoadStatusAppend,  // 追加
} TopicLoadStatus;

@interface BBBJQViewController : PalmViewController<
UITableViewDataSource,
UITableViewDelegate,
UIScrollViewDelegate,
UIActionSheetDelegate,
BBBJDropdownViewDelegate,
BBFSDropdownViewDelegate,
BBBaseTableViewCellDelegate,
BBInputViewDelegate>
{
    UIButton *titleButton;
    EGOImageView *avatar;
    UILabel *point;
    UITableView *bjqTableView;
    
    BBBJDropdownView *bjDropdownView;
    BBFSDropdownView *fsDropdownView;
    
    BBInputView *inputBar;
    
    BOOL hasNew;
    
    NSMutableArray *allTopicList;
    
    TopicLoadStatus loadStatus;
    int notifyCount;
}

@property(nonatomic,strong) BBGroupModel *currentGroup;

@end
