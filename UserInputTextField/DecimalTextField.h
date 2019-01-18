//
//  DecimalTextField.h
//  zsmDemo
//
//  Created by zsm on 2019/1/18.
//  Copyright © 2019年 XinHuoKeJi. All rights reserved.
//

#import <UIKit/UIKit.h>
@class DecimalTextField;
NS_ASSUME_NONNULL_BEGIN

@protocol DecimalTextFieldDelegate <NSObject>

//工具类 自定义实现代理方法
- (BOOL)decimalTextField:(DecimalTextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string hasDot:(BOOL)hasDot;
@optional

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField;        // return NO to disallow editing.
- (void)textFieldDidBeginEditing:(UITextField *)textField;           // became first responder
- (BOOL)textFieldShouldEndEditing:(UITextField *)textField;          // return YES to allow editing to stop and to resign first responder status. NO to disallow the editing session to end
- (void)textFieldDidEndEditing:(UITextField *)textField;             // may be called if forced even if shouldEndEditing returns NO (e.g. view removed from window) or endEditing:YES called
- (void)textFieldDidEndEditing:(UITextField *)textField reason:(UITextFieldDidEndEditingReason)reason NS_AVAILABLE_IOS(10_0); // if implemented, called in place of textFieldDidEndEditing:

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string;   // return NO to not change text

- (BOOL)textFieldShouldClear:(UITextField *)textField;               // called when clear button pressed. return NO to ignore (no notifications)
- (BOOL)textFieldShouldReturn:(UITextField *)textField;              // called when 'return' key pressed. return NO to ignore.
@end

@interface DecimalTextField : UITextField

@property (nonatomic, weak) id<DecimalTextFieldDelegate> delegate;

@end

NS_ASSUME_NONNULL_END
