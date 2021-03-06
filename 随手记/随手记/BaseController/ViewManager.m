//
//  ViewManager.m
//  单例
//
//  Created by 陈剑英 on 2017/10/28.
//  Copyright © 2017年 陈剑英. All rights reserved.
//

#import "ViewManager.h"
#import "LoginViewController.h"
#import "RegisterViewController.h"



static ViewManager *_myInstance;


@implementation ViewManager

@synthesize NavigationController = _navigationController;


+(ViewManager *)shareInstance
{
    if (_myInstance == nil)
    {
        _myInstance = [[ViewManager alloc]init];
    }
    
    return _myInstance;
}

-(instancetype)init
{
    self = [super init];
    if (self)
    {
//        DutyViewController *vc = [DutyViewController new];
        
        LoginViewController*vc = [LoginViewController new];
        _navigationController = [[UINavigationController alloc]initWithRootViewController:vc];
        [[UINavigationBar appearance]setBarStyle:UIBarStyleBlack];//电池条，白色
    }
    _navigationController.navigationBar.hidden = YES;
    _navigationController.interactivePopGestureRecognizer.enabled = NO;
    return self;
}

@end

