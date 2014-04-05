
#import "BBFZYViewController.h"

@interface BBFZYViewController ()

@property (nonatomic,strong) NSString *placeholder;

@property BOOL hasClazz;

@end

@implementation BBFZYViewController


-(void)setStyle:(int)style{

    _style = style;
    
    switch (_style) {
        case 0:
            //
            _hasClazz = YES;
            _placeholder = @"作业内容...";
            self.title = @"发作业";
            break;
        case 1:
            //
            _placeholder = @"通知内容...";
            self.title = @"发作通知";
            break;
        case 2:
            //
            _placeholder = @"说点赞美话...";
            self.title = @"拍表现";
            break;
        case 3:
            //
            _placeholder = @"分享新鲜事...";
            self.title = @"随便说";
            break;
        default:
            break;
    }
}

-(void)loading{

    sleep(3);
    [self.navigationController popViewControllerAnimated:YES];
}

-(void)rightBarButtonTaped:(id)sender{
    [self showWhileExecuting:@selector(loading) withText:@"发送" withDetailText:@"正在发送..."];
}

-(void)kemuButtonTaped:(id)sender{

    BBXKMViewController *xkm = [[BBXKMViewController alloc] init];
    xkm.selectedIndex = _selectedIndex;
    xkm.xkmDelegate = self;
    [self.navigationController pushViewController:xkm animated:YES];
}

-(void)kejianButtonTaped:(id)sender{

}

-(void)imageButtonTaped:(id)sender{
    [thingsTextView resignFirstResponder];
}

-(void)imagePickerButtonTaped:(id)sender{

    if (selectCount<7) {
        UIActionSheet *sheet = [[UIActionSheet alloc] initWithTitle:@"选择" delegate:self cancelButtonTitle:@"取消" destructiveButtonTitle:nil otherButtonTitles:@"拍照",@"相册", nil];
        [sheet showInView:self.view];
    }
}

