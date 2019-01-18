//
//  UserInputTextField.h
//  UserInputTextField
//
//  Created by zsm on 2018/5/11.
//  Copyright © 2018年 XinHuoKeJi. All rights reserved.
//

#import <UIKit/UIKit.h>

@class UserInputTextField;

@protocol UserInputTextFieldDelegate <NSObject>

//工具类 自定义实现代理方法
- (BOOL)userInputTextField:(UserInputTextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string;

@end

@interface UserTextFieldHelper : NSObject <UITextFieldDelegate>

@property (nonatomic, weak) UserInputTextField *helpObject;

@property (nonatomic, assign) BOOL hasDot;

@property (nonatomic, weak) id<UserInputTextFieldDelegate> delegate;


@end


@interface UserInputTextField : UITextField

@property (nonatomic, strong)UserTextFieldHelper *helper;

@end
