//
//  ViewController.m
//  Fibonacci
//
//  Created by simdm on 1/16/16.
//  Copyright © 2016 alushu. All rights reserved.
//

#import "ViewController.h"
#import "JKBigInteger.h"
#import "LSDefine.h"
#import "LSTools.h"
#import "FibonacciTableViewCell.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.title = @"Fibonacci";
    
    self.tableView.allowsSelection = NO;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    array = [NSMutableArray new];
    for (int i=0; i<20; i++) {
        
        if (i >= 2) {
            [array addObject:[((JKBigInteger*)[array lastObject]) add:[array objectAtIndex:array.count - 2]]];
        }
        else {
            [array addObject:[[JKBigInteger alloc] initWithString:[NSString stringWithFormat:@"%d", i]]];
        }
    }
}

#pragma mark - UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return array.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *identifier = @"FibonacciTableViewCell";
    
    FibonacciTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil) {
        cell = [[FibonacciTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }

    cell.fibonacciLabel.text = [(JKBigInteger*)[array objectAtIndex:[indexPath row]] stringValue];

    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    float height = 10.0f;
    
    CGSize constraint = CGSizeMake(Screen.size.width - LEFT_MARGION*2, MAXFLOAT);
    height += [LSTools setLabelAttributed:nil LineSpacing:1.0f constraint:constraint font:[UIFont fontWithName:@"thonburi" size:FONT_SIZE] text:[(JKBigInteger*)[array objectAtIndex:[indexPath row]] stringValue]];
    
    height += 10.0f + 1.0f;
    
    return height;
}

#pragma mark - UIScrollViewDelegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    for (UITableViewCell * cell in self.tableView.visibleCells) {
        NSIndexPath * indexPath = [self.tableView indexPathForCell:cell];
        
        if (indexPath.row >= array.count - 5) {
            for (int i=0; i<20; i++) {
                [array addObject:[((JKBigInteger*)[array lastObject]) add:[array objectAtIndex:array.count - 2]]];
            }

            [self.tableView reloadData];
        }
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
