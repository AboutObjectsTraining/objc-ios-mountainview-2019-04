// Copyright (C) 2019 About Objects, Inc. All Rights Reserved.
// See LICENSE.txt for this project's licensing information.

#import "CLNAccessoryView.h"

@interface CLNAccessoryView () <UITextFieldDelegate>

@end

@implementation CLNAccessoryView

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    NSLog(@"In %s", __func__);
    [textField resignFirstResponder];
    return YES;
}


@end
