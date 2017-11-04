//
//  SelfSizingAutoLayoutCell.m
//  SelfSizingAutoLayoutCell
//
//  Created by Yoshimasa Niwa on 11/4/17.
//  Copyright © 2017 Yoshimasa Niwa. All rights reserved.
//

#import "AutoLayoutView.h"
#import "SelfSizingAutoLayoutCell.h"

NS_ASSUME_NONNULL_BEGIN

@interface SelfSizingAutoLayoutCell ()

@property (nonatomic, readonly) AutoLayoutView *autolayoutView;

@end

@implementation SelfSizingAutoLayoutCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(nullable NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self _tableViewCell_initialize];
    }
    return self;
}

- (nullable instancetype)initWithCoder:(NSCoder *)aDecoder
{
    if (self = [super initWithCoder:aDecoder]) {
        [self _tableViewCell_initialize];
    }
    return self;
}

- (void)_tableViewCell_initialize
{
    NSMutableArray<NSLayoutConstraint *> * const constraints = [[NSMutableArray alloc] init];

    AutoLayoutView * const autolayoutView = [[AutoLayoutView alloc] init];
    autolayoutView.translatesAutoresizingMaskIntoConstraints = NO;
    [self.contentView addSubview:autolayoutView];
    _autolayoutView = autolayoutView;

    [constraints addObject:[autolayoutView.topAnchor constraintEqualToAnchor:self.contentView.topAnchor constant:10.0]];
    [constraints addObject:[autolayoutView.leadingAnchor constraintEqualToAnchor:self.contentView.leadingAnchor constant:10.0]];
    [constraints addObject:[self.contentView.trailingAnchor constraintEqualToAnchor:autolayoutView.trailingAnchor constant:10.0]];
    [constraints addObject:[self.contentView.bottomAnchor constraintEqualToAnchor:autolayoutView.bottomAnchor constant:10.0]];

    [NSLayoutConstraint activateConstraints:constraints];
}

- (void)setIndex:(NSUInteger)index
{
    self.autolayoutView.index = index;
}

- (NSUInteger)index
{
    return self.autolayoutView.index;
}

- (void)prepareForReuse
{
    [super prepareForReuse];

    self.index = 0;
}

@end

NS_ASSUME_NONNULL_END
