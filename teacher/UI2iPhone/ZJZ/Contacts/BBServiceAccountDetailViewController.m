//
//  BBServiceAccountDetailViewController.m
//  teacher
//
//  Created by ZhangQing on 14-11-20.
//  Copyright (c) 2014年 ws. All rights reserved.
//

#import "BBServiceAccountDetailViewController.h"

#import "CPDBManagement.h"

#import "EGOImageView.h"

@interface BBServiceAccountDetailViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic, strong)BBServiceAccountModel *model;
@end

@implementation BBServiceAccountDetailViewController


- (id)initWithModel:(BBServiceAccountModel *)serviceAccountmodel
{
    self = [super init];
    if (self) {
        self.model = serviceAccountmodel;
    }
    return self;

}



- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"详情";
    
    self.view.backgroundColor = [UIColor colorWithHexString:@"#f2f2f2"];
    
    UIButton *backButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [backButton setFrame:CGRectMake(0.f, 7.f, 24.f, 24.f)];
    [backButton setBackgroundImage:[UIImage imageNamed:@"back"] forState:UIControlStateNormal];
    [backButton addTarget:self action:@selector(backButtonTaped) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:backButton];
    
    UIView *tableviewHeaderView = [[UIView alloc] initWithFrame:CGRectMake(0.f, 0.f, self.screenWidth, 90.f)];
    
     EGOImageView *accountHead = [[EGOImageView alloc] initWithFrame:CGRectMake(10.f, 10.f, 70.f, 70.f)];
    [accountHead setPlaceholderImage:[UIImage imageNamed:@"girl"]];
    [accountHead setImageURL:[NSURL URLWithString:self.model.accountLogo]];
    accountHead.layer.masksToBounds = YES;
    accountHead.layer.cornerRadius = 35.f;
    accountHead.layer.borderColor = [[UIColor whiteColor] CGColor];
    accountHead.layer.borderWidth = 2.f;

    [tableviewHeaderView addSubview:accountHead];
    
    UILabel *accountName = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(accountHead.frame)+16.f, CGRectGetMidY(accountHead.frame)-12.f,self.screenWidth-CGRectGetMaxX(accountHead.frame)-10.f , 24.f)];
    accountName.text = self.model.accountName;
    accountName.backgroundColor = [UIColor clearColor];
    [tableviewHeaderView addSubview:accountName];
    /*
    UIView *tableviewFootView = [[UIView alloc] initWithFrame:CGRectMake(0.f, 0.f, self.screenWidth, 50.f)];
    
    UIButton *checkMessage = [UIButton buttonWithType:UIButtonTypeCustom];
    [checkMessage setFrame:CGRectMake(CGRectGetMidX(tableviewFootView.frame)-280/2, 4.f, 280, 44.f)];
    [checkMessage addTarget:self action:@selector(beginCheckMessage) forControlEvents:UIControlEventTouchUpInside];
    [checkMessage setBackgroundImage:[UIImage imageNamed:@"button_view_mes"] forState:UIControlStateNormal];
    [tableviewFootView  addSubview:checkMessage];
    */
    
    UITableView *tableview = [[UITableView alloc] initWithFrame:CGRectMake(0.f, 0.f, self.screenWidth, self.screenHeight-40.f) style:UITableViewStyleGrouped];
    tableview.scrollEnabled = NO;
    tableview.delegate = self;
    tableview.dataSource = self;
    tableview.backgroundColor = [UIColor clearColor];
    tableview.tableHeaderView = tableviewHeaderView;
    tableview.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
    [self.view addSubview:tableview];
    // Do any additional setup after loading the view.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)backButtonTaped
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)beginCheckMessage
{

}
#pragma mark - UITableview
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CGSize strSize = [self.model.accountIntraduction sizeWithFont:[UIFont boldSystemFontOfSize:14.f] constrainedToSize:CGSizeMake(180.f, 800.f)];
    if (strSize.height < 60) return 60;
    else return strSize.height;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue2 reuseIdentifier:@"cellIden"];
    cell.textLabel.text = @"功能介绍";
    cell.textLabel.textAlignment  = NSTextAlignmentCenter;
    cell.userInteractionEnabled = NO;
    cell.contentView.backgroundColor = [UIColor whiteColor];
    cell.backgroundColor = [UIColor clearColor];
    cell.textLabel.textColor = [UIColor lightGrayColor];
    cell.detailTextLabel.numberOfLines = 100;
    cell.detailTextLabel.font = [UIFont systemFontOfSize:12.f];
    cell.detailTextLabel.text = self.model.accountIntraduction;
    cell.detailTextLabel.textAlignment = NSTextAlignmentLeft;
    cell.detailTextLabel.textColor = [UIColor lightGrayColor];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
