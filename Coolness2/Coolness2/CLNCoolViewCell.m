// Copyright (C) 2019 About Objects, Inc. All Rights Reserved.
// See LICENSE.txt for this project's licensing information.

#import "CLNCoolViewCell.h"

const UIEdgeInsets CLNTextInsets = {
    .top = 7.0,
    .bottom = 8.0,
    .left = 12.0,
    .right = 12.0
};

IB_DESIGNABLE
@interface CLNCoolViewCell ()

@property (assign, nonatomic) BOOL highlighted;
@property (class, readonly, nonatomic) NSDictionary <NSAttributedStringKey, id> *textAttributes;

@end


@implementation CLNCoolViewCell

- (instancetype)initWithFrame:(CGRect)frame {
    if (!(self = [super initWithFrame:frame])) return nil;
    
    [self configureLayer];
    [self configureGestureRecognizers];
    
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    if (!(self = [super initWithCoder:aDecoder])) return nil;
    
    [self configureLayer];
    [self configureGestureRecognizers];
    
    return self;
}

- (void)configureGestureRecognizers {
    UITapGestureRecognizer *recognizer = [[UITapGestureRecognizer alloc]
                                          initWithTarget:self action:@selector(bounce)];
    recognizer.numberOfTapsRequired = 2;
    [self addGestureRecognizer:recognizer];
}

- (void)configureLayer {
    self.layer.borderWidth = 3;
    self.layer.borderColor = UIColor.whiteColor.CGColor;
    self.layer.cornerRadius = 8;
    self.layer.masksToBounds = YES;
}

- (void)prepareForInterfaceBuilder {
    self.layer.masksToBounds = YES;
}



+ (NSDictionary<NSAttributedStringKey, id> *)textAttributes {
    return @{ NSFontAttributeName : [UIFont boldSystemFontOfSize:18],
              NSForegroundColorAttributeName : UIColor.whiteColor };
}

- (void)setHighlighted:(BOOL)highlighted {
    _highlighted = highlighted;
    self.alpha = highlighted ? 0.5 : 1.0;
}

- (void)setText:(NSString *)text {
    _text = [text copy];
    [self sizeToFit];
}

// MARK: - Animation

CGSize CLNDefaultBounceSize = {120, 240};

- (void)bounce {
    NSLog(@"In %s", __func__);
    [self animateBounceWithDuration:1.0 size:CLNDefaultBounceSize];
}

- (void)configureBounceWithSize:(CGSize)size {
    [UIView setAnimationRepeatCount:3.5];
    [UIView setAnimationRepeatAutoreverses:YES];
    CGAffineTransform translation = CGAffineTransformMakeTranslation(size.width, size.height);
    self.transform = CGAffineTransformRotate(translation, M_PI_2);
}

- (void)configureFinishBounceWithDuration:(NSTimeInterval)duration {
    // TODO: strong/weak dance.
    [UIView animateWithDuration:duration animations:^{
        self.transform = CGAffineTransformIdentity;
    }];
}

- (void)animateBounceWithDuration:(NSTimeInterval)duration size:(CGSize)size {
    typeof(self) __weak weakSelf = self;
    [UIView animateWithDuration:duration
                     animations:^{
                         typeof(weakSelf) strongSelf = weakSelf;
                         [strongSelf configureBounceWithSize:size];
                     }
                     completion:^(BOOL finished) {
                         typeof(weakSelf) strongSelf = weakSelf;
                         [strongSelf configureFinishBounceWithDuration:duration];
                     }];
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
