// Copyright (C) 2019 About Objects, Inc. All Rights Reserved.
// See LICENSE.txt for this project's licensing information.

#import "CLNCoolController.h"
#import "CLNCoolViewCell.h"

@implementation CLNCoolController

- (void)loadView {
    self.view = [[UIView alloc] initWithFrame:CGRectZero];
    self.view.backgroundColor = UIColor.brownColor;
    
    CLNCoolViewCell *subview1 = [[CLNCoolViewCell alloc] initWithFrame:CGRectMake(20, 60, 200, 40)];
    CLNCoolViewCell *subview2 = [[CLNCoolViewCell alloc] initWithFrame:CGRectMake(40, 120, 200, 40)];
    [self.view addSubview:subview1];
    [self.view addSubview:subview2];
    
    subview1.text = @"CoolViewCells rock! 🎉😍";
    subview2.text = @"Hello World! 🌎🌏";
    
    [subview1 sizeToFit];
    [subview2 sizeToFit];    
    
    subview1.backgroundColor = UIColor.purpleColor;
    subview2.backgroundColor = UIColor.orangeColor;
}

@end
