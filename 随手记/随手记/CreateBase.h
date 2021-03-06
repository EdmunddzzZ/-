//
//  CreateBase.h
//  自定义导航条
//
//  Created by mac on 19/8/4.
//  Copyright © 2019年 Shanghui Wu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#define sw [UIScreen mainScreen].bounds.size.width
#define sh [UIScreen mainScreen].bounds.size.height
#define sw_(a) a/750.0*sw
#define sh_(a) a/1334.0*sh
@interface CreateBase : NSObject


+(UIButton *)createButton:(CGRect)frame text:(NSString *)text textfont:(float)font target:(SEL)seletor;
+(UIButton *)createButton:(CGRect)frame image:(UIImage *)image target:(SEL)seletor;
+(UIButton *)createButton:(CGRect)frame backgGroundColor:(UIColor *)color target:(SEL)seletor;
+(UILabel *)createLabel:(CGRect)frame text:(NSString *)text textfont:(float)font backGroundColor:(UIColor *)color textAlignMent:(NSTextAlignment)alignment;
+(UILabel *)createLabel:(CGRect)frame text:(NSString *)text textfont:(float)font backGroundColor:(UIColor *)color;
+(UILabel *)createLabel:(CGRect)frame text:(NSString *)text textfont:(UIFont *)font;
+(UITextField *)createTextField:(CGRect)frame text:(NSString *)text textfont:(UIFont *)font backGroundColor:(UIColor *)color textAlignMent:(NSTextAlignment)alignment;
+(UITextField *)createTextField:(CGRect)frame text:(NSString *)text textfont:(UIFont *)font backGroundColor:(UIColor *)color;
+(UITextField *)createTextField:(CGRect)frame text:(NSString *)text textfont:(UIFont *)font backGroundColor:(UIColor *)color borderWidth:(float)border borderColor:(UIColor *)borderColor;
+(UITextView *)createTextView:(CGRect)frame text:(NSString *)text textfont:(UIFont *)font backGroundColor:(UIColor *)backGroundColor;
+(UITextView *)createTextView:(CGRect)frame backGroundColor:(UIColor *)backGroundColor;
+(UIImageView *)createImageView:(CGRect)frame image:(UIImage *)image;
+(UIColor *)createColor:(float)a blue:(float)b green:(float)c;
+(UIColor *)createColor:(float)a;
@end

