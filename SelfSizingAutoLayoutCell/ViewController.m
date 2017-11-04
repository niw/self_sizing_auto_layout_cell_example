//
//  ViewController.m
//  SelfSizingAutoLayoutCell
//
//  Created by Yoshimasa Niwa on 11/4/17.
//  Copyright © 2017 Yoshimasa Niwa. All rights reserved.
//

#import "ViewController.h"
#import "SelfSizingAutoLayoutCell.h"

NS_ASSUME_NONNULL_BEGIN

static NSString * const kCellReuseIdentifier = @"SelfSizingAutoLayoutCell";

@interface ViewController () <UITableViewDataSource>

@property (nonatomic, nullable) UITableView *tableView;

@end

@implementation ViewController

- (void)viewDidLoad
{
    NSMutableArray<NSLayoutConstraint *> *constraints = [[NSMutableArray alloc] init];

    UITableView *tableView = [[UITableView alloc] init];
    tableView.estimatedRowHeight = UITableViewAutomaticDimension;
    tableView.rowHeight = UITableViewAutomaticDimension;
    tableView.dataSource = self;
    [tableView registerClass:[SelfSizingAutoLayoutCell class] forCellReuseIdentifier:kCellReuseIdentifier];
    [self.view addSubview:tableView];
    self.tableView = tableView;

    tableView.translatesAutoresizingMaskIntoConstraints = NO;
    [constraints addObject:[tableView.topAnchor constraintEqualToAnchor:self.view.topAnchor]];
    [constraints addObject:[tableView.leadingAnchor constraintEqualToAnchor:self.view.leadingAnchor]];
    [constraints addObject:[tableView.bottomAnchor constraintEqualToAnchor:self.view.bottomAnchor]];
    [constraints addObject:[tableView.trailingAnchor constraintEqualToAnchor:self.view.trailingAnchor]];

    [NSLayoutConstraint activateConstraints:constraints];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 30;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    SelfSizingAutoLayoutCell *cell = (SelfSizingAutoLayoutCell *)[self.tableView dequeueReusableCellWithIdentifier:kCellReuseIdentifier forIndexPath:indexPath];
    cell.index = indexPath.row;
    return cell;
}

@end

NS_ASSUME_NONNULL_END

