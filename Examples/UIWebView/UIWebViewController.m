//
//  UIWebViewController.m
//  Examples
//
//  Created by  on 3/22/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "UIWebViewController.h"

@interface UIWebViewController ()
@property (nonatomic, retain) IBOutlet UIWebView* webView;
@end

@implementation UIWebViewController

@synthesize webView = _webView;

- (void)sendRequest
{
  [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:self.urlInput.text]]];
}

@end
