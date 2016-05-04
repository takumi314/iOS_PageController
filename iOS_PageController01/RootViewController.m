//
//  RootViewController.m
//  iOS_PageController01
//
//  Created by NishiokaKohei on 2016/05/03.
//  Copyright © 2016年 Kohei. All rights reserved.
//

#import "RootViewController.h"


@interface RootViewController ()

@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    _pageTitles = @[@"First Page", @"Second Page", @"Third Page", @"Forth Page"]; 
    
    _pageImages = @[@"page1.png", @"page2.png", @"page3.png", @"page4.png"];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)startToGoBtn:(id)sender {
}
@end