-(id)init{

    self = [super init];
    if (self) {
        _hasClazz = NO;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    //self.title = @"发作业";
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAction target:self action:@selector(rightBarButtonTaped:)];
    
    
    kmList = @[@"不指定科目",@"语文",@"数学",@"英语",@"体育",@"自然科学",@"其它"];
    
    UIView *textBack = [[UIView alloc] initWithFrame:CGRectMake(15, 15, 320-30, 70)];
    [self.view addSubview:textBack];
    CALayer *roundedLayer0 = [textBack layer];
    [roundedLayer0 setMasksToBounds:YES];
    roundedLayer0.cornerRadius = 8.0;
    roundedLayer0.borderWidth = 1;
    roundedLayer0.borderColor = [[UIColor lightGrayColor] CGColor];
    
    thingsTextView = [[UIPlaceHolderTextView alloc] initWithFrame:CGRectMake(20, 20, 320-40, 60)];
    [self.view addSubview:thingsTextView];
    thingsTextView.placeholder = _placeholder;
    thingsTextView.backgroundColor = [UIColor clearColor];
    
    UIView *imageBack = [[UIView alloc] initWithFrame:CGRectMake(15, 95, 320-30, 140)];
    [self.view addSubview:imageBack];
    CALayer *roundedLayer2 = [imageBack layer];
    [roundedLayer2 setMasksToBounds:YES];
    roundedLayer2.cornerRadius = 8.0;
    roundedLayer2.borderWidth = 1;
    roundedLayer2.borderColor = [[UIColor lightGrayColor] CGColor];
    
    for (int i = 0; i<8; i++) {
        imageButton[i] = [UIButton buttonWithType:UIButtonTypeCustom];
        imageButton[i].frame = CGRectMake(35+i*65, 105, 55, 55);
        
        if (i>3) {
            imageButton[i].frame = CGRectMake(35+(i-4)*65, 105+65, 55, 55);
        }
        
        imageButton[i].backgroundColor = [UIColor colorWithRed:0.5 green:0.5 blue:0.5 alpha:0.5];
        [self.view addSubview:imageButton[i]];
        
        if (i<7) {
            [imageButton[i] addTarget:self action:@selector(imageButtonTaped:) forControlEvents:UIControlEventTouchUpInside];
        }else{
        
            [imageButton[i] setBackgroundImage:[UIImage imageNamed:@"BBSendAddImage"] forState:UIControlStateNormal];
            [imageButton[i] addTarget:self action:@selector(imagePickerButtonTaped:) forControlEvents:UIControlEventTouchUpInside];
        }
    }
    
    kemuButton = [UIButton buttonWithType:UIButtonTypeCustom];
    //kemuButton.backgroundColor = [UIColor brownColor];
    kemuButton.frame = CGRectMake(15, 245, 320-30, 50);
    [kemuButton addTarget:self action:@selector(kemuButtonTaped:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:kemuButton];
    
    CALayer *roundedLayer = [kemuButton layer];
    [roundedLayer setMasksToBounds:YES];
    roundedLayer.cornerRadius = 8.0;
    roundedLayer.borderWidth = 1;
    roundedLayer.borderColor = [[UIColor lightGrayColor] CGColor];
    
    UILabel *label1 = [[UILabel alloc] initWithFrame:CGRectMake(10, 0, 80, 50)];
    [kemuButton addSubview:label1];
    label1.text = @"科目";
    label1.font = [UIFont boldSystemFontOfSize:18];
    
    kemuLabel = [[UILabel alloc] initWithFrame:CGRectMake(320-30-100-30, 0, 100, 50)];
    kemuLabel.textColor = [UIColor colorWithHexString:@"#4a7f9d"];
    kemuLabel.textAlignment = NSTextAlignmentRight;
    [kemuButton addSubview:kemuLabel];
    kemuLabel.text = kmList[0];
    
//    kejianButton = [UIButton buttonWithType:UIButtonTypeCustom];
//    //kemuButton.backgroundColor = [UIColor brownColor];
//    kejianButton.frame = CGRectMake(15, 245+60, 320-30, 50);
//    [kejianButton addTarget:self action:@selector(kejianButtonTaped:) forControlEvents:UIControlEventTouchUpInside];
//    [self.view addSubview:kejianButton];
//    
//    CALayer *roundedLayer1 = [kejianButton layer];
//    [roundedLayer1 setMasksToBounds:YES];
//    roundedLayer1.cornerRadius = 8.0;
//    roundedLayer1.borderWidth = 1;
//    roundedLayer1.borderColor = [[UIColor lightGrayColor] CGColor];
//    
//    UILabel *label2 = [[UILabel alloc] initWithFrame:CGRectMake(10, 0, 80, 50)];
//    [kejianButton addSubview:label2];
//    label2.text = @"可见范围";
//    label2.font = [UIFont boldSystemFontOfSize:18];
//    
//    kejianLabel = [[UILabel alloc] initWithFrame:CGRectMake(320-30-100-30, 0, 100, 50)];
//    kejianLabel.textColor = [UIColor blueColor];
//    kejianLabel.textAlignment = NSTextAlignmentRight;
//    [kejianButton addSubview:kejianLabel];
//    kejianLabel.text = @"公开";
    
    if (!_hasClazz) {
        kejianButton.frame = kemuButton.frame;
        [kemuButton removeFromSuperview];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)bbXKMViewController:(BBXKMViewController *)controller didSelectedIndex:(int)index{

    NSLog(@"");
    
    _selectedIndex = index;
    
    kemuLabel.text = kmList[_selectedIndex];
}

-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event{

    [thingsTextView resignFirstResponder];
}

- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex{
    
    UIImagePickerController *imagePicker = [[UIImagePickerController alloc] init];
    imagePicker.delegate = self;
    
    switch (buttonIndex) {
        case 0:
            //
        {
            if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]){
                imagePicker.sourceType = UIImagePickerControllerSourceTypeCamera;
            }else{
                imagePicker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
            }
            
            [self presentViewController:imagePicker animated: YES completion:^{
                //
            }];
        }
            break;
        case 1:
            //
            
        {
            if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypePhotoLibrary]){
                imagePicker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
            }
            [self presentViewController:imagePicker animated: YES completion:^{
                //
            }];
        }
            
            break;
        case 2:
            //
            
            break;
        default:
            break;
    }
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info{
    NSString *mediaType = [info objectForKey:UIImagePickerControllerMediaType];
    UIImage *image = nil;
    if ([mediaType isEqualToString:@"public.image"]){
        image = [info objectForKey:UIImagePickerControllerOriginalImage];
    }

    if (selectCount<7) {
        [imageButton[selectCount] setBackgroundImage:image forState:UIControlStateNormal];
        selectCount++;
    }
    
    [self dismissModalViewControllerAnimated:YES];
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker{
    [self dismissModalViewControllerAnimated:YES];

}

@end
