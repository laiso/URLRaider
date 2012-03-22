#import "OCMockViewController.h"

#import <OCMock/OCMock.h>

@interface OCMockViewController ()

@end

@implementation OCMockViewController

- (IBAction)performRequest:(id)sender
{
  [self sendRequest];
  [self.urlInput resignFirstResponder];
  [self.bodyInput resignFirstResponder];
}

- (void)sendRequest
{
  /** 
   * 望んだように動作しない…… そもそも用途が違う？
   * http://stackoverflow.com/questions/1810053/how-to-stub-a-class-method-in-ocmock
   * "Anyway, I believe that this is not supported in the way one would desire in OCMock because stubbing a class method needs to literally reach into the class and changes its method implementation regardless of when, where, or who calls the method. "
   */
  
  id conn = [OCMockObject mockForClass:[NSURLConnection class]];
  NSURLRequest* request = [NSURLRequest requestWithURL:[NSURL URLWithString:self.urlInput.text]];
  NSData* response = [self.bodyInput.text dataUsingEncoding:NSUTF8StringEncoding];
  [[[conn stub] andReturn:response] sendSynchronousRequest:OCMOCK_ANY returningResponse:nil error:nil];
  
  NSData* realResponse = [conn sendSynchronousRequest:request returningResponse:nil error:nil];
  self.responseView.text = [[NSString alloc] initWithData:realResponse encoding:NSUTF8StringEncoding];

}

@end
