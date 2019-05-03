// Copyright (C) 2019 About Objects, Inc. All Rights Reserved.
// See LICENSE.txt for this project's licensing information.

#import "CLNCoolView.h"
#import "CLNCoolViewCell.h"

@interface CLNCoolView ()
@property (weak, nonatomic) IBOutlet UITextField *textField;
@end

@implementation CLNCoolView

- (IBAction)addCell {
    NSLog(@"In %s, text is %@", __func__, self.textField.text);
    CLNCoolViewCell *newCell = [[CLNCoolViewCell alloc] init];
    newCell.text = self.textField.text;
    newCell.backgroundColor = UIColor.brownColor;
    [self addSubview:newCell];
}

@end
