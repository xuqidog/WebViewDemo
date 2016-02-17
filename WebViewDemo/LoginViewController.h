//
//  LoginViewController.h
//  WebViewDemo
//
//  Created by xuqidong on 16/2/17.
//  Copyright © 2016年 YLink. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LoginViewController : UIViewController<UIWebViewDelegate>
@property (strong, nonatomic) IBOutlet UIWebView *webView;

@end
