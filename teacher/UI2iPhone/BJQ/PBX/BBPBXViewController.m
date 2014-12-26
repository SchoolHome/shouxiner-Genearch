

#import "BBPBXViewController.h"
#import "ZYQAssetPickerController.h"
#import "ViewImageViewController.h"
#import "UIPlaceHolderTextView.h"
#import "BBStudentsListViewController.h"
#import "BBStudentModel.h"
@interface BBPBXViewController ()<ZYQAssetPickerControllerDelegate,viewImageDeletedDelegate>
{
    UIPlaceHolderTextView *thingsTextView;
    UIButton *imageButton[8];
    UILabel *studentList;
    UILabel *reCommendedList;
    
    int selectCount;
    int imageCount;
    
}
@property (nonatomic, strong)NSMutableArray *attachList;
@property (nonatomic, strong)ReachTouchScrollview *contentScrollview;
@end

@implementation BBPBXViewController
-(NSMutableArray *)attachList
{
    if (!_attachList) {
        _attachList = [[NSMutableArray alloc] init];
    }
    return _attachList;
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"拍表现";
    
    //取消发送按钮
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"取消" style:UIBarButtonItemStyleBordered target:self action:@selector(cancel)];
    self.navigationItem.leftBarButtonItem.tintColor = [UIColor whiteColor];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"发送" style:UIBarButtonItemStyleBordered target:self action:@selector(send)];
    self.navigationItem.rightBarButtonItem.tintColor = [UIColor whiteColor];
    
    
    
    _contentScrollview = [[ReachTouchScrollview alloc] initWithFrame:CGRectMake(0.f, 0.f, 320.f, self.view.bounds.size.height-40.f)];
    _contentScrollview.touchDelegate = self;
    _contentScrollview.showsVerticalScrollIndicator = NO;
    _contentScrollview.backgroundColor = [UIColor clearColor];
    [self.view addSubview:_contentScrollview];
    
    //学生列表
    UIView *listBack = [[UIView alloc] initWithFrame:CGRectMake(15.f, 15.f, 320-30.f, 40.f)];
    listBack.tag = 1001;
    [_contentScrollview addSubview:listBack];
    
    CALayer *roundedLayerList = [listBack layer];
    [roundedLayerList setMasksToBounds:YES];
    roundedLayerList.cornerRadius = 8.0;
    roundedLayerList.borderWidth = 1;
    roundedLayerList.borderColor = [[UIColor lightGrayColor] CGColor];
    
    UIButton *turnStudentList = [UIButton buttonWithType:UIButtonTypeCustom];
    [turnStudentList setFrame:CGRectMake(5, 5, 320-40, 30)];
    [turnStudentList addTarget:self action:@selector(turnStudentList) forControlEvents:UIControlEventTouchUpInside];
    turnStudentList.titleLabel.textAlignment = NSTextAlignmentLeft;
    [listBack addSubview:turnStudentList];
    
    studentList = [[UILabel alloc] initWithFrame:CGRectMake(5.f, 5.f, 190, 20.f)];
    studentList.backgroundColor = [UIColor clearColor];
    studentList.text = @"@:发小红花,可不选...";
    studentList.numberOfLines = 20;
    studentList.font = [UIFont boldSystemFontOfSize:14.f];
    studentList.textColor = [UIColor colorWithRed:131/255.f green:131/255.f blue:131/255.f alpha:1.f];
    [turnStudentList addSubview:studentList];
    
    UILabel *studentListTitle = [[UILabel alloc] initWithFrame:CGRectMake(195.f, 5.f, 70, 20.f)];
    studentListTitle.backgroundColor = [UIColor clearColor];
    studentListTitle.text = @"学生列表 >";
    studentListTitle.textAlignment = NSTextAlignmentRight;
    studentListTitle.font = [UIFont boldSystemFontOfSize:14.f];
    studentListTitle.textColor = [UIColor colorWithRed:131/255.f green:131/255.f blue:131/255.f alpha:1.f];
    [turnStudentList addSubview:studentListTitle];
    
    //说赞美的话
    UIView *textBack = [[UIView alloc] initWithFrame:CGRectMake(15, listBack.frame.origin.y+listBack.frame.size.height+10, 320-30, 70)];
    [_contentScrollview addSubview:textBack];
    
    CALayer *roundedLayer0 = [textBack layer];
    [roundedLayer0 setMasksToBounds:YES];
    roundedLayer0.cornerRadius = 8.0;
    roundedLayer0.borderWidth = 1;
    roundedLayer0.borderColor = [[UIColor lightGrayColor] CGColor];
    
    thingsTextView = [[UIPlaceHolderTextView alloc] initWithFrame:CGRectMake(5, 5, 320-40, 60)];
    [textBack addSubview:thingsTextView];
    thingsTextView.font = [UIFont boldSystemFontOfSize:14.f];
    thingsTextView.placeholder = @"说点赞美话...";
    thingsTextView.backgroundColor = [UIColor clearColor];
    


    //选择图片
    UIView *imageBack = [[UIView alloc] initWithFrame:CGRectMake(15,textBack.frame.origin.y+textBack.frame.size.height+10, 320-30, 140)];
    [_contentScrollview addSubview:imageBack];
    CALayer *roundedLayer2 = [imageBack layer];
    [roundedLayer2 setMasksToBounds:YES];
    roundedLayer2.cornerRadius = 8.0;
    roundedLayer2.borderWidth = 1;
    roundedLayer2.borderColor = [[UIColor lightGrayColor] CGColor];
    
    

        
        for (int i = 0; i<8; i++) {
            imageButton[i] = [UIButton buttonWithType:UIButtonTypeCustom];
            imageButton[i].frame = CGRectMake(20+i*65, 10, 55, 55);
            
            if (i>3) {
                imageButton[i].frame = CGRectMake(20+(i-4)*65, 10+65, 55, 55);
            }
            
            imageButton[i].backgroundColor = [UIColor colorWithRed:0.5 green:0.5 blue:0.5 alpha:0.5];
            [imageBack addSubview:imageButton[i]];
            
            if (i<7) {
                [imageButton[i] addTarget:self action:@selector(imageButtonTaped:) forControlEvents:UIControlEventTouchUpInside];
                imageButton[i].tag = i;
            }else{
                
                [imageButton[i] setBackgroundImage:[UIImage imageNamed:@"BBSendAddImage"] forState:UIControlStateNormal];
                [imageButton[i] addTarget:self action:@selector(imagePickerButtonTaped:) forControlEvents:UIControlEventTouchUpInside];
            }
        }
    
    //推荐到
    UIView *reCommendedBack = [[UIView alloc] initWithFrame:CGRectMake(15,imageBack.frame.origin.y+imageBack.frame.size.height+10, 320-30, 40)];
    [_contentScrollview addSubview:reCommendedBack];
    CALayer *roundedLayer3 = [reCommendedBack layer];
    [roundedLayer3 setMasksToBounds:YES];
    roundedLayer3.cornerRadius = 8.0;
    roundedLayer3.borderWidth = 1;
    roundedLayer3.borderColor = [[UIColor lightGrayColor] CGColor];
    
    UIButton *turnReCommendedList = [UIButton buttonWithType:UIButtonTypeCustom];
    [turnReCommendedList setFrame:CGRectMake(5, 5, 320-40, 30)];
    [turnReCommendedList addTarget:self action:@selector(turnReCommendedList) forControlEvents:UIControlEventTouchUpInside];
    [reCommendedBack addSubview:turnReCommendedList];
    
    reCommendedList = [[UILabel alloc] initWithFrame:CGRectMake(5.f, 5.f, 200, 20.f)];
    reCommendedList.backgroundColor = [UIColor clearColor];
    reCommendedList.text = @"推荐到:可不选...";
    reCommendedList.font = [UIFont boldSystemFontOfSize:14.f];
    reCommendedList.textColor = [UIColor colorWithRed:131/255.f green:131/255.f blue:131/255.f alpha:1.f];
    [turnReCommendedList addSubview:reCommendedList];
    
    UILabel *reCommendedListTitle = [[UILabel alloc] initWithFrame:CGRectMake(205.f, 5.f, 60, 20.f)];
    reCommendedListTitle.backgroundColor = [UIColor clearColor];
    reCommendedListTitle.text = @"范围 >";
    reCommendedListTitle.textAlignment = NSTextAlignmentRight;
    reCommendedListTitle.font = [UIFont boldSystemFontOfSize:14.f];
    reCommendedListTitle.textColor = [UIColor colorWithRed:131/255.f green:131/255.f blue:131/255.f alpha:1.f];
    [turnReCommendedList addSubview:reCommendedListTitle];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(receiveSeletedStudentList:) name:@"SelectedStudentList" object:nil];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)viewWillAppear:(BOOL)animated
{

}
-(void)viewDidDisappear:(BOOL)animated
{
    
}


