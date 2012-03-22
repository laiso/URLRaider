#import "RestKitViewController.h"

#import <RestKit/RestKit.h>

@implementation RestKitViewController

- (void)sendRequest
{
  RKRequest* req = [RKRequest requestWithURL:[NSURL URLWithString:self.urlInput.text] delegate:nil];
  RKResponse* response = [req sendSynchronously];
  self.responseView.text = response.bodyAsString;
}

@end
