//
//  PageContentViewController.h
//  iOS_PageController01
//
//  Created by NishiokaKohei on 2016/05/03.
//  Copyright © 2016年 Kohei. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PageContentViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIImageView *imageOnTheBackground;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;

@property NSUInteger pageIndex;     // 現在のページを収納
@property NSString *titleText;            // 文字列を表示するラベル・オブジェクト
@property NSString *imageFile;          // イメージファイル名の文字列を表示するラベル・オブジェクト


@end