#pragma mark NavAction
-(void)cancel
{
    [self.navigationController popViewControllerAnimated:YES];
}
-(void)send
{
    
}


#pragma mark ViewControllerMethod
-(void)receiveSeletedStudentList:(NSNotification *)noti
{
    NSArray *selectedStudents = (NSArray *)[noti object];
    NSMutableString *studentListText = [NSMutableString string];
    for ( int i = 0; i< selectedStudents.count; i++) {
        BBStudentModel *tempModel = [selectedStudents objectAtIndex:i];
        if (i == 0) {
            studentListText = [NSMutableString stringWithString:[studentListText stringByAppendingFormat:@"@:%@",tempModel.studentName]];
        }else
        {
            studentListText = [NSMutableString stringWithString:[studentListText stringByAppendingFormat:@"、%@",tempModel.studentName]];
        }

    }
    NSLog(@"%d",studentListText.length);
    for (int i = 15; i<studentListText.length; i++) {
        if (i % 15 == 0) {
            [studentListText insertString:@"\n" atIndex:i];
        }
        
    }
    
    //CGSize strSize = [studentListText sizeWithFont:[UIFont boldSystemFontOfSize:14.f] forWidth:190.f lineBreakMode:UILineBreakModeWordWrap];
    CGSize strSize = [studentListText sizeWithFont:[UIFont boldSystemFontOfSize:14.f] constrainedToSize:CGSizeMake(190.f, 400.f)];
    CGRect tempStudentListFrame = studentList.frame;
    tempStudentListFrame.size.height = strSize.height;
    studentList.frame = tempStudentListFrame;
    
    studentList.text = studentListText;
    
    
    NSInteger offsetY ;
    for (UIView *tempView in self.contentScrollview.subviews) {
        if (tempView.tag == 1001) {
            NSInteger tempViewHeight = tempView.frame.size.height;
            CGRect tempViewFrame = tempView.frame;
            tempViewFrame.size.height = strSize.height + 20;
            tempView.frame = tempViewFrame;
            offsetY = tempView.frame.size.height - tempViewHeight;
        }else
        {
            
            tempView.center = CGPointMake(tempView.center.x, tempView.center.y+offsetY);
        }
    }
}
-(void)turnStudentList
{
    BBStudentsListViewController *studentListVC = [[BBStudentsListViewController alloc] init];
    //[studentList setStudentList:nil];
    [self.navigationController pushViewController:studentListVC animated:YES];
}
-(void)turnReCommendedList
{
    
}
-(void)imageButtonTaped:(id)sender{
    [thingsTextView resignFirstResponder];
    
    int tag = ((UIButton*)sender).tag;
    UIImage *temp = [imageButton[tag] backgroundImageForState:UIControlStateNormal];
    if (!temp) {
        return;
    }
    
    NSMutableArray *images = [[NSMutableArray alloc] init];
    

        for (int i = 0; i<7; i++) {
            UIImage *image = [imageButton[i] backgroundImageForState:UIControlStateNormal];
            if (image) {
                [images addObject:image];
            }
        }
    
    ViewImageViewController *imagesVC = [[ViewImageViewController alloc] initViewImageVC:images withSelectedIndex:tag];
    imagesVC.delegate = self;
    [self.navigationController pushViewController:imagesVC animated:YES];
}

