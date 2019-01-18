//
//  ViewController.m
//  UserInputTextField
//
//  Created by zsm on 2018/5/11.
//  Copyright © 2018年 XinHuoKeJi. All rights reserved.
//

#import "ViewController.h"

#import "DecimalTextField.h"
#define ScaleLimit 2 
@interface ViewController ()<DecimalTextFieldDelegate>
@property (weak, nonatomic) IBOutlet DecimalTextField *textField;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

    
}
//MARK: --DecimalTextFieldDelegate 实现此代理方法用户限制用户输入小数
- (BOOL)decimalTextField:(DecimalTextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string hasDot:(BOOL)hasDot{
    
 
        if (string.length > 0) {
            // 小数点后最多能输入几位
            if (hasDot) {
                NSRange ran = [textField.text rangeOfString:@"."];
                // 由于range.location是NSUInteger类型的，所以这里不能通过(range.location - ran.location)>2来判断
                int scale = 0;
                if (range.location > ran.location) {
                    if (textField == self.textField) {
                        scale = ScaleLimit;
                    }
                    if ([textField.text pathExtension].length >= scale) {
                        
                        NSLog(@"只能输入%d位小数",scale);
                        
                        
                        return NO;
                    }
                }
            }
        }
        return YES;
    }

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
