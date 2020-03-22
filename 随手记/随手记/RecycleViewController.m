//
//  RecycleViewController.m
//  随手记
//
//  Created by mac on 20/2/10.
//  Copyright © 2020年 Shanghui Wu. All rights reserved.
//

#import "RecycleViewController.h"
#import "SizeHeader.h"
#import "AppData.h"
@interface RecycleViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)UITableView *RecycleData;
@property(nonatomic,strong)UIButton *backBtn;
@property(nonatomic,strong)UIButton *rightBtn;
@property(nonatomic,strong)UIView *doublebtn;
@end

@implementation RecycleViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self->topBar setBackBtnHide:YES];
    [self.view setBackgroundColor:[UIColor whiteColor]];
    [self.view addSubview:self.backBtn];
    UILabel *line = [[UILabel alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(self->topBar.frame), sw, 1)];
    [line setBackgroundColor:[CreateBase createColor:213]];
    [self->topBar addSubview:line];
    [self.view addSubview:self.RecycleData];
    [self setTopTitle:@"回收站"];
    [self setTopTitleColor:[UIColor blackColor]];
    [self.view addSubview:self.rightBtn];
    [self.view addSubview:self.doublebtn];
}
-(UIButton *)backBtn
{
    if(!_backBtn)
    {
        _backBtn = [[UIButton alloc]initWithFrame:CGRectMake(0+10, StatusBarHeight+10, sw_(100), 35)];   //居中
        [_backBtn setTitle:@"取消" forState:UIControlStateNormal];
        [_backBtn setTitleColor:[CreateBase createColor:0 blue:149 green:247] forState:UIControlStateNormal];
        [_backBtn addTarget:self action:@selector(backClick) forControlEvents:UIControlEventTouchUpInside];
        
    }
    return _backBtn;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(UITableView *)RecycleData
{
    if(!_RecycleData)
    {
        _RecycleData = [[UITableView alloc]initWithFrame:CGRectMake(0,TopAndSystemHeight+1, sw, sh) style:UITableViewStylePlain];
        _RecycleData.backgroundColor = _RecycleData.superview.backgroundColor;
        _RecycleData.delegate = self;
        _RecycleData.dataSource = self;
        _RecycleData.separatorStyle = UITableViewCellSeparatorStyleNone;
        [_RecycleData setAllowsSelectionDuringEditing:YES];
        
        
    }
    _RecycleData.contentSize = CGSizeMake(sw, [AppData shareInstance].Recycle.count *sh_(200)+sh_(100));
    return _RecycleData;
}
-(void)backClick
{
    if(self.rightBtn.hidden == NO)
    [[ViewManager shareInstance].NavigationController dismissViewControllerAnimated:YES completion:nil];
    else
    {
        self.rightBtn.hidden = NO;
        [self.RecycleData setEditing:NO animated:YES];
    }
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return sh_(200);
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [AppData shareInstance].Recycle.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    // NSLog(@"-------------执行cell－－－－－－－－－－－－－－");
    static NSString *cellID1 = @"cellID1";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID1];
    if(!cell)
    {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID1];
        UILabel *line = [[UILabel alloc]initWithFrame:CGRectMake(0, sh_(200)-1, sw, 1)];
        [line setBackgroundColor:[UIColor grayColor]];
        [cell addSubview:line];
        UILabel *title = [[UILabel alloc]initWithFrame:CGRectMake(sw_(20), sh_(20), sw_(300), sh_(30))];
        title.tag = 1001;
        title.textColor = [UIColor blackColor];
        title.textAlignment = NSTextAlignmentLeft;
        title.font = [UIFont systemFontOfSize:18 weight:0.6];
        [cell addSubview:title];
        UILabel *date = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(title.frame)+sw_(10), title.frame.origin.y, sw_(400), sh_(30))];
        date.tag = 1002;
        date.textColor = [UIColor blackColor];
        date.font = [UIFont systemFontOfSize:13 weight:0.3];
        [cell addSubview:date];
        UILabel *contents = [[UILabel alloc]initWithFrame:CGRectMake(sw_(20), CGRectGetMaxY(title.frame)+sh_(10), sw-2*sw_(20), sh_(100))];
        contents.textColor = [UIColor lightGrayColor];
        contents.font = [UIFont systemFontOfSize:13 weight:0.2];
        contents.tag = 1003;
        contents.numberOfLines = 0;
        [cell addSubview:contents];
    }
    NSDictionary *dics = [AppData shareInstance].Recycle[indexPath.row];
    NSArray *keys = [dics allKeys];
    NSDictionary *dic2 = [dics objectForKey:keys[0]];
    ;
    UILabel *title = [cell viewWithTag:1001];
    title.text = [dic2 objectForKey:@"title"];
    UILabel *date = [cell viewWithTag:1002];
    date.text = [dic2 objectForKey:@"date"];
    UILabel *contents = [cell viewWithTag:1003];
    NSString *str = [dic2 objectForKey:@"text"];
    if(str.length != 0)
        contents.text = str;
    else
        contents.text = @"这里没有内容";
    return cell;
}
-(BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}
-(UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return UITableViewCellEditingStyleInsert | UITableViewCellEditingStyleDelete;
}
-(NSArray<UITableViewRowAction *> *)tableView:(UITableView *)tableView editActionsForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewRowAction *deleteAction = [UITableViewRowAction rowActionWithStyle:UITableViewRowActionStyleDestructive title:@"删除" handler:^(UITableViewRowAction * _Nonnull action, NSIndexPath * _Nonnull indexPath)
    {
        [[AppData shareInstance].Recycle removeObjectAtIndex:indexPath.row];
        [self.RecycleData reloadData];
    }];
    [deleteAction setBackgroundColor:[UIColor redColor]];
    UITableViewRowAction *rebackAction = [UITableViewRowAction rowActionWithStyle:UITableViewRowActionStyleDestructive title:@"恢复" handler:^(UITableViewRowAction * _Nonnull action, NSIndexPath * _Nonnull indexPath)
    {
        NSMutableDictionary *dic = [[AppData shareInstance].Recycle objectAtIndex:indexPath.row];
        [[[AppData shareInstance].data objectForKey:[AppData shareInstance].CurrentUser] addObject:dic];
        [[AppData shareInstance].Recycle removeObjectAtIndex:indexPath.row];
        [self.RecycleData reloadData];
    }];
    [rebackAction setBackgroundColor:[UIColor greenColor]];
    NSArray *array = @[deleteAction,rebackAction];
    return array;
}
-(UIButton *)rightBtn // +
{
    if(!_rightBtn)
    {
        _rightBtn = [[UIButton alloc]initWithFrame:CGRectMake(sw-sw_(90), StatusBarHeight+sh_(25), sw_(100), 28)];
        [_rightBtn setTitle:@"多选" forState:UIControlStateNormal];
        [_rightBtn setTitleColor:[CreateBase createColor:0 blue:149 green:247] forState:UIControlStateNormal];
        [_rightBtn addTarget:self action:@selector(RightbtnClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return _rightBtn;
}
-(void)RightbtnClick
{
//if([self.rightBtn.titleLabel.text isEqualToString:@"多选"])
    if([AppData shareInstance].Recycle.count != 0)
    {
    [self.RecycleData setEditing:YES animated:YES];
    self.rightBtn.hidden = YES;
        UIButton *btn = [self.view viewWithTag:2001];
        [btn setTitle:@"恢复" forState:normal];
        UIButton *btn2 = [self.view viewWithTag:2002];
        [btn2 setTitle:@"删除" forState:normal];
    }
}
-(UIView *)doublebtn
{
    if(!_doublebtn)
    {
        _doublebtn = [[UIView alloc]initWithFrame:CGRectMake(0, sh-sh_(200), sw, sh_(200))];
        _doublebtn.backgroundColor = [UIColor whiteColor];
        UIButton *recover = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, sw/2, sh_(200))];
        [recover setBackgroundColor:[UIColor greenColor]];
        [recover setTitle:@"全部恢复" forState:UIControlStateNormal];
        recover.tag = 2001;
        [recover setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [recover addTarget:self action:@selector(doublebtnClick:) forControlEvents:UIControlEventTouchUpInside];
        [_doublebtn addSubview:recover];
        UILabel *line = [[UILabel alloc]initWithFrame:CGRectMake(sw/2, 0, 1, sh)];
        [line setBackgroundColor:[UIColor grayColor]];
        [_doublebtn addSubview:line];
        UIButton *deletebtn = [[UIButton alloc]initWithFrame:CGRectMake(sw/2+1, 0, sw/2, sh_(200))];
        [deletebtn setBackgroundColor:[UIColor redColor]];
        [deletebtn setTitle:@"全部删除" forState:UIControlStateNormal];
        deletebtn.tag = 2002;
        [deletebtn addTarget:self action:@selector(doublebtnClick:) forControlEvents:UIControlEventTouchUpInside];
        [_doublebtn addSubview:deletebtn];
        
        
        _doublebtn.hidden = NO;
        
    }
    return _doublebtn;
}
-(void)doublebtnClick:(UIButton *)sender
{
    if([sender.titleLabel.text isEqualToString:@"全部删除"])
    {
        [[AppData shareInstance].Recycle removeAllObjects];
        
    }
    else if([sender.titleLabel.text isEqualToString:@"全部恢复"])
    {
        for (NSMutableDictionary *dic in [AppData shareInstance].Recycle) {
            [[[AppData shareInstance].data objectForKey:[AppData shareInstance].CurrentUser] addObject:dic];
            
        }
        [[AppData shareInstance].Recycle removeAllObjects];
    }
    else if([sender.titleLabel.text isEqualToString:@"删除"])
    {
        NSMutableIndexSet *set = [NSMutableIndexSet new];
        for (NSIndexPath *index in self.RecycleData.indexPathsForSelectedRows)
        {
            [set addIndex:index.row];
        }
       [[AppData shareInstance].Recycle removeObjectsAtIndexes:set];
    }
    else
    {
        NSMutableIndexSet *set = [NSMutableIndexSet new];
        for (NSIndexPath *index in self.RecycleData.indexPathsForSelectedRows)
        {
            [set addIndex:index.row];
        }
        NSArray *array = [[AppData shareInstance].Recycle objectsAtIndexes:set];        [[AppData shareInstance].Recycle removeObjectsAtIndexes:set];
        for (NSMutableDictionary  *ar in array)
        {
            [[[AppData shareInstance].data objectForKey:[AppData shareInstance].CurrentUser] addObject:ar];
        }
        
    }
    self.rightBtn.hidden = NO;
    [self.RecycleData setEditing:NO animated:YES];
    [self.RecycleData reloadData];
    UIButton *btn = [self.view viewWithTag:2001];
    [btn setTitle:@"全部恢复" forState:normal];
    UIButton *btn2 = [self.view viewWithTag:2002];
    [btn2 setTitle:@"全部删除" forState:normal];
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
