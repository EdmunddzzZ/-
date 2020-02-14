//
//  ViewController.m
//  network
//
//  Created by mac on 19/11/17.
//  Copyright © 2019年 Shanghui Wu. All rights reserved.
//

#import "RegisterViewController.h"
#import "ApiManager.h"
#import "CreateBase.h"
#import "SVProgressHUD.h"
#import "MainViewController.h"
#import "JKCountDownButton.h"
#import "MainViewController.h"
@interface RegisterViewController ()<UITextFieldDelegate>
@property(nonatomic,strong)UIView *head;
//@property(nonatomic,strong)UIButton *entrance;
@end

@implementation RegisterViewController

-(UIView *)head
{
    if(!_head)
    {
        _head = [[UIView alloc]initWithFrame:CGRectMake(30, 75,200,50)];
        UILabel *regis = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 70, 50)];
        [regis setText:@"注册"];
        [regis setTextColor:[UIColor blackColor]];
        regis.textAlignment = NSTextAlignmentLeft;
        regis.font = [UIFont systemFontOfSize:32 weight:0.5];
        [_head addSubview:regis];
        UILabel *line = [[UILabel alloc]initWithFrame:CGRectMake(regis.frame.origin.x+10, CGRectGetMaxY(regis.frame)-5, 40, 3)];
        [line setBackgroundColor:[CreateBase createColor:254 blue:90 green:20]];
        line.layer.cornerRadius = 1;
        line.layer.masksToBounds = YES;
        [_head addSubview:line];
        UILabel *login = [CreateBase createLabel:CGRectMake(CGRectGetMaxX(regis.frame)+5, 5, 60, 40) text:@"登录" textfont:[UIFont systemFontOfSize:25 weight:0.5]];
        [login setTextColor:[UIColor grayColor]];
        [_head addSubview:login];
        UIButton *Login = [[UIButton alloc]initWithFrame:login.frame];
        [Login addTarget:self action:@selector(Login_) forControlEvents:UIControlEventTouchUpInside];
        [_head addSubview:Login];
    }
    return _head;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"%f-%f",sw,sh);
    //[self.view addSubview:self.entrance];
    [self.view setBackgroundColor:[CreateBase createColor:237 blue:238 green:243]];
    [self.view addSubview:self.head];
    UIView *log = [[UIView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(self.head.frame)+100, sw, 200)];
   // log.backgroundColor = [UIColor greenColor];
    JKCountDownButton *btn = [JKCountDownButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(10, 0, 60, 30);
    btn.layer.borderWidth = 2;
    btn.layer.borderColor = [UIColor grayColor].CGColor;
   // btn.layer.borderColor = [CreateBase createColor:255 blue:44 green:0].CGColor;
    btn.layer.cornerRadius = 3;
    btn.layer.masksToBounds = YES;
    btn.tag = 10005;
    [btn setTitle:@"验证码" forState:normal];
    [btn addTarget:self action:@selector(click:) forControlEvents:UIControlEventTouchUpInside];
    btn.titleLabel.font = [UIFont systemFontOfSize:15 weight:0.5];
    [btn setTitleColor:[UIColor grayColor] forState:normal];
    [btn setEnabled:NO];
    [btn addToucheHandler:^(JKCountDownButton *countDownButton, NSInteger tag)
     {
         [countDownButton setEnabled:NO];
         [countDownButton startWithSecond:60];
         [countDownButton didChange:^NSString *(JKCountDownButton *countDownButton, int second) {
             [countDownButton setTitleColor:[UIColor grayColor] forState:normal];
             [countDownButton.layer setBorderColor:[UIColor grayColor].CGColor];
             [countDownButton.titleLabel setFont:[UIFont systemFontOfSize:13]];
             return [NSString stringWithFormat:@"剩余%d秒",second];
         }];
         [countDownButton didFinished:^NSString *(JKCountDownButton *countDownButton, int second) {
             [countDownButton.titleLabel setFont:[UIFont systemFontOfSize:15]];
             [countDownButton setTitleColor:[CreateBase createColor:0 blue:124 green:247] forState:normal];
             [countDownButton.layer setBorderColor:[CreateBase createColor:0 blue:124 green:247].CGColor];
             [countDownButton setEnabled:YES];
             return @"验证码";
         }];
         
     }];
    
    

    //[btn setTitleColor:[CreateBase createColor:255 blue:44 green:0] forState:normal];
    
    
    UILabel *line = [[UILabel alloc]initWithFrame:CGRectMake(0,54, 350, 1)];
    [line setBackgroundColor:[CreateBase createColor:225 blue:224 green:228]];
    UILabel *line2 = [[UILabel alloc]initWithFrame:CGRectMake(0,54, 350, 1)];
    [line2 setBackgroundColor:[CreateBase createColor:225 blue:224 green:228]];
    UITextField *iphone = [[UITextField alloc]initWithFrame:CGRectMake(30, 10, 350, 55)];
    iphone.placeholder = @"请输入您的手机号";
    iphone.font = [UIFont systemFontOfSize:18 weight:0.4];
    iphone.textAlignment = NSTextAlignmentLeft;
    [iphone addSubview:line];
    iphone.rightView = btn;
    iphone.tag = 10000;
    iphone.delegate = self;
    [iphone addTarget:self action:@selector(textfield:) forControlEvents:UIControlEventEditingChanged];
    iphone.rightViewMode = UITextFieldViewModeAlways;
    UITextField *password = [[UITextField alloc]initWithFrame:CGRectMake(30, CGRectGetMaxY(iphone.frame)+20, 350, 55)];
    password.placeholder = @"请输入您的验证码";
    password.font = [UIFont systemFontOfSize:18 weight:0.4];
    password.textAlignment = NSTextAlignmentLeft;
    [password addSubview:line2];
    password.tag = 10001;
    [password addTarget:self action:@selector(textfield2:) forControlEvents:UIControlEventEditingChanged];

    [log addSubview:password];
    [log addSubview:iphone];
    
    UIButton *next = [[UIButton alloc]initWithFrame:CGRectMake(sw_(42), sh_(750), sw-sw_(84), sh_(88))];
    [next setBackgroundImage:[UIImage imageNamed:@"btn"] forState:UIControlStateNormal];
    //[next setBackgroundColor:[UIColor grayColor]];
    [next setTitle:@"下一步" forState:normal];
    next.tag = 10003;
    next.titleLabel.font  =[UIFont systemFontOfSize:25 weight:0.5];
    [next setEnabled:NO];
    [next addTarget:self action:@selector(click2:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:next];
    [self.view addSubview:log];

    }
-(BOOL)validateContactNumber:(NSString *)mobileNum
{
    /**
     * 手机号码:
     * 13[0-9], 14[5,7], 15[0, 1, 2, 3, 5, 6, 7, 8, 9], 16[6], 17[5, 6, 7, 8], 18[0-9], 170[0-9], 19[89]
     * 移动号段: 134,135,136,137,138,139,150,151,152,157,158,159,182,183,184,187,188,147,178,1705,198
     * 联通号段: 130,131,132,155,156,185,186,145,175,176,1709,166
     * 电信号段: 133,153,180,181,189,177,1700,199
     */
    NSString *MOBILE = @"^1(3[0-9]|4[57]|5[0-35-9]|6[6]|7[05-8]|8[0-9]|9[89])\\d{8}$";
    
    NSString *CM = @"(^1(3[4-9]|4[7]|5[0-27-9]|7[8]|8[2-478]|9[8])\\d{8}$)|(^1705\\d{7}$)";
    
    NSString *CU = @"(^1(3[0-2]|4[5]|5[56]|66|7[56]|8[56])\\d{8}$)|(^1709\\d{7}$)";
    
    NSString *CT = @"(^1(33|53|77|8[019]|99)\\d{8}$)|(^1700\\d{7}$)";
    
    /**
     * 大陆地区固话及小灵通
     * 区号：010,020,021,022,023,024,025,027,028,029
     * 号码：七位或八位
     */
    // NSString * PHS = @"^0(10|2[0-5789]|\\d{3})\\d{7,8}$";
    
    NSPredicate *regextestmobile = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", MOBILE];
    NSPredicate *regextestcm = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CM];
    NSPredicate *regextestcu = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CU];
    NSPredicate *regextestct = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CT];
    // NSPredicate *regextestPHS = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", PHS];
    
    if(([regextestmobile evaluateWithObject:mobileNum] == YES)
       || ([regextestcm evaluateWithObject:mobileNum] == YES)
       || ([regextestct evaluateWithObject:mobileNum] == YES)
       || ([regextestcu evaluateWithObject:mobileNum] == YES)) {
        return YES;
    } else {
        return NO;
    }
}
-(void)click:(JKCountDownButton *)sender
{
    // request
    UITextField *tf = [self.view viewWithTag:10000];
    NSString *str = tf.text;
    NSDictionary *dic = @{@"phone":str};
    if([[AppData shareInstance].User containsObject:str])
    {
        [SVProgressHUD showErrorWithStatus:@"该用户已经注册！"];
    }
    else
    {
    [[ApiManager shareInstance]POST:@"api/send/code/register" parameters:dic Success:^(id responseObject)
    {
        [SVProgressHUD showSuccessWithStatus:@"发送成功"];
        

        NSLog(@"%@",responseObject);
    } Failure:^(id error) {
        
    }];
    }
}
-(void)textfield:(UITextField *)sender
{
    UIButton *btn = [self.view viewWithTag:10005];
    NSString *str = sender.text;
    if(str.length > 11)
    {
        sender.text = [str substringWithRange:NSMakeRange(0, str.length-1)];
    }
    if(sender.text.length > 0)
    {
    unichar ch = [str characterAtIndex:str.length-1];
        if(ch <'0' || ch>'9')
        {
            sender.text = [str substringWithRange:NSMakeRange(0,str.length-1)];
            return;
        }
    }
    if([self validateContactNumber:sender.text])
    {
        [btn setEnabled:YES];
        [btn setTitleColor:[CreateBase createColor:0 blue:124 green:247] forState:normal];
        [btn.layer setBorderColor:btn.currentTitleColor.CGColor];
        
    }
    else
    {
        [btn setTitleColor:[UIColor grayColor] forState:normal];
        [btn.layer setBorderColor:btn.currentTitleColor.CGColor];
        [btn setEnabled:NO];
    }
    
}
-(void)textfield2:(UITextField *)sender
{
    NSString *str = sender.text;
    if(str.length > 6)
    {
        sender.text = [str substringWithRange:NSMakeRange(0, str.length-1)];
    }
    if(sender.text.length > 0)
    {
        unichar ch = [str characterAtIndex:str.length-1];
        if(ch <'0' || ch>'9')
        {
            sender.text = [str substringWithRange:NSMakeRange(0,str.length-1)];
            return;
        }
    }
    UIButton *btn = [self.view viewWithTag:10003];
    if(sender.text.length == 6)
    {
        btn.backgroundColor = [CreateBase createColor:0 blue:149 green:245];
        [btn setEnabled:YES];
    }
    else
    {
        btn.backgroundColor = [UIColor grayColor];
        [btn setEnabled:NO];
    }

    
}
-(void)click2:(UIButton *)sender
{
    
    UITextField *tf = [self.view viewWithTag:10000];
    UITextField *tf2 = [self.view viewWithTag:10001];
    NSDictionary *dic = @{@"phone":tf.text,@"code":tf2.text};
    NSLog(@"%@----%@",tf.text,tf2.text);
//    
//    [[ApiManager shareInstance]POST:@"api/verif/code" parameters:dic Success:^(id responseObject) {
////        NSDictionary *res = responseObject;
//        NSString *str = [responseObject objectForKey:@"code"];
//        NSString *str2 = [responseObject objectForKey:@"msg"];
//        NSLog(@"%@",responseObject);
//        NSLog(@"%@-----%@",str,str2);
//        int number = [str intValue];
//        if(number == 20000)
//        {
           // NSLog(@"－－－－－－－－验证成功！");
    [[[AppData shareInstance] User]addObject:tf.text];
            [AppData shareInstance].CurrentUser = tf.text;
            UIAlertController *ac = [UIAlertController alertControllerWithTitle:@"通知" message:@"注册成功！默认密码为123456" preferredStyle:UIAlertControllerStyleAlert];
            UIAlertAction *acc = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                
                tf.text = @"";
                tf2.text = @"";
                MainViewController *mvc = [MainViewController new];
                [[ViewManager shareInstance].NavigationController pushViewController:mvc animated:YES];
            }];
            [ac addAction:acc];
            [self presentViewController:ac animated:YES completion:nil];
            

            
//        }
//        else
//        {
//           // NSLog(@"－－－验证失败");
//            [SVProgressHUD showInfoWithStatus:@"验证码错误"];
//        }
//    } Failure:^(id error) {
//        
//    }];
}

-(void)Login_
{
    [[ViewManager shareInstance].NavigationController popViewControllerAnimated:YES];
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
