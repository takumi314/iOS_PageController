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
    
    
    // Create page view controller
    self.pageViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"PageViewController"];
    self.pageViewController.dataSource = self;      // 何が起こった？
    
    
    PageContentViewController *startingViewController = [self viewControllerAtIndex:0];
    NSArray *viewControllers = @[startingViewController];                   // どうして配列に一度収納するのか？
    [self.pageViewController setViewControllers:viewControllers direction:UIPageViewControllerNavigationDirectionForward animated:NO completion:nil];
    
    // Change the size of page view controller
//    self.pageViewController.view.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height - 30);
//
    
    
    [self addChildViewController:_pageViewController];
    [self.view addSubview:_pageViewController.view];
    [self.pageViewController didMoveToParentViewController:self];
    
}


#pragma mark - To count the pages for Page View Controller


//全ページ数をカウント
- (NSInteger)presentationCountForPageViewController:(UIPageViewController *)pageViewController
{
    return [self.pageTitles count];
}


//現在のページを返す
- (NSInteger)presentationIndexForPageViewController:(UIPageViewController *)pageViewController
{
    return 0;
}


#pragma mark - Actions after pusing the button 'Start again.'.


- (IBAction)startToGoBtn:(id)sender {
    PageContentViewController *startingViewController = [self viewControllerAtIndex:0];
    NSArray *viewControllers = @[startingViewController];
    [self.pageViewController setViewControllers:viewControllers direction:UIPageViewControllerNavigationDirectionReverse animated:NO completion:nil];
}





- (PageContentViewController *)viewControllerAtIndex:(NSUInteger )index {        // ページ : indexに応じて、新たなインスタンスを生成またはそのまま。
    if (([self.pageTitles count] == 0) || (index >= [self.pageTitles count])) {     // ページ数をカウント、indexと比較。
        return nil; // ページ数が0、もしくはページが実際のページ数内にない場合にはnilを返す。
    }
    // Create a new view controller and pass suitable data.
    // ID: PageContentViewControllerに関する、ViewControllerのインスタンスを生成し、イメージとテキストをその上に配置する。
    PageContentViewController *pageContentViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"PageContentViewController"];
    pageContentViewController.imageFile = self.pageImages[index];   // モデル内のイメージ・データをpageContentViewのimageFileに渡す
    pageContentViewController.titleText = self.pageTitles[index];       // モデル内のタイトル・データをpageContentViewのtitleTextに渡す
    pageContentViewController.pageIndex = index;
    
    return pageContentViewController;
}



#pragma mark - Page View Controller Data Source

// UIPageViewController上で左スワイプした時に呼ばれるメソッド
// 勘違いしやすいのは名前にbeforeと付いているからといって必ずしも前ページへの移動の時だけに呼ばれるという訳ではない
// 左開きの時は戻る場合、右開きの時は進む場合に呼ばれる
- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController
{
    //NSInteger index = *(((PageContentViewController*) viewController).pageIndex);       // 表示中のビューのページを参照して、indexに格納。
    NSUInteger index = ((PageContentViewController*) viewController).pageIndex;

    if ((index == 0) || (index == NSNotFound)) {
        return nil;     // 最初や最後のページならばそのまま。
    }
    
    index--;    // １つ前のページに
    
    return [self viewControllerAtIndex:index];
}


// UIPageViewController上で右スワイプした時に呼ばれるメソッド
// 全てにおいて先ほどのメソッドと逆になる
- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController
{
    NSInteger index = ((PageContentViewController*) viewController).pageIndex;   // 表示中のビューのページを参照して、indexに格納。
    
    if (index == NSNotFound) {
        return nil;
    }
    
    index++;    // 次のページへ
    if (index == [self.pageTitles count]) {
        return nil;     // 次のページが最後sならば、特別な処理はしない。
    }
    return [self viewControllerAtIndex:index];
}





- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
