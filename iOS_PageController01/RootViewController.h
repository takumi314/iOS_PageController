//
//  RootViewController.h
//  iOS_PageController01
//
//  Created by NishiokaKohei on 2016/05/03.
//  Copyright © 2016年 Kohei. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PageContentViewController.h"


@interface RootViewController : UIViewController <UIPageViewControllerDataSource>

- (IBAction)startToGoBtn:(id)sender;

@property (nonatomic, strong)  UIPageViewController *pageViewController;
@property (nonatomic, strong)  NSArray *pageTitles;
@property (nonatomic, strong)  NSArray *pageImages;

@end

