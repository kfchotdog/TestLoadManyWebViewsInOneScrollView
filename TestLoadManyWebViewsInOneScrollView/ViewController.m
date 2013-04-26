//
//  ViewController.m
//  TestLoadManyWebViewsInOneScrollView
//
//  Created by 程显坤 on 13-4-26.
//  Copyright (c) 2013年 程显坤. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    
    if (self) {
    
    }
    
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    CLog(@"recive memory worning");
}

- (void)loadWebViewsInUrlArray:(NSArray *)urlArray
{
    if (!scrollViewToLoadWebViews) {
        scrollViewToLoadWebViews = [[UIScrollView alloc] initWithFrame:self.view.bounds];
        scrollViewToLoadWebViews.pagingEnabled = YES;
        [self.view addSubview:scrollViewToLoadWebViews];
    }
    
    // 移除所有子view，保证scrollview显示正确
    if (scrollViewToLoadWebViews) {
        for (UIView *subView in scrollViewToLoadWebViews.subviews) {
            [subView removeFromSuperview];
        }
    }
    
    int offsetWidth = 0;
    CGRect boundsRect = self.view.bounds;
    float boundsWidth = boundsRect.size.width;
    // 遍历urlArray
    for (NSString *urlString in urlArray) {
        NSURL *url = [NSURL URLWithString:urlString];
        
        NSURLRequest *urlRequest = [NSURLRequest requestWithURL:url];
        
        boundsRect.origin.x = offsetWidth;
        UIWebView *webView = [[UIWebView alloc] initWithFrame:boundsRect];
        webView.delegate = self;
        [webView loadRequest:urlRequest];
        
        offsetWidth += boundsWidth;
        
        [scrollViewToLoadWebViews addSubview:webView];
    }
    
    scrollViewToLoadWebViews.contentSize = CGSizeMake(offsetWidth, boundsRect.size.height);
}

- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error
{
    CLog(@"webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error");
    
    CLog(@"Error :%@", error);
}

- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    CLog(@"webViewDidFinishLoad:(UIWebView *)webView");
}

@end
