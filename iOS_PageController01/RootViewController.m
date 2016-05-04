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
    
    //The data model for the page content.
    _pageTitles = @[@"First Page", @"Second Page", @"Third Page", @"Forth Page"];
    _pageImages = @[@"page1.png", @"page2.png", @"page3.png", @"page4.png"];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)startToGoBtn:(id)sender {
    PageContentViewController *startingViewController = [self viewControllerAtIndex:0];
    NSArray *viewControllers = @[startingViewController];
    [self.pageViewController setViewControllers:viewControllers direction:UIPageViewControllerNavigationDirectionReverse animated:NO completion:nil];
}




- (PageContentViewController *)viewControllerAtIndex:(NSInteger )index {
    
    if (([self.pageTitles count] == 0) || (index >= [self.pageTitles count])) {
        return nil;
    }
    
    // Create a new view controller and pass suitable data.
    PageContentViewController *pageContentViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"PageContentViewController"];  // 
    pageContentViewController.imageFile = self.pageImages[index];
    pageContentViewController.titleText = self.pageTitles[index];
    pageContentViewController.pageIndex = index;
    
    return pageContentViewController;
}


#pragma mark - Page View Controller Data Source


// UIPageViewController上で右スワイプした時に呼ばれるメソッド
// 勘違いしやすいのは名前にbeforeと付いているからといって必ずしも前ページへの移動の時だけに呼ばれるという訳ではない
// 左開きの時は戻る場合、右開きの時は進む場合に呼ばれる
- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController
{
    NSUInteger index = ((PageContentViewController*) viewController).pageIndex;
    
    if ((index == 0) || (index == NSNotFound)) {
        return nil;
    }
    
    index--;
    
    return [self viewControllerAtIndex:index];
}


// UIPageViewController上で左スワイプした時に呼ばれるメソッド
// 全てにおいて先ほどのメソッドと逆になる
// 左開きの時は進む場合、右開きの時は戻る場合に呼ばれる
- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController
{
    NSUInteger index = ((PageContentViewController*) viewController).pageIndex;
    
    if (index == NSNotFound) {
        return nil;
    }
    
    index++;
    if (index == [self.pageTitles count]) {
        return nil;
    }
    return [self viewControllerAtIndex:index];
}



@end
