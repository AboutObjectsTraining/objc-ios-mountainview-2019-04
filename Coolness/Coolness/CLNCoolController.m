// Copyright (C) 2019 About Objects, Inc. All Rights Reserved.
// See LICENSE.txt for this project's licensing information.

#import "CLNCoolController.h"

@implementation CLNCoolController

- (void)loadView {
    self.view = [[UIView alloc] initWithFrame:CGRectZero];
    self.view.backgroundColor = UIColor.brownColor;
    
    UIView *subview1 = [[UIView alloc] initWithFrame:CGRectMake(20, 60, 200, 40)];
    UIView *subview2 = [[UIView alloc] initWithFrame:CGRectMake(40, 120, 200, 40)];
    [self.view addSubview:subview1];
    [self.view addSubview:subview2];
    
    subview1.backgroundColor = UIColor.purpleColor;
    subview2.backgroundColor = UIColor.orangeColor;
}

@end
