//
//  ListViewController.m
//  Example
//
//  Created by gaokun on 2021/1/15.
//

#import "ListViewController.h"

@interface ListViewController ()

@end

@implementation ListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor colorWithRed:arc4random() % 255 / 255.0 green:arc4random() % 255 / 255.0 blue:arc4random() % 255 / 255.0 alpha:1.0f];
}

- (UIView *)listView {
    return self.view;
}

- (void)listWillAppear {
    NSLog(@"%zd--%s", self.index, __func__);
}

- (void)listDidAppear {
    NSLog(@"%zd--%s", self.index, __func__);
}

- (void)listWillDisappear {
    NSLog(@"%zd--%s", self.index, __func__);
}

- (void)listDidDisappear {
    NSLog(@"%zd--%s", self.index, __func__);
}

@end
