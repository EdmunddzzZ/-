//
//  AppData.m
//  projectBase
//
//  Created by chenjianying on 15-11-16.
//  Copyright (c) 2015年 chenjianying. All rights reserved.
//

#import "AppData.h"



@implementation AppData

static AppData* mInstance;

+ (AppData*)shareInstance
{
    if (nil == mInstance)
    {
        mInstance = [[AppData alloc] init];
    }
    
    return mInstance;
}

-(id)init
{
    self = [super init];
    if(self != nil)
    {
        self.User = [[NSMutableArray alloc]init];
        self.Recycle = [[NSMutableArray alloc]init];
        self.data = [NSMutableDictionary new];
        NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
        if(paths)
        {
        NSString *path = paths.firstObject;
            NSString *filepath_Recycle = [path stringByAppendingPathComponent:@"Recycle"];
        NSString *filePath_User = [path stringByAppendingPathComponent:@"User"];
        NSString *filePath_Data = [path stringByAppendingPathComponent:@"Data"];
        NSString *filePath_CurrentUser = [path stringByAppendingPathComponent:@"Current_User"];
            if([NSKeyedUnarchiver unarchiveObjectWithFile:filePath_User])
        self.User = [NSKeyedUnarchiver unarchiveObjectWithFile:filePath_User];
            if([NSKeyedUnarchiver unarchiveObjectWithFile:filePath_Data])
        self.data = [NSKeyedUnarchiver unarchiveObjectWithFile:filePath_Data];
            if([NSKeyedUnarchiver unarchiveObjectWithFile:filePath_CurrentUser])
        self.CurrentUser = [NSKeyedUnarchiver unarchiveObjectWithFile:filePath_CurrentUser];
            if([NSKeyedUnarchiver unarchiveObjectWithFile:filepath_Recycle])
                self.Recycle = [NSKeyedUnarchiver unarchiveObjectWithFile:filepath_Recycle];
        }
    }
    
    return self;
}

-(void)saveData
{
    NSLog(@"－－－－－－－－－－－－－－savedata－－－－－－－－－－－－－－－");
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *path = paths.firstObject;
    NSString *filePath_User = [path stringByAppendingPathComponent:@"User"];
    NSString *filePath_Data = [path stringByAppendingPathComponent:@"Data"];
    NSString *filePath_CurrentUser = [path stringByAppendingPathComponent:@"Current_User"];
    NSString *filepath_Recycle = [path stringByAppendingPathComponent:@"Recycle"];
    [NSKeyedArchiver archiveRootObject:[AppData shareInstance].User toFile:filePath_User];
    [NSKeyedArchiver archiveRootObject:[AppData shareInstance].data toFile:filePath_Data];
    [NSKeyedArchiver archiveRootObject:[AppData shareInstance].CurrentUser toFile:filePath_CurrentUser];
    [NSKeyedArchiver archiveRootObject:[AppData shareInstance].Recycle toFile:filepath_Recycle];
    
}


@end
