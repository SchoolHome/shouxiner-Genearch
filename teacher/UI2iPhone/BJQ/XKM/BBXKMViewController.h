

#import <UIKit/UIKit.h>

@protocol BBXKMViewControllerDelegate;
@interface BBXKMViewController : UITableViewController
{
    NSArray *kmList;
    NSArray *colorList;
}

@property(nonatomic,weak) id<BBXKMViewControllerDelegate> xkmDelegate;

@property int selectedIndex;
@end

////////////////////////////////////////////////////////////////////////////////

@protocol BBXKMViewControllerDelegate <NSObject>

-(void)bbXKMViewController:(BBXKMViewController *)controller didSelectedIndex:(int)index;

@end