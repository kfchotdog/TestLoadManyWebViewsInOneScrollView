//
//  ViewController.h
//  TestLoadManyWebViewsInOneScrollView
//
//  Created by 程显坤 on 13-4-26.
//  Copyright (c) 2013年 程显坤. All rights reserved.
//

#import <UIKit/UIKit.h>

#ifdef DEBUG

#define CLog(format, ...) NSLog((@"%s [Line %d] " format), __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__)

#else

#define CLog(format, ...)

#endif

@interface ViewController : UIViewController<UIWebViewDelegate>
{
    UIScrollView *scrollViewToLoadWebViews;
}

- (void)loadWebViewsInUrlArray:(NSArray *)urlArray;

@end