-(void)imagePickerButtonTaped:(id)sender{
    if (selectCount<7) {
        UIActionSheet *sheet = [[UIActionSheet alloc] initWithTitle:@"选择" delegate:self cancelButtonTitle:@"取消" destructiveButtonTitle:nil otherButtonTitles:@"拍照",@"相册", nil];
        [sheet showInView:self.view];
    }

}


#pragma mark - ReachTouchScrolviewDelegate
-(void)scrollviewTouched
{
    [thingsTextView resignFirstResponder];
}


#pragma mark - ActionSheet
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

            if (selectCount >= 7) {
                return;
            }

            ZYQAssetPickerController *picker = [[ZYQAssetPickerController alloc] init];
            picker.maximumNumberOfSelection = 7 - selectCount;
            picker.assetsFilter = [ALAssetsFilter allPhotos];
            picker.showEmptyGroups=NO;
            picker.delegate=self;
            picker.selectionFilter = [NSPredicate predicateWithBlock:^BOOL(id evaluatedObject, NSDictionary *bindings) {
                if ([[(ALAsset*)evaluatedObject valueForProperty:ALAssetPropertyType] isEqual:ALAssetTypeVideo]) {
                    NSTimeInterval duration = [[(ALAsset*)evaluatedObject valueForProperty:ALAssetPropertyDuration] doubleValue];
                    return duration >= 5;
                } else {
                    return YES;
                }
            }];
            
            [self presentViewController:picker animated:YES completion:NULL];

        }
            
            break;
        case 2:
            //
            
            break;
        default:
            break;
    }
}


