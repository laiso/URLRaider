//
//  BasetViewController.m
//  Examples
//
//  Created by  on 3/22/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//
#import <URLRaider/URLRaider.h>

#import "BaseViewController.h"

@interface BaseViewController()
@end

@implementation BaseViewController

@synthesize loadButton = _loadButton;
@synthesize urlInput = _urlInput;
@synthesize bodyInput = _bodyInput;
@synthesize responseView = _responseView;

- (void)viewDidAppear:(BOOL)animated
{
  [super viewDidAppear:animated];
  
  [URLRaider purge];
}

- (IBAction)performRequest:(id)sender
{
  [URLRaider order:[NSURL URLWithString:self.urlInput.text] body:self.bodyInput.text];
  [self sendRequest];
  [self.urlInput resignFirstResponder];
  [self.bodyInput resignFirstResponder];
}

- (void)sendRequest
{
  
}

@end
