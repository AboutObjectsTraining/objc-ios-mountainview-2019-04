// Copyright (C) 2019 About Objects, Inc. All Rights Reserved.
// See LICENSE.txt for this project's licensing information.

#import "CLNCoolController.h"
#import "CLNCoolViewCell.h"

@interface CLNCoolController () <UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *textField;
@property (weak, nonatomic) IBOutlet UIView *contentView;

@end

@implementation CLNCoolController

- (IBAction)addCell {
    NSLog(@"In %s, text is %@", __func__, self.textField.text);
    CLNCoolViewCell *newCell = [[CLNCoolViewCell alloc] init];
    newCell.text = self.textField.text;
    newCell.backgroundColor = UIColor.brownColor;
    [self.contentView addSubview:newCell];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    NSLog(@"In %s", __func__);
    [textField resignFirstResponder];
    return YES;
}

//- (void)loadView {
//    [NSBundle.mainBundle loadNibNamed:@"CoolStuff" owner:self options:nil];
//}
//
//- (void)loadView2 {
//    NSArray *topLevelObjs = [NSBundle.mainBundle loadNibNamed:@"CoolStuff" owner:nil options:nil];
//    self.view = topLevelObjs.firstObject;
//}
//
//- (void)loadView {
//    self.view = [[UIView alloc] initWithFrame:UIScreen.mainScreen.bounds];
//    self.view.backgroundColor = UIColor.brownColor;
//
//    CGRect accessoryRect;
//    CGRect contentRect;
//    CGRectDivide(self.view.frame, &accessoryRect, &contentRect, 90, CGRectMinYEdge);
//    UIView *accessoryView = [[UIView alloc] initWithFrame:accessoryRect];
//    UIView *contentView = [[UIView alloc] initWithFrame:contentRect];
//    [self.view addSubview:accessoryView];
//    [self.view addSubview:contentView];
//
//    self.contentView = contentView;
//    self.contentView.clipsToBounds = YES;
//
//    accessoryView.backgroundColor = [UIColor colorWithWhite:1.0 alpha:0.7];
//    contentView.backgroundColor = [UIColor colorWithWhite:1.0 alpha:0.5];
//
//    // Controls
//
//    UITextField *textField = [[UITextField alloc] initWithFrame:CGRectMake(15, 45, 240, 30)];
//    [accessoryView addSubview:textField];
//    textField.borderStyle = UITextBorderStyleRoundedRect;
//    textField.placeholder = @"Enter a label";
//
//    self.textField = textField;
//    self.textField.delegate = self;
//
//    UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
//    [button setTitle:@"Add" forState:UIControlStateNormal];
//    [button sizeToFit];
//    [accessoryView addSubview:button];
//    button.frame = CGRectOffset(button.frame, 270, 45);
//
//    [button addTarget:self action:@selector(addCell) forControlEvents:UIControlEventTouchUpInside];
//
//    // Cells
//
//    CLNCoolViewCell *cell1 = [[CLNCoolViewCell alloc] initWithFrame:CGRectMake(20, 30, 200, 40)];
//    CLNCoolViewCell *cell2 = [[CLNCoolViewCell alloc] initWithFrame:CGRectMake(40, 90, 200, 40)];
//    [contentView addSubview:cell1];
//    [contentView addSubview:cell2];
//
//    cell1.text = @"CoolViewCells rock! 🎉😍";
//    cell2.text = @"Hello World! 🌎🌏";
//
//    cell1.backgroundColor = UIColor.purpleColor;
//    cell2.backgroundColor = UIColor.orangeColor;
//}

@end
