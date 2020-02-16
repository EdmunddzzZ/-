//
//  MainViewController.m
//  随手记
//
//  Created by mac on 20/2/4.
//  Copyright © 2020年 Shanghui Wu. All rights reserved.
//

#import "MainViewController.h"
#import "CreateBase.h"
#import "BMKLocationkit/BMKLocationComponent.h"
#import "NewTextViewController.h"
@interface MainViewController ()<UITableViewDelegate,UITableViewDataSource,UIGestureRecognizerDelegate>
@property(nonatomic,strong)UITableView *File;
@property(nonatomic,strong)UIButton *Optionbtn;
@property(nonatomic,strong)UIButton *Rightbtn; //ADD
@property(nonatomic,strong)UIView *OptionView;
//@property(nonatomic,strong)
@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self->topBar setBackBtnHide:YES];
    [self.view addSubview:self.File];
    [self.view addSubview:self.Optionbtn];
    [self.view addSubview:self.Rightbtn];
    [self.view addSubview:self.OptionView];
    [self.view setBackgroundColor:[CreateBase createColor:245 blue:245 green:245]];
    UILabel *line = [[UILabel alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(self->topBar.frame), sw, 1)];
    [line setBackgroundColor:[CreateBase createColor:213]];
    [self->topBar addSubview:line];
    [self setTopBgColor:[CreateBase createColor:245 blue:245 green:245]];
    [self setTopTitleColor:[UIColor blackColor]];
    [self setTopTitle:@"备忘录"];
    UITapGestureRecognizer *singletap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(GestureClick:)];
    [self.view addGestureRecognizer:singletap];
    singletap.delegate = self;
    singletap.cancelsTouchesInView = NO;

    
    
}
-(BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer
{
    return YES;
}
-(void)GestureClick:(UITapGestureRecognizer *)sender
{
    CGPoint point = [sender locationInView:self.view];
    if(!CGRectContainsPoint(self.OptionView.frame, point) && self.OptionView.hidden == NO)
    {
        self.OptionView.hidden = YES;
    }
}
-(UIButton *)Rightbtn // +
{
    if(!_Rightbtn)
    {
        _Rightbtn = [[UIButton alloc]initWithFrame:CGRectMake(sw-sw_(70), StatusBarHeight+sh_(25), 28, 28)];
        [_Rightbtn setTitle:@"" forState:UIControlStateNormal];
        [_Rightbtn setImage:[UIImage imageNamed:@"add"] forState:UIControlStateNormal];
        [_Rightbtn addTarget:self action:@selector(RightbtnClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return _Rightbtn;
}
-(UIButton *)Optionbtn
{
    if(!_Optionbtn)
    {
        _Optionbtn = [[UIButton alloc]initWithFrame:CGRectMake(0+10, StatusBarHeight+10, 35, 35)];   //居中
        [_Optionbtn setTitle:@"" forState:UIControlStateNormal];
        [_Optionbtn setImage:[UIImage imageNamed:@"more"] forState:UIControlStateNormal];
        [_Optionbtn addTarget:self action:@selector(OptionClick) forControlEvents:UIControlEventTouchUpInside];
        
    }
    return _Optionbtn;
}
-(void)RightbtnClick
{
    NewTextViewController *nvc = [NewTextViewController new];
    [[ViewManager shareInstance].NavigationController presentViewController:nvc animated:YES completion:nil];
}
-(void)OptionClick
{
    self.OptionView.hidden = NO;
}
-(UITableView *)File // tableview
{
    if(!_File)
    {
        _File = [[UITableView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(self->topBar.frame), sw, sh) style:UITableViewStylePlain];
        _File.backgroundColor = _File.superview.backgroundColor;
        
    }
    return _File;
}

-(UIView *)OptionView
{
    //1.个人中心 2.回收站 3.设置 4.退出登录
    
    if(!_OptionView)
    {
        _OptionView = [[UIView alloc]initWithFrame:CGRectMake(sw_(30), CGRectGetMaxY(self->topBar.frame)+1, sw_(250), sh_(320))];
        [_OptionView setBackgroundColor:[CreateBase createColor:76]];
        _OptionView.layer.cornerRadius = 8;
        _OptionView.layer.masksToBounds = YES;
        /**************************************** 4个button */
        UIButton *btn1 = [[UIButton alloc]initWithFrame:CGRectMake(sw_(50), sh_(30), sw_(150), sh_(20))];
        
        [btn1 setTitle:@"个人中心" forState:normal];
        [btn1.titleLabel setFont:[UIFont systemFontOfSize:15 weight:0.8]];
        [_OptionView addSubview:btn1];
        UILabel *line = [[UILabel alloc]initWithFrame:CGRectMake(sw_(50), CGRectGetMaxY(btn1.frame)+sh_(30), _OptionView.frame.size.width-sw_(100), 1)];
        [line setBackgroundColor:[UIColor whiteColor]];
        [_OptionView addSubview:line];
        
        UIButton *btn2 = [[UIButton alloc]initWithFrame:CGRectMake(sw_(50), CGRectGetMaxY(line.frame)+sh_(30), sw_(150), sh_(20))];
        [btn2 setTitle:@"回收站" forState:normal];
        [btn2.titleLabel setFont:[UIFont systemFontOfSize:15 weight:0.8]];
        [_OptionView addSubview:btn2];
        
        UILabel *line2 = [[UILabel alloc]initWithFrame:CGRectMake(sw_(50), CGRectGetMaxY(btn2.frame)+sh_(30), _OptionView.frame.size.width-sw_(100), 1)];
        [line2 setBackgroundColor:[UIColor whiteColor]];
        [_OptionView addSubview:line2];
        
        UIButton *btn3 = [[UIButton alloc]initWithFrame:CGRectMake(sw_(50), CGRectGetMaxY(line2.frame)+sh_(30), sw_(150), sh_(20))];
        [btn3 setTitle:@"设置" forState:normal];
        [btn3.titleLabel setFont:[UIFont systemFontOfSize:15 weight:0.8]];
        [_OptionView addSubview:btn3];
        UILabel *line3 = [[UILabel alloc]initWithFrame:CGRectMake(sw_(50), CGRectGetMaxY(btn3.frame)+sh_(30), _OptionView.frame.size.width-sw_(100), 1)];
        [line3 setBackgroundColor:[UIColor whiteColor]];
        [_OptionView addSubview:line3];
        
        UIButton *btn4 = [[UIButton alloc]initWithFrame:CGRectMake(sw_(50), CGRectGetMaxY(line3.frame)+sh_(30), sw_(150), sh_(20))];
        [btn4 setTitle:@"退出登录" forState:normal];
        [btn4.titleLabel setFont:[UIFont systemFontOfSize:15 weight:0.8]];
        [_OptionView addSubview:btn4];
        btn1.tag = 20001;
        btn2.tag = 20002;
        btn3.tag = 20003;
        btn4.tag = 20004;
        [btn1 addTarget:self action:@selector(OptionViewClick:) forControlEvents:UIControlEventTouchUpInside];
        [btn2 addTarget:self action:@selector(OptionViewClick:) forControlEvents:UIControlEventTouchUpInside];
        [btn3 addTarget:self action:@selector(OptionViewClick:) forControlEvents:UIControlEventTouchUpInside];
        [btn4 addTarget:self action:@selector(OptionViewClick:) forControlEvents:UIControlEventTouchUpInside];
                                                                  
        _OptionView.hidden = YES;
        
         
         
         
         
         
         
         
         
         
         
         /*****************************************/
    }
    return _OptionView;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
    // Dispose of any resources that can be recreated.
}

-(void)OptionViewClick:(UIButton *)sender
{
    switch (sender.tag)
    {
        case 20001:
        {
            
            
            break;
        }
            
        case 20002:
        {
            break;
        }
        case 20003:
        {
            break;
        }
        case 20004:
        {
            //保存
            [AppData shareInstance].CurrentUser = @"";
            [[ViewManager shareInstance].NavigationController popViewControllerAnimated:YES];
            break;
        }
            
        default:
            break;
    }
}
-(void)viewWillDisappear:(BOOL)animated
{
    [[AppData shareInstance] saveData];
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSMutableArray * array = [[AppData shareInstance].data objectForKey:[AppData shareInstance].CurrentUser];
    return array.count;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return sh_(100);
}
//-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    
//}
-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(editingStyle == UITableViewCellEditingStyleDelete)
    {
        NSMutableArray * array = [[AppData shareInstance].data objectForKey:[AppData shareInstance].CurrentUser];
        [[AppData shareInstance].Recycle addObject:array[indexPath.row]];
        [[[AppData shareInstance].data objectForKey:[AppData shareInstance].CurrentUser] removeObjectAtIndex:indexPath.row];
        [self.File reloadData];
    }
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
