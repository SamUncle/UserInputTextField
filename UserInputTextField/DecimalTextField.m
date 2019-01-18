//
//  DecimalTextField.m
//  zsmDemo
//
//  Created by zsm on 2019/1/18.
//  Copyright © 2019年 XinHuoKeJi. All rights reserved.
//

#import "DecimalTextField.h"

@interface DecimalTextField ()<UITextFieldDelegate>
@property (nonatomic, assign) BOOL hasDot;
@property (nonatomic, weak) id<DecimalTextFieldDelegate> decimalDelegate;

@end


@implementation DecimalTextField
@dynamic delegate;


- (instancetype)init
{
    self = [super init];
    if (self) {
        self.keyboardType = UIKeyboardTypeDecimalPad;
    }
    return self;
}
- (void)setDelegate:(id<DecimalTextFieldDelegate>)delegate
{
    super.delegate = self;
    _decimalDelegate = delegate;
}
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    
    /*
     * 不能输入.0-9以外的字符。
     * 设置输入框输入的内容格式
     * 只能有一个小数点
     * 小数点后最多能输入两位
     * 如果第一位是.则前面加上0.
     * 如果第一位是0则后面必须输入点，否则不能输入。
     */
    
    // 判断是否有小数点
    if ([textField.text containsString:@"."]) {
        self.hasDot = YES;
    }else{
        self.hasDot = NO;
    }
    
    if (string.length > 0) {
        
        //当前输入的字符
        unichar single = [string characterAtIndex:0];
        
        
        // 不能输入.0-9以外的字符
        if (!((single >= '0' && single <= '9') || single == '.')){
            //            Toast(@"您的输入格式不正确");
            return NO;
        }
        
        // 只能有一个小数点
        if (self.hasDot && single == '.') {
            //            Toast(@"最多只能输入一个小数点");
            return NO;
        }
        // 如果第一位是.则前面加上0.
        if ((textField.text.length == 0) && (single == '.')) {
            textField.text = @"0";
        }
        // 如果第一位是0则后面必须输入点，否则不能输入。
        if ([textField.text hasPrefix:@"0"]) {
            if (textField.text.length > 1) {
                NSString *secondStr = [textField.text substringWithRange:NSMakeRange(1, 1)];
                if (![secondStr isEqualToString:@"."]) {
                    //                    Toast(@"第二个字符需要是小数点");
                    return NO;
                }
            }else{
                if (![string isEqualToString:@"."]) {
                    //                    Toast(@"第二个字符需要是小数点");
                    return NO;
                }
            }
        }
        
    }
    
    if ([self.decimalDelegate  respondsToSelector:@selector(decimalTextField:shouldChangeCharactersInRange:replacementString:hasDot:)]) {
        return [self.decimalDelegate decimalTextField:self shouldChangeCharactersInRange:range replacementString:string hasDot:_hasDot];
    }
    return YES;
}
//MARK:--原来协议方法 需要重新实现


- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField       // return NO to disallow editing.
{
    BOOL result = YES;
    if ([_decimalDelegate respondsToSelector:@selector(textFieldShouldBeginEditing:)]) {
        result = [_decimalDelegate textFieldShouldBeginEditing:self];
    }
    return result;
}
- (void)textFieldDidBeginEditing:(UITextField *)textField          // became first responder
{
    if ([_decimalDelegate respondsToSelector:@selector(textFieldDidBeginEditing:)]) {
        [_decimalDelegate textFieldDidBeginEditing:self];
    }
}
- (BOOL)textFieldShouldEndEditing:(UITextField *)textField          // return YES to allow editing to stop and to resign first responder status. NO to disallow the editing session to end
{
    BOOL result = YES;
    if ([_decimalDelegate respondsToSelector:@selector(textFieldShouldEndEditing:)]) {
        result = [_decimalDelegate textFieldShouldEndEditing:self];
    }
    return result;
}
- (void)textFieldDidEndEditing:(UITextField *)textField             // may be called if forced even if shouldEndEditing returns NO (e.g. view removed from window) or endEditing:YES called
{
    if ([_decimalDelegate respondsToSelector:@selector(textFieldDidEndEditing:)]) {
         [_decimalDelegate textFieldDidEndEditing:self];
    }
    
}
- (void)textFieldDidEndEditing:(UITextField *)textField reason:(UITextFieldDidEndEditingReason)reason NS_AVAILABLE_IOS(10_0) // if implemented, called in place of textFieldDidEndEditing:
{
    
    if ([_decimalDelegate respondsToSelector:@selector(textFieldDidEndEditing:reason:)]) {
        [_decimalDelegate textFieldDidEndEditing:self reason:reason];
    }
    
}

- (BOOL)textFieldShouldClear:(UITextField *)textField             // called when clear button pressed. return NO to ignore (no notifications)
{
    BOOL result = NO;
    if ([_decimalDelegate respondsToSelector:@selector(textFieldShouldClear:)]) {
        result = [_decimalDelegate textFieldShouldClear:self];
    }
    return result;
}
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    BOOL result = NO;
    if ([_decimalDelegate respondsToSelector:@selector(textFieldShouldReturn:)]) {
        result = [_decimalDelegate textFieldShouldReturn:self];
    }
    return result;
}
@end
