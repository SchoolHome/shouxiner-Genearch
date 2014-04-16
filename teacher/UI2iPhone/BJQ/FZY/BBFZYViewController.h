
#import "PalmViewController.h"
#import "BBXKMViewController.h"
#import "UIPlaceHolderTextView.h"
#import "BBGroupModel.h"

/*
 发作业
 */
@interface BBFZYViewController : PalmViewController<BBXKMViewControllerDelegate,UIActionSheetDelegate,UIImagePickerControllerDelegate,UINavigationControllerDelegate>
{

    UIPlaceHolderTextView *thingsTextView;
    
    
    UIButton *imageButton[8];

    UILabel *kemuLabel;
    UIButton *kemuButton;
    
    UILabel *kejianLabel;
    UIButton *kejianButton;
    
    NSArray *kmList;
    
    int selectCount;

    int imageCount;
    NSMutableArray *attachList;
}

@property(nonatomic,strong) BBGroupModel *currentGroup;

@property int topicType;

@property int selectedIndex;

@property (nonatomic,assign) int style;

@end