#pragma mark - ViewImageVC Delegate
-(void) delectedIndex:(int)index{
    [imageButton[index] setBackgroundImage:nil forState:UIControlStateNormal];
}
-(void) reloadView{
    NSMutableArray *images = [[NSMutableArray alloc] init];

        for (int i = 0; i<7; i++) {
            UIImage *image = [imageButton[i] backgroundImageForState:UIControlStateNormal];
            if (image) {
                [images addObject:image];
                [imageButton[i] setBackgroundImage:nil forState:UIControlStateNormal];
            }
        }
    
    for (int i = 0; i<[images count]; i++) {
        [imageButton[i] setBackgroundImage:[images objectAtIndex:i] forState:UIControlStateNormal];
    }
    selectCount = [images count];
}


#pragma mark - Assets Picker Delegate
-(void)assetPickerController:(ZYQAssetPickerController *)picker didFinishPickingAssets:(NSArray *)assets{
    for (int i = 0; i<[assets count]; i++) {
        ALAsset *asset = [assets objectAtIndex:i];
        [imageButton[selectCount] setBackgroundImage:[UIImage imageWithCGImage:[[asset defaultRepresentation] fullScreenImage]] forState:UIControlStateNormal];
        selectCount++;
    }
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info{
    NSString *mediaType = [info objectForKey:UIImagePickerControllerMediaType];
    UIImage *image = nil;
    if ([mediaType isEqualToString:@"public.image"]){
        image = [info objectForKey:UIImagePickerControllerOriginalImage];
    }
    
    NSData *data = UIImageJPEGRepresentation(image, 0.6f);
    image = [[UIImage alloc] initWithData:data];

        if (selectCount<7) {
            [imageButton[selectCount] setBackgroundImage:image forState:UIControlStateNormal];
            selectCount++;
        }
    
    
    [self dismissModalViewControllerAnimated:YES];
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker{
    [self dismissModalViewControllerAnimated:YES];
    
}

-(UIImage*)imageWithImage:(UIImage*)image
{
	CGSize newSize = CGSizeMake(image.size.width*0.3, image.size.height*0.3);
    UIGraphicsBeginImageContext(newSize);
    
    [image drawInRect:CGRectMake(0, 0, newSize.width, newSize.height)];
    UIImage* newImage = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    return newImage;
}

@end




@implementation ReachTouchScrollview

-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event{
    
    if ([self.touchDelegate respondsToSelector:@selector(scrollviewTouched)]) {
        [self.touchDelegate scrollviewTouched];
    }
}

@end