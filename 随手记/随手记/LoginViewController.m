//
//  login.m
//  network
//
//  Created by mac on 19/12/1.
//  Copyright © 2019年 Shanghui Wu. All rights reserved.
//

#import "LoginViewController.h"
#import "CreateBase.h"
#import "RegisterViewController.h"
#import "MainViewController.h"
@interface LoginViewController ()<UITextFieldDelegate>
@property(nonatomic,strong)UILabel *log;
@property(nonatomic,strong)UIButton *reg;
@property(nonatomic,strong)UITextField *account;
@property(nonatomic,strong)UITextField *password;
@property(nonatomic,strong)UIButton *certain;
@property(nonatomic,strong)UIButton *forget;
@property(nonatomic,strong)UIButton *entrance;
@end

@implementation LoginViewController
-(UIButton *)entrance
{
    if(!_entrance)
    {
        _entrance = [[UIButton alloc]initWithFrame:CGRectMake(sw/2-sw_(100), sh_(750), sw_(200), sh_(30))];
        [_entrance setTitle:@"游客入口" forState:normal];
        _entrance.titleLabel.font = [UIFont systemFontOfSize:15 weight:0.4];
        [_entrance addTarget:self action:@selector(Entrance) forControlEvents:UIControlEventTouchUpInside];
        [_entrance setTitleColor:[CreateBase createColor:0 blue:126 green:247] forState:normal];
        
        //[self.view addSubview:_entrance];
    }
    return _entrance;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.entrance];
    self->topBar.hidden = YES;
    [self.view setBackgroundColor:[CreateBase createColor:237 blue:238 green:243]];
    [self.view addSubview:self.log];
    UILabel *lab = [[UILabel alloc]initWithFrame:CGRectMake(sw_(60), sh_(154), sw_(52), sh_(4))];
    lab.backgroundColor = [CreateBase createColor:255 blue:109 green:67];
    [self.view addSubview:lab];
    [self.view addSubview:self.reg];
    [self.view addSubview:self.password];
    [self.view addSubview:self.account];
    [self.view addSubview:self.certain];
    UILabel *line = [[UILabel alloc]initWithFrame:CGRectMake(sw_(42), sh_(428), sw_(666), sh_(1))];
    line.backgroundColor = [CreateBase createColor:198 blue:195 green:193];
    [self.view addSubview:line];
    UILabel *line2 = [[UILabel alloc]initWithFrame:CGRectMake(sw_(42), sh_(542), sw_(666), sh_(1))];
    line2.backgroundColor = [CreateBase createColor:198 blue:195 green:193];
    [self.view addSubview:line2];
    [self.view addSubview:self.forget];
    // Do any additional setup after loading the view.
}
-(UIButton *)forget
{
    if(!_forget)
    {
        _forget = [[UIButton alloc] initWithFrame:CGRectMake(sw_(588), sh_(747), sw_(120), sh_(22))];
        [_forget setTitle:@"忘记密码?" forState:normal];
        [_forget setTitleColor:[CreateBase createColor:255 blue:107 green:67] forState:normal];
        _forget.titleLabel.font = [UIFont systemFontOfSize:14 weight:0.3];
    }
    return _forget;
}
-(UIButton *)certain
{
    if(!_certain)
    {
        _certain = [[UIButton alloc]initWithFrame:CGRectMake(sw_(42), sh_(629), sw_(666), sh_(88))];
        [_certain setBackgroundImage:[UIImage imageNamed:@"btn"] forState:normal];
        [_certain setTitle:@"登录" forState:normal];
    }
    return _certain;
}
-(UITextField *)password
{
    if(!_password)
    {
        _password = [[UITextField alloc]initWithFrame:CGRectMake(sw_(42), sh_(480), sw-sw_(42), sh_(32))];
        _password.placeholder = @"请输入您的密码";
        _password.font = [UIFont systemFontOfSize:18 weight:0.3];
        _account.textColor = [UIColor blackColor];
    }
    return _password;
}
-(UITextField *)account
{
    if(!_account)
    {
        _account = [[UITextField alloc]initWithFrame:CGRectMake(sw_(42), sh_(366), sw-sw_(42), sh_(32))];
        _account.placeholder = @"请输入您的手机号";
        _account.font = [UIFont systemFontOfSize:18 weight:0.3];
        _account.textColor = [UIColor blackColor];
        [_account addTarget:self action:@selector(change:) forControlEvents:UIControlEventEditingChanged];
    }
    return _account;
}
-(UIButton *)reg
{
    if(!_reg)
    {
        _reg = [[UIButton alloc]initWithFrame:CGRectMake(sw_(140), sh_(98), sw_(72), sh_(50))];
        [_reg setTitle:@"注册" forState:normal];
        [_reg setTitleColor:[UIColor grayColor] forState:normal];
        _reg.titleLabel.font = [UIFont systemFontOfSize:19 weight:0.5];
        [_reg addTarget:self action:@selector(Register) forControlEvents:UIControlEventTouchUpInside];
        
    }
    return _reg;
}
-(UILabel *)log
{
    if(!_log)
    {
        _log = [[UILabel alloc]initWithFrame:CGRectMake(sw_(42), sh_(98), sw_(88), sh_(44))];
        _log.textColor = [UIColor blackColor];
        _log.text = @"登录";
        _log.font = [UIFont systemFontOfSize:23 weight:0.5];
        
    }
    return _log;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)change:(UITextField *)input
{
  //  NSLog(@"%d",input.text.length);
    NSString *text = input.text;
    if(text.length > 0)
    if([text characterAtIndex:text.length-1] > '9' || [text characterAtIndex:text.length-1] < '0')
    {
        NSLog(@"%c",[text characterAtIndex:text.length -1]);
        if(input.text.length > 1)
            input.text = [input.text substringWithRange:NSMakeRange(0, input.text.length-1)];
        else
        input.text = @"";
    }
}
-(void)Entrance
{
    MainViewController *mvc = [MainViewController new];
    [[ViewManager shareInstance].NavigationController pushViewController:mvc animated:YES];
}
-(void)Register
{
    RegisterViewController *rvc = [RegisterViewController new];
    [[ViewManager shareInstance].NavigationController pushViewController:rvc animated:YES];
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
