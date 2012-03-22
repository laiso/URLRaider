#import "ASIHTTPRequestViewController.h"

#import "ASIHTTPRequest.h"

@interface ASIHTTPRequestViewController ()

@end

@implementation ASIHTTPRequestViewController

- (void)sendRequest
{
  NSURL *url = [NSURL URLWithString:self.urlInput.text];
  ASIHTTPRequest *request = [ASIHTTPRequest requestWithURL:url];
  [request startSynchronous];
  self.responseView.text = [request responseString];
}

@end
