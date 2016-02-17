//
//  LoginViewController.m
//  WebViewDemo
//
//  Created by xuqidong on 16/2/17.
//  Copyright © 2016年 YLink. All rights reserved.
//

#import "LoginViewController.h"
#import "HQZXViewController.h"
@interface LoginViewController ()

@end

@implementation LoginViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.navigationController.navigationBarHidden = YES;
    
//    NSString *strURL = [[NSBundle mainBundle] pathForResource:@"Test" ofType:@"html"];
        NSString *strURL = [[NSBundle mainBundle] pathForResource:@"index" ofType:@"html"];
    NSURL *url = [[NSURL alloc] initFileURLWithPath:strURL];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    self.webView.scrollView.bounces = NO;
    
    [self.webView loadRequest:request];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    
}

#pragma mark - - app获取H5的点击事件
-(BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType{
    NSString *requestString = [[request URL] absoluteString];//获取请求的绝对路径.
    NSArray *components = [requestString componentsSeparatedByString:@":"];//提交请求时候分割参数的分隔符
    if ([components count] > 1 && [(NSString *)[components objectAtIndex:0] isEqualToString:@"testapp"]) {
        //过滤请求是否是我们需要的.不需要的请求不进入条件
        if([(NSString *)[components objectAtIndex:1] isEqualToString:@"alert"])
        {
            NSString *message = (NSString *)[components objectAtIndex:2];
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"JS向APP提交数据" message:message delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
            [alert show];
        }
        return NO;
    }else if ([components count] > 1 && [(NSString *)[components objectAtIndex:0] isEqualToString:@"login"]){
        //过滤请求是否是我们需要的不需要的请求不进入条件
        if([(NSString *)[components objectAtIndex:1] isEqualToString:@"alert"])
        {
            NSString *message = (NSString *)[components objectAtIndex:2];
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"log in success!" message:message delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
            [alert show];
            
            
            
            //将我们的storyBoard实例化，“Main”为StoryBoard的名称
            UIStoryboard *mainStoryBoard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
            
            //将第二个控制器实例化，"SecondViewController"为我们设置的控制器的ID
            HQZXViewController *nextTableViewController = [mainStoryBoard instantiateViewControllerWithIdentifier:@"HQZXViewController"];
            //跳转事件
            [self.navigationController pushViewController:nextTableViewController animated:YES];
            
        }
        return NO;
    }else if ([components count] > 1 && [(NSString *)[components objectAtIndex:0] isEqualToString:@"joinnow"]){
        //过滤请求是否是我们需要的不需要的请求不进入条件
        if([(NSString *)[components objectAtIndex:1] isEqualToString:@"alert"])
        {
            NSString *message = (NSString *)[components objectAtIndex:2];
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"join now success!" message:message delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
            [alert show];
        }
        return NO;
    }
    
    
    return YES;
}

-(void)webViewDidFinishLoad:(UIWebView *)webView{
    [self.webView stringByEvaluatingJavaScriptFromString:[NSString stringWithFormat:@"getMessageFromApp('%@')", @"加载结束调用方法"]];
}


@end
