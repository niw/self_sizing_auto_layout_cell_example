//
//  AutoLayoutView.m
//  SelfSizingAutoLayoutCell
//
//  Created by Yoshimasa Niwa on 11/4/17.
//  Copyright © 2017 Yoshimasa Niwa. All rights reserved.
//

#import "AutoLayoutView.h"

NS_ASSUME_NONNULL_BEGIN

@interface SpacerView: UIView

@end

@implementation SpacerView

- (CGSize)intrinsicContentSize
{
    return CGSizeMake(UIViewNoIntrinsicMetric, 10);
}

@end

@interface AutoLayoutView ()

@property (nonatomic, readonly) UIStackView *stackView;
@property (nonatomic, readonly) UILabel *firstLabel;
@property (nonatomic, readonly) SpacerView *spacerView;
@property (nonatomic, readonly) UILabel *secondLabel;

@end

@implementation AutoLayoutView

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self _autoLayoutView_initialize];
    }
    return self;
}

- (nullable instancetype)initWithCoder:(NSCoder *)aDecoder
{
    if (self = [super initWithCoder:aDecoder]) {
        [self _autoLayoutView_initialize];
    }
    return self;
}

- (void)_autoLayoutView_initialize
{
    NSMutableArray<NSLayoutConstraint *> * const constraints = [[NSMutableArray alloc] init];

    UIStackView * const stackView = [[UIStackView alloc] init];
    stackView.translatesAutoresizingMaskIntoConstraints = NO;
    stackView.axis = UILayoutConstraintAxisVertical;
    [stackView setContentHuggingPriority:UILayoutPriorityDefaultLow forAxis:UILayoutConstraintAxisHorizontal];
    [stackView setContentHuggingPriority:UILayoutPriorityDefaultLow forAxis:UILayoutConstraintAxisVertical];
    [stackView setContentCompressionResistancePriority:UILayoutPriorityDefaultLow forAxis:UILayoutConstraintAxisHorizontal];
    [stackView setContentCompressionResistancePriority:UILayoutPriorityDefaultLow forAxis:UILayoutConstraintAxisVertical];
    [self addSubview:stackView];
    _stackView = stackView;

    [constraints addObject:[stackView.topAnchor constraintEqualToAnchor:self.topAnchor]];
    [constraints addObject:[stackView.leadingAnchor constraintEqualToAnchor:self.leadingAnchor]];
    [constraints addObject:[self.trailingAnchor constraintEqualToAnchor:stackView.trailingAnchor]];
    [constraints addObject:[self.bottomAnchor constraintEqualToAnchor:stackView.bottomAnchor]];

    UILabel * const firstLabel = [[UILabel alloc] init];
    firstLabel.translatesAutoresizingMaskIntoConstraints = NO;
    [firstLabel setContentHuggingPriority:UILayoutPriorityDefaultLow forAxis:UILayoutConstraintAxisHorizontal];
    [firstLabel setContentHuggingPriority:UILayoutPriorityDefaultHigh forAxis:UILayoutConstraintAxisVertical];
    [firstLabel setContentCompressionResistancePriority:UILayoutPriorityDefaultLow forAxis:UILayoutConstraintAxisHorizontal];
    [firstLabel setContentCompressionResistancePriority:UILayoutPriorityDefaultHigh forAxis:UILayoutConstraintAxisVertical];
    [stackView addArrangedSubview:firstLabel];
    _firstLabel = firstLabel;

    SpacerView *spacerView = [[SpacerView alloc] initWithFrame:CGRectMake(0, 0, 10, 10)];
    spacerView.translatesAutoresizingMaskIntoConstraints = NO;
    [stackView addArrangedSubview:spacerView];
    _spacerView = spacerView;

    UILabel * const secondLabel = [[UILabel alloc] init];
    secondLabel.numberOfLines = 0;
    secondLabel.translatesAutoresizingMaskIntoConstraints = NO;
    secondLabel.text = @"Nyan Nyan Nyan Nyan Nyan Nyan Nyan Nyan Nyan Nyan";
    [secondLabel setContentHuggingPriority:UILayoutPriorityDefaultLow forAxis:UILayoutConstraintAxisHorizontal];
    [secondLabel setContentHuggingPriority:UILayoutPriorityDefaultHigh forAxis:UILayoutConstraintAxisVertical];
    [secondLabel setContentCompressionResistancePriority:UILayoutPriorityDefaultLow forAxis:UILayoutConstraintAxisHorizontal];
    [secondLabel setContentCompressionResistancePriority:UILayoutPriorityDefaultHigh forAxis:UILayoutConstraintAxisVertical];
    [stackView addArrangedSubview:secondLabel];
    _secondLabel = secondLabel;

    [NSLayoutConstraint activateConstraints:constraints];

    [self _update];
}

- (void)setIndex:(NSUInteger)index
{
    if (_index != index) {
        _index = index;
        [self _update];
    }
}

- (void)_update
{
    self.firstLabel.hidden = (self.index % 2 == 0);
    self.secondLabel.hidden = (self.index % 3 == 0);
    self.spacerView.hidden = self.firstLabel.hidden || self.secondLabel.hidden;

    self.firstLabel.text = [NSString stringWithFormat:@"%tu: Meow Meow Meow", self.index];
    [self.secondLabel setNeedsLayout];
    [self.secondLabel layoutIfNeeded];
}

@end

NS_ASSUME_NONNULL_END
