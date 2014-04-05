
#import "BBXXXViewController.h"
#import "CoreUtils.h"

@interface BBXXXViewController ()

@end

@implementation BBXXXViewController


- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context{
    if ([@"notifyList" isEqualToString:keyPath])  // 班级列表
    {
        NSArray *list = [PalmUIManagement sharedInstance].notifyList;
        
        switch (loadStatus) {
            case NotifyLoadStatusRefresh:
            {
                [allNotifyList removeAllObjects];
                [allNotifyList addObjectsFromArray:list];
                
                [xxxTableView.pullToRefreshView stopAnimating];
                
                NSDate *now = [CoreUtils convertDateToLocalTime:[NSDate date]];
                NSString *date = [NSString stringWithFormat:@"最近更新: %@",[[now description] substringToIndex:16]];
                [xxxTableView.pullToRefreshView setSubtitle:date forState:SVPullToRefreshStateAll];
                
            }
                break;
            case NotifyLoadStatusAppend:
            {
                [allNotifyList addObjectsFromArray:list];
                [xxxTableView.infiniteScrollingView stopAnimating];
            }
                break;
            default:
                break;
        }
        
        [xxxTableView reloadData];
    }
}

-(void)addObservers{
    [[PalmUIManagement sharedInstance] addObserver:self forKeyPath:@"notifyList" options:0 context:NULL];
}


- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    [self addObservers];
    
    allNotifyList = [[NSMutableArray alloc] init];
    
    self.title = @"新消息";
    
    xxxTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, 320, self.view.bounds.size.height) style:UITableViewStylePlain];
    xxxTableView.backgroundColor = [UIColor whiteColor];
    xxxTableView.dataSource = self;
    xxxTableView.delegate = self;
    [self.view addSubview:xxxTableView];
    [xxxTableView reloadData];
    
    
    // 刷新
    [xxxTableView addPullToRefreshWithActionHandler:^{
        
        loadStatus = NotifyLoadStatusRefresh;
        [[PalmUIManagement sharedInstance] getNotiList:0 withLimit:30];

    }];
    
    // 追加
    [xxxTableView addInfiniteScrollingWithActionHandler:^{
        
        loadStatus = NotifyLoadStatusAppend;
        
        [[PalmUIManagement sharedInstance] getNotiList:[allNotifyList count] withLimit:30];
        
    }];
    
    [xxxTableView triggerPullToRefresh];
    
}

#pragma mark - UITableViewDatasource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [allNotifyList count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellIdentifier = @"defCell";
    
    BBXXXTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if (!cell) {
        cell = [[BBXXXTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    [cell setData:allNotifyList[indexPath.row]];
    return cell;
}

#pragma mark - UITableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 100;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
