//
//  BBYZSViewController.m
//  BBTeacher
//
//  Created by xxx on 14-3-5.
//  Copyright (c) 2014年 xxx. All rights reserved.
//

#import "BBYZSViewController.h"
#import "BBOAModel.h"

@interface BBYZSViewController ()
@property (nonatomic,strong) NSMutableArray *oalist;
@property (nonatomic,strong) BBOASumModel *dataSource;
@end

@implementation BBYZSViewController

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context{
    if ([@"notiList" isEqualToString:keyPath])
    {
        NSDictionary *jsonData = [[PalmUIManagement sharedInstance].notiList objectForKey:ASI_REQUEST_DATA];
        jsonData = [jsonData objectForKey:@"list"];
        
        NSArray *allvalues = [jsonData allValues];
        for (int i =0; i<[allvalues count]; i++) {
            BBOAModel *oa = [[BBOAModel alloc] init];
            [oa conver:allvalues[i]];
            [self.oalist addObject:oa];
        }
        [self.dataSource updateCacheArray:self.oalist];
        [yzsTableView reloadData];
    }
}

-(void)addObservers{
    [[PalmUIManagement sharedInstance] addObserver:self forKeyPath:@"notiList" options:0 context:NULL];
}

-(void)removeObservers{

    [[PalmUIManagement sharedInstance] removeObserver:self forKeyPath:@"notiList"];
}

-(void)viewWillAppear:(BOOL)animated{

    [super viewWillAppear:animated];
    [self addObservers];
}

-(void)viewWillDisappear:(BOOL)animated{
    
    [super viewWillDisappear:animated];
    [self removeObservers];
}


- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    self.dataSource = [PalmUIModelCoding deserializeModel:CacheName];
    if (self.dataSource == nil) {
        self.dataSource = [[BBOASumModel alloc] init];
    }
    
    
    self.navigationItem.title = @"有通知";
    
    int heightFix = 20;
    if (IOS7) {
        heightFix = 20;
    }else{
        heightFix = 0;
    }
    
    yzsTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, 320, self.view.bounds.size.height-heightFix-49-44) style:UITableViewStylePlain];
    yzsTableView.dataSource = self;
    yzsTableView.delegate = self;
    [self.view addSubview:yzsTableView];
    
    yzsTableView.backgroundColor = [UIColor clearColor];
    
    self.oalist = [[NSMutableArray alloc] init];
    
    [[PalmUIManagement sharedInstance] getNotiData:1];
    
//    [[PalmUIManagement sharedInstance] getNotiListWithSender:1 withOffset:0 withLimit:30];
}


#pragma mark - UITableViewDatasource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.dataSource.cacheArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellIdentifier = @"defCell";
    
    BBIndicationTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (!cell) {
        cell = [[BBIndicationTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
        //cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    
    [cell setData:self.dataSource.cacheArray[indexPath.row]];
    return cell;
}

#pragma mark - UITableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 60;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    BBYZSDetailViewController *content = [[BBYZSDetailViewController alloc] init];
    content.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:content animated:YES];
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
