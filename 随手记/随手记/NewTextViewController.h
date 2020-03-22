//
//  NewTextViewController.h
//  随手记
//
//  Created by mac on 20/2/11.
//  Copyright © 2020年 Shanghui Wu. All rights reserved.
//

#import "BaseViewController.h"

@interface NewTextViewController : BaseViewController
@property(nonatomic,strong)UITextField *Title;
@property(nonatomic,strong)UITextView *mainText;
@property(nonatomic,strong)UILabel *currentDate;
@property(nonatomic,strong)UIButton *cancelbtn;
@property(nonatomic,strong)NSString *Location;
@property(nonatomic,strong)UILabel *line;
@property(nonatomic,strong)UIButton *Rightbtn;
@property(nonatomic,strong)UIButton *locationbtn;
@property(nonatomic,strong)BMKLocationManager  *locationManager;
@property(nonatomic,strong)UILabel *Locationlab;
@property(nonatomic,strong)NSString *ID;
@property(nonatomic,strong)NSIndexPath *indexpath;
@property(nonatomic,assign)BOOL flag;
@end
