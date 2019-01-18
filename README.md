# UserInputNumberTextField

//用来限制用户输入小数点限制的封装类继承自UITextField

```
UserTextFieldHelper *helper = [[UserTextFieldHelper alloc] init];
helper.delegate = self;
#pragma mark --UserInputTextFieldDelegate 此代理方法用户限制用户输入小数
- (BOOL)userInputTextField:(UserInputTextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string hasDot:(BOOL)hasDot
{
if (string.length > 0) {
// 小数点后最多能输入几位
if (hasDot) {
NSRange ran = [textField.text rangeOfString:@"."];
// 由于range.location是NSUInteger类型的，所以这里不能通过(range.location - ran.location)>2来判断
int scale = 0;
if (range.location > ran.location) {
if (textField == self.singleAmountTF) {
scale = self.selectModel.scale;
}
if ([textField.text pathExtension].length >= scale) {

NSString * message = [NSString stringWithFormat:@"%@%d%@",LocalizationKey(@"decimalPointTip1"),scale,LocalizationKey(@"decimalPointTip2")];
[self.view makeToast:message duration:1.5 position:CSToastPositionCenter];


return NO;
}
}
}
}
return YES;
}

```
