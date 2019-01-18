//
//  ViewController.m
//  UserInputTextField
//
//  Created by zsm on 2018/5/11.
//  Copyright © 2018年 XinHuoKeJi. All rights reserved.
//

#import "ViewController.h"
#import "UserInputTextField.h"
@interface ViewController ()
@property (weak, nonatomic) IBOutlet UserInputTextField *textField;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
//    UserTextFieldHelper * helper = [[UserTextFieldHelper alloc] init];
//    helper.delegate = self;
    
}
//- (BOOL)userInputTextField:(UserInputTextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
//    return YES;
//}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
