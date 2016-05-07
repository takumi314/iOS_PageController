//
//  PageContentViewController.m
//  iOS_PageController01
//
//  Created by NishiokaKohei on 2016/05/03.
//  Copyright © 2016年 Kohei. All rights reserved.
//

#import "PageContentViewController.h"

@interface PageContentViewController ()

@end

@implementation PageContentViewController

- (void)viewDidLoad {
    [super viewDidLoad];    // Do any additional setup after loading the view.
    
    // imageFile の画像をイメージオブジェクトに渡す
    _imageOnTheBackground.image = [UIImage imageNamed:_imageFile];
    
    // ラベルの文字列をセンタリング
    _titleLabel.textAlignment = NSTextAlignmentCenter;
    // titleText の文字列をラベルオブジェクトに渡す
    _titleLabel.text = _titleText;
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
