//
//  HQZXViewController.h
//  WebViewDemo
//
//  Created by AndrewTzx on 14-2-17.
//  Copyright (c) 2014年 YLink. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HQZXViewController : UIViewController<UIWebViewDelegate>

@property (strong, nonatomic) IBOutlet UIWebView *webView;
@property (strong, nonatomic) IBOutlet UITextField *jsText;
@property (strong, nonatomic) IBOutlet UIButton *submitButton;

- (IBAction)messageToHtml:(id)sender;

@end
