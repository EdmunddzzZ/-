//
//  NewTextViewController.m
//  随手记
//
//  Created by mac on 20/2/11.
//  Copyright © 2020年 Shanghui Wu. All rights reserved.
//

#import "NewTextViewController.h"

@interface NewTextViewController ()<UITextViewDelegate,BMKLocationAuthDelegate,BMKLocationManagerDelegate>


@end
@implementation NewTextViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor:[CreateBase createColor:245]];
    [self->topBar setBackgroundColor:[CreateBase createColor:245]];
    [self.view addSubview:self.line];
    [self->topBar setBackBtnHide:YES];
    [self.view addSubview:self.Rightbtn];
    [self.view addSubview:self.cancelbtn];
    [self.view addSubview:self.Title];
    [self.view addSubview:self.currentDate];
    [self.view addSubview:self.mainText];
    [self.view addSubview:self.locationbtn];
    [self.view addSubview:self.Locationlab];
    
    UILabel *placeholder = [self.view viewWithTag:30001];
    if(self.flag == 0)
        placeholder.hidden = NO;
    else
        placeholder.hidden = YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(UILabel *)line
{
    if(!_line)
    {
        _line = [[UILabel alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(self->topBar.frame)+1, sw, 1)];
        [_line setBackgroundColor:[UIColor grayColor]];
    }
    return _line;
}
-(UIButton *)locationbtn
{
    if(!_locationbtn)
    {
        _locationbtn = [[UIButton alloc]initWithFrame:CGRectMake(sw_(30), CGRectGetMaxY(self.mainText.frame)+sh_(20),sw_(200),sh_(30))];
        [_locationbtn setTitle:@"获取地址" forState:normal];
        [_locationbtn addTarget:self action:@selector(locationClick) forControlEvents:UIControlEventTouchUpInside];
        [_locationbtn setTitleColor:[CreateBase createColor:0 blue:147 green:249]  forState:normal];
         
        
    }
    return _locationbtn;
}
-(void)locationClick
{
    self.locationManager = [[BMKLocationManager alloc] init];
    self.locationManager.delegate = self;
    self.locationManager.coordinateType = BMKLocationCoordinateTypeBMK09LL;
    self.locationManager.distanceFilter = kCLDistanceFilterNone;
    self.locationManager.desiredAccuracy = kCLLocationAccuracyBest;
    self.locationManager.activityType = CLActivityTypeAutomotiveNavigation;
    self.locationManager.pausesLocationUpdatesAutomatically = NO;
    //locationManager.allowsBackgroundLocationUpdates = YES;
    self.locationManager.locationTimeout = 10;
    self.locationManager.reGeocodeTimeout = 10;
    
    [self.locationManager requestLocationWithReGeocode:YES withNetworkState:YES completionBlock:^(BMKLocation * _Nullable location, BMKLocationNetworkState state, NSError * _Nullable error) {
        if (error)
        {
            NSLog(@"locError:{%ld - %@};", (long)error.code, error.localizedDescription);
        }
        if (location) {//得到定位信息，添加annotation
            
//            if (location.location) {
//                NSLog(@"LOC = %@",location.location);
//            }
            if (location.rgcData) {
                UILabel *lab = [self.view viewWithTag:30003];
                lab.text = [NSString stringWithFormat:@"当前位置:%@ %@ %@ %@",location.rgcData.country,location.rgcData.province,location.rgcData.city,location.rgcData.district];
                NSLog(@"%@ %@ %@ %@",location.rgcData.country,location.rgcData.province,location.rgcData.city,location.rgcData.district);
            }
            
//            if (location.rgcData.poiList) {
//                for (BMKLocationPoi * poi in location.rgcData.poiList) {
//                    NSLog(@"poi = %@, %@, %f, %@, %@", poi.name, poi.addr, poi.relaiability, poi.tags, poi.uid);
//                }
//            }
            
            if (location.rgcData.poiRegion) {
                NSLog(@"poiregion = %@, %@, %@", location.rgcData.poiRegion.name, location.rgcData.poiRegion.tags, location.rgcData.poiRegion.directionDesc);
            }
            
        }
    }];}
