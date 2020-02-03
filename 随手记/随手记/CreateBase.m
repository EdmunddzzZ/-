//
//  CreateBase.m
//  自定义导航条
//
//  Created by mac on 19/8/4.
//  Copyright © 2019年 Shanghui Wu. All rights reserved.
//

#import "CreateBase.h"

@implementation CreateBase
+(UIButton *)createButton:(CGRect)frame image:(UIImage *)image target:(SEL)seletor
{
    UIButton *btn = [[UIButton alloc]initWithFrame:frame];
    [btn setImage:image forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(selector) forControlEvents:UIControlEventTouchUpInside];
    return btn;
}
+(UIButton *)createButton:(CGRect)frame text:(NSString *)text textfont:(float)font target:(SEL)seletor
{
    UIButton *btn = [[UIButton alloc]initWithFrame:frame];
    [btn setTitle:text forState:UIControlStateNormal];
    [btn.titleLabel setFont:[UIFont systemFontOfSize:font]];
    [btn addTarget:self action:@selector(selector) forControlEvents:UIControlEventTouchUpInside];
    return btn;
}
+(UIButton *)createButton:(CGRect)frame backgGroundColor:(UIColor *)color target:(SEL)seletor
{
    UIButton *btn = [[UIButton alloc]initWithFrame:frame];
    [btn setBackgroundColor:color];
    [btn addTarget:self action:@selector(selector) forControlEvents:UIControlEventTouchUpInside];
    return btn;
}
+(UIImageView *)createImageView:(CGRect)frame image:(UIImage *)image
{
    UIImageView *img = [[UIImageView alloc]initWithFrame:frame];
    [img setImage:image];
    return img;
}
+(UITextView *)createTextView:(CGRect)frame backGroundColor:(UIColor *)backGroundColor
{
    UITextView *tv = [[UITextView alloc]initWithFrame:frame];
    [tv setBackgroundColor:backGroundColor];
    return tv;
}
+(UITextView *)createTextView:(CGRect)frame text:(NSString *)text textfont:(UIFont *)font backGroundColor:(UIColor *)backGroundColor
{
    UITextView *tv = [[UITextView alloc]initWithFrame:frame];
    [tv setText:text];
    [tv setFont:font];
    [tv setBackgroundColor:backGroundColor];
    return tv;
}

+(UILabel *)createLabel:(CGRect)frame text:(NSString *)text textfont:(float)font backGroundColor:(UIColor *)color
{
    UILabel *lab = [[UILabel alloc]initWithFrame:frame];
    [lab setText:text];
    [lab setFont:[UIFont systemFontOfSize:font]];
    [lab setBackgroundColor:color];
    return lab;
}
+(UILabel *)createLabel:(CGRect)frame text:(NSString *)text textfont:(float)font backGroundColor:(UIColor *)color textAlignMent:(NSTextAlignment)alignment
{
    UILabel *lab = [[UILabel alloc]initWithFrame:frame];
    [lab setText:text];
    [lab setFont:[UIFont systemFontOfSize:font]];
    [lab setBackgroundColor:color];
    [lab setTextAlignment:alignment];
    return lab;
}
+(UITextField *)createTextField:(CGRect)frame text:(NSString *)text textfont:(UIFont *)font backGroundColor:(UIColor *)color
{
    UITextField *tx = [[UITextField alloc]initWithFrame:frame];
    [tx setText:text];
    [tx setFont:font];
    [tx setBackgroundColor:color];
    return tx;
}
+(UITextField *)createTextField:(CGRect)frame text:(NSString *)text textfont:(UIFont *)font backGroundColor:(UIColor *)color textAlignMent:(NSTextAlignment)alignment
{
    UITextField *tx = [[UITextField alloc]initWithFrame:frame];
    [tx setText:text];
    [tx setFont: font];
    [tx setBackgroundColor:color];
    [tx setTextAlignment:alignment];
    return tx;
}
+(UITextField *)createTextField:(CGRect)frame text:(NSString *)text textfont:(UIFont *)font backGroundColor:(UIColor *)color borderWidth:(float)border borderColor:(UIColor *)borderColor
{
    UITextField *tf = [[UITextField alloc]initWithFrame:frame];
    [tf setText:text];
    [tf setFont:font];
    [tf setBackgroundColor:color];
    [tf.layer setBorderWidth:border];
    [tf.layer setMasksToBounds:YES];
    [tf.layer setBorderColor:borderColor.CGColor];
    return tf;
}
+(UIColor *)createColor:(float)a
{
    UIColor *tem = [UIColor colorWithRed:a/255.0 green:a/255.0 blue:a/255.0 alpha:1];
    return tem;
}
+(UIColor *)createColor:(float)a blue:(float)b green:(float)c
{
    UIColor *tem = [UIColor colorWithRed:a/255.0 green:b/255.0 blue:c/255.0 alpha:1];
    return tem;
}
+(UILabel *)createLabel:(CGRect)frame text:(NSString *)text textfont:(UIFont *)font
{
    UILabel *lab = [[UILabel alloc]initWithFrame:frame];
    [lab setText:text];
    [lab setFont:font];
    return lab;
}










@end
