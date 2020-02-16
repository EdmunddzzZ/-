//
//  AppData.h
//  projectBase
//
//  Created by chenjianying on 15-11-16.
//  Copyright (c) 2015年 chenjianying. All rights reserved.
//

#import <Foundation/Foundation.h>
static NSString *default_name = @"游客";

@interface AppData : NSObject
@property(nonatomic,strong)NSMutableArray *User;
@property(nonatomic,strong)NSString *CurrentUser;
//@property(nonatomic,strong)NSArray *password;
@property(nonatomic,strong)NSMutableDictionary *data;
@property(nonatomic,strong)NSMutableArray *Recycle;
-(void)saveData;


/*
    数据
 @
 {
    @"User" : @[
                @{
                    @"ID" : @{
                            @"date" : @""
                            @"title" : @""
                            .....
 
 
 
                        }
 
 
                ]
 }

 */

+ (AppData*)shareInstance;


@end