-(UIButton *)Rightbtn // 完成按钮
{
    if(!_Rightbtn)
    {
        _Rightbtn = [[UIButton alloc]initWithFrame:CGRectMake(sw-sw_(100), StatusBarHeight+sh_(25), 50, 28)];
        [_Rightbtn setTitle:@"完成" forState:UIControlStateNormal];
        [_Rightbtn setTitleColor:[CreateBase createColor:0 blue:147 green:249] forState:UIControlStateNormal];
        [_Rightbtn addTarget:self action:@selector(RightbtnClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return _Rightbtn;
}
-(UILabel *)Locationlab
{
    if(!_Locationlab)
    {
        _Locationlab = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(self.locationbtn.frame),self.locationbtn.frame.origin.y, sw-CGRectGetMaxX(self.locationbtn.frame)+sw_(20), sh_(100))];
        _Locationlab.textColor = [UIColor blackColor];
        _Locationlab.tag = 30003;
        _Locationlab.font = self.currentDate.font;
        _Locationlab.numberOfLines = 0;
        _Locationlab.text = @"";
    }
    return  _Locationlab;
}
-(UIButton *)cancelbtn
{
    if(!_cancelbtn)
    {
        _cancelbtn = [[UIButton alloc]initWithFrame:CGRectMake(0+10, StatusBarHeight+10, 50, 35)];   //居中
        [_cancelbtn setTitle:@"取消" forState:UIControlStateNormal];
        [_cancelbtn setTitleColor:[CreateBase createColor:0 blue:147 green:249] forState:UIControlStateNormal];
        [_cancelbtn addTarget:self action:@selector(cancelClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return _cancelbtn;
}

-(UITextField *)Title
{
    if(!_Title )
    {
        _Title = [[UITextField alloc]initWithFrame:CGRectMake(sw_(20), sh_(98)+sh_(10), sw-sw_(20), sh_(100))];
        [_Title setTextAlignment:NSTextAlignmentLeft];
        [_Title setPlaceholder:@"标题"];
        [_Title setTextColor:[UIColor blackColor]];
        [_Title setFont:[UIFont systemFontOfSize:30 weight:0.7]];
    }
    return _Title;
}

-(UITextView *)mainText
{
    if(!_mainText)
    {
        
        _mainText = [[UITextView alloc]initWithFrame:CGRectMake(sw_(20), CGRectGetMaxY(self.currentDate.frame)+sh_(20), sw-sw_(40), sh/2)];
        [_mainText setTextColor:[UIColor blackColor]];
        _mainText.delegate = self;
        [_mainText setBackgroundColor:[CreateBase createColor:245]];
        [_mainText.layer setBorderColor:[UIColor grayColor].CGColor];
        [_mainText.layer setBorderWidth:1];
        [_mainText.layer setMasksToBounds:YES];
        [_mainText setFont:[UIFont systemFontOfSize:15 weight:0.3]];
        UILabel *placeholder = [[UILabel alloc]initWithFrame:CGRectMake(5, 5, sw, 20)];
        [placeholder setFont:[UIFont systemFontOfSize:15 weight:0.3]];
        
        placeholder.text = @"请输入您的内容";
        [placeholder setTextColor:[UIColor grayColor]];
        placeholder.tag = 30001;
        [_mainText addSubview:placeholder];
        //_mainText set
    }
    return _mainText;
}
-(void)textViewDidChange:(UITextView *)textView
{
    UILabel *lab = [self.view viewWithTag:30001];
    if(textView.text.length == 0)
    {
        lab.hidden = NO;
    }
    else
    {
        lab.hidden = YES;
    }
}
-(UILabel *)currentDate
{
    if(!_currentDate)
    {
        _currentDate = [[UILabel alloc]initWithFrame: CGRectMake(sw_(20), CGRectGetMaxY(self.Title.frame)+sh_(10), sw, sh_(30))];
        NSDateFormatter *format = [[NSDateFormatter alloc]init];
        NSDateFormatter *format2 = [[NSDateFormatter alloc]init];
        [format setDateFormat:@"yyyy年 MM月 dd日 HH:mm"];
        [format2 setDateFormat:@"yyyyMMddHHmm"];
        NSDate *nowdate = [NSDate date];
        NSTimeZone *zone = [NSTimeZone systemTimeZone];
       // NSInteger interval = [zone secondsFromGMT];
       // nowdate = [nowdate dateByAddingTimeInterval:interval];
        _currentDate.text = [format stringFromDate:nowdate];
        self.ID = [format2 stringFromDate:nowdate];
        [_currentDate setTextColor:[UIColor blackColor]];
        [_currentDate setFont:[UIFont systemFontOfSize:15 weight:0.2]];
        [_currentDate setTextAlignment:NSTextAlignmentLeft];
        
        
        
    }
    return _currentDate;
}
-(void)cancelClick
{
    [[ViewManager shareInstance].NavigationController dismissViewControllerAnimated:YES completion:nil];
}
-(void)RightbtnClick //完成按钮
{
    if(self.flag == 1)
    {
        [[AppData shareInstance] deleteData:self.indexpath];
    }
    NSMutableDictionary *dic =[NSMutableDictionary dictionaryWithDictionary:@{@"title":self.Title.text,@"date":self.currentDate.text,@"text":self.mainText.text,@"location":self.Locationlab.text}];
    NSMutableDictionary *dic2 =[NSMutableDictionary dictionaryWithDictionary:@{self.ID:dic}];
    
    [[[AppData shareInstance].data objectForKey:[AppData shareInstance].CurrentUser] addObject:dic2];
    [[AppData shareInstance] saveData];
    [[ViewManager shareInstance].NavigationController dismissViewControllerAnimated:YES completion:nil];
    //NSLog(@"----------完成按钮执行完毕－－－－－－");
    //[AppData shareInstance].data
    
    
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
