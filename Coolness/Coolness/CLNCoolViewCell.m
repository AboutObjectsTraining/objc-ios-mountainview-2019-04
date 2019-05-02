// Copyright (C) 2019 About Objects, Inc. All Rights Reserved.
// See LICENSE.txt for this project's licensing information.

#import "CLNCoolViewCell.h"

const UIEdgeInsets CLNTextInsets = {
    .top = 7.0,
    .bottom = 8.0,
    .left = 12.0,
    .right = 12.0
};

@interface CLNCoolViewCell ()

@property (assign, nonatomic) BOOL highlighted;
@property (class, readonly, nonatomic) NSDictionary <NSAttributedStringKey, id> *textAttributes;

@end


@implementation CLNCoolViewCell

+ (NSDictionary<NSAttributedStringKey, id> *)textAttributes {
    return @{ NSFontAttributeName : [UIFont boldSystemFontOfSize:18],
              NSForegroundColorAttributeName : UIColor.whiteColor };
}

- (void)setHighlighted:(BOOL)highlighted {
    _highlighted = highlighted;
    self.alpha = highlighted ? 0.5 : 1.0;
}

// MARK: - Drawing and Resizing

- (CGSize)sizeThatFits:(CGSize)size {
    CGSize newSize = [self.text sizeWithAttributes:[self.class textAttributes]];
    newSize.width += CLNTextInsets.left + CLNTextInsets.right;
    newSize.height += CLNTextInsets.top + CLNTextInsets.bottom;
    return newSize;
}

- (void)drawRect:(CGRect)rect {
    [self.text drawAtPoint:CGPointMake(CLNTextInsets.left, CLNTextInsets.top)
            withAttributes:[self.class textAttributes]];
}

// MARK: - UIResponder Methods

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    self.highlighted = YES;
    [self.superview bringSubviewToFront:self];
}

- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    UITouch *touch = touches.anyObject;
    CGPoint currLocation = [touch locationInView:nil];
    CGPoint prevLocation = [touch previousLocationInView:nil];
    CGPoint newLocation = self.center;
    newLocation.x += currLocation.x - prevLocation.x;
    newLocation.y += currLocation.y - prevLocation.y;
    self.center = newLocation;
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    self.highlighted = NO;
}

- (void)touchesCancelled:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    self.highlighted = NO;
}

@end
