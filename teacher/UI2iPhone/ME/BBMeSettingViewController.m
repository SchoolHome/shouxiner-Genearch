//
//  BBMeSettingViewController.m
//  teacher
//
//  Created by mac on 14/11/11.
//  Copyright (c) 2014年 ws. All rights reserved.
//

#import "BBMeSettingViewController.h"
#import "BBMeWebViewController.h"
@interface BBMeSettingViewController ()
{
    NSArray *settingList;
    UITableView *tbvSetting;
}
@end

@implementation BBMeSettingViewController

-(id)init
{
    self = [super init];
    if (self) {
        
    }
    return self;
}

-(void)loadView
{
    [super loadView];
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.title = @"设置";
    
    UIButton *back = [UIButton buttonWithType:UIButtonTypeCustom];
    [back setFrame:CGRectMake(0.f, 7.f, 22.f, 22.f)];
    [back setBackgroundImage:[UIImage imageNamed:@"back.png"] forState:UIControlStateNormal];
    [back addTarget:self action:@selector(backViewController) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:back];
    
    settingList = [[NSArray alloc] initWithObjects:[NSArray arrayWithObjects:[NSDictionary dictionaryWithObjectsAndKeys:@"响铃提示", @"title", @"ring.png", @"icon", nil],
                                                    [NSDictionary dictionaryWithObjectsAndKeys:@"震动提示", @"title", @"activity-stream.png", @"icon", nil], nil],
                   [NSArray arrayWithObjects: [NSDictionary dictionaryWithObjectsAndKeys:@"软件更新", @"title", @"", @"url", @"checkversion.png", @"icon", nil], [NSDictionary dictionaryWithObjectsAndKeys:@"帮助中心", @"title", @"http://www.shouxiner.com/res/mobilemall/helpl.html", @"url", @"help.png", @"icon", nil], [NSDictionary dictionaryWithObjectsAndKeys:@"反馈建议", @"title", @"http://www.shouxiner.com/advicebox/mobile_web_advice", @"url", @"file.png", @"icon", nil], [NSDictionary dictionaryWithObjectsAndKeys:@"关于手心", @"title", @"", @"ulr", @"about.png", @"icon",nil] ,nil],
                   nil];
    
    tbvSetting = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.screenHeight-44) style:UITableViewStyleGrouped];
    [tbvSetting setRowHeight:44];
    [tbvSetting setScrollEnabled:NO];
    [tbvSetting setDelegate:(id<UITableViewDelegate>)self];
    [tbvSetting setDataSource:(id<UITableViewDataSource>)self];
    UIView *backgroundView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, tbvSetting.frame.size.width, tbvSetting.frame.size.height)];
    [backgroundView setBackgroundColor:[UIColor colorWithRed:242.f/255.f green:242.f/255.f blue:242.f/255.f alpha:1.0f]];
    [tbvSetting setBackgroundView:backgroundView];
    backgroundView = nil;
    [self.view addSubview:tbvSetting];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return [settingList count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [[settingList objectAtIndex:section] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath;
{
    static NSString *SettingCell = @"SettingCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:SettingCell];
    if (nil ==cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:SettingCell];
    }
    if (indexPath.section == 0) {
        [cell setAccessoryType:UITableViewCellAccessoryNone];
        [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    }else{
        [cell setAccessoryType:UITableViewCellAccessoryDisclosureIndicator];
        [cell setSelectionStyle:UITableViewCellSelectionStyleGray];
    }
    NSDictionary *infoDic = [[settingList objectAtIndex:indexPath.section] objectAtIndex:indexPath.row];
    [cell.textLabel setFont:[UIFont systemFontOfSize:16.f]];
    [cell.textLabel setText:[infoDic objectForKey:@"title"]];
    [cell.imageView setImage:[UIImage imageNamed:[infoDic objectForKey:@"icon"]]];
    if (indexPath.section == 0) {
        CPLGModelAccount *account = [[CPSystemEngine sharedInstance] accountModel];
        NSUserDefaults *userDefault = [NSUserDefaults standardUserDefaults];
        BOOL isVibrantion = [[userDefault objectForKey:[NSString stringWithFormat:@"%@_Vibration", account.uid]] boolValue];
        BOOL isRingalert = [[userDefault objectForKey:[NSString stringWithFormat:@"%@_Ringalert", account.uid]] boolValue];
        if (indexPath.row == 0) {
            UISwitch *vibSwith = [[UISwitch alloc] init];
            vibSwith.center = CGPointMake(cell.contentView.frame.size.width-vibSwith.frame.size.width/2-10, vibSwith.center.y+5);
            [vibSwith addTarget:self action:@selector(vibrationSwitch:) forControlEvents:UIControlEventValueChanged];
            [cell addSubview:vibSwith];
            if (isVibrantion) {
                [vibSwith setOn:YES];
            }else{
                [vibSwith setOn:NO];
            }
        }else{
            UISwitch *ringSwith = [[UISwitch alloc] init];
            ringSwith.center = CGPointMake(cell.contentView.frame.size.width-ringSwith.frame.size.width/2-10, ringSwith.center.y+5);
            [ringSwith addTarget:self action:@selector(alertSwitch:) forControlEvents:UIControlEventValueChanged];
            [cell addSubview:ringSwith];
            if (isRingalert) {
                [ringSwith setOn:YES];
            }else{
                [ringSwith setOn:NO];
            }
        }
    }
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 1) {
        NSArray *infoArr = [settingList objectAtIndex:indexPath.section];
        NSDictionary *dic = [infoArr objectAtIndex:indexPath.row];
        if (indexPath.row == 0) {
            //更新
            [[PalmUIManagement sharedInstance] postCheckVersion];
        }else{
            BBMeWebViewController *viewController = [[BBMeWebViewController alloc] init];
            viewController.url = [NSURL URLWithString:[dic objectForKey:@"url"]];
            viewController.isHiddenHeader = NO;
            [viewController.navigationItem setTitle:[dic objectForKey:@"title"]];
            [self.navigationController pushViewController:viewController animated:YES];
        }
    }
}

-(void)vibrationSwitch:(UISwitch *)_switch
{
    BOOL isOn = YES;
    if (_switch.on) {
        isOn = YES;
    }else{
        isOn = NO;
    }
    CPLGModelAccount *account = [[CPSystemEngine sharedInstance] accountModel];
    NSUserDefaults *userDefault = [NSUserDefaults standardUserDefaults];
    NSString *key = [NSString stringWithFormat:@"%@_Vibration", account.uid];
    [userDefault setObject:[NSNumber numberWithBool:isOn] forKey:key];
    [userDefault synchronize];
}

-(void)alertSwitch:(UISwitch *)_switch
{
    BOOL isOn = YES;
    if (_switch.on) {
        isOn = YES;
    }else{
        isOn = NO;
    }
    CPLGModelAccount *account = [[CPSystemEngine sharedInstance] accountModel];
    NSUserDefaults *userDefault = [NSUserDefaults standardUserDefaults];
    NSString *key = [NSString stringWithFormat:@"%@_Ringalert", account.uid];
    [userDefault setObject:[NSNumber numberWithBool:isOn] forKey:key];
    [userDefault synchronize];
}

-(void)backViewController
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
