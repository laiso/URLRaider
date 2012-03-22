#import <SenTestingKit/SenTestingKit.h>

#import "URLRaider.h"

@interface URLRaiderTests : SenTestCase
@end

@implementation URLRaiderTests

- (void)setUp
{
  [super setUp];
}

- (void)tearDown
{
  [super tearDown];
}

- (void)testSampleCode
{
  NSURL* url = [NSURL URLWithString:@"http://example.com/api/hi.json"];
  NSString* fakeResponse = @"{\"title\": \"Hello, 世界!\"}";
  [URLRaider order:url body:fakeResponse];
  
  NSURLRequest* request = [NSURLRequest requestWithURL:url];
  NSData* responseData = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
  
  NSString* responseText = [[NSString alloc] initWithData:responseData encoding:NSUTF8StringEncoding];
  STAssertEqualObjects(responseText, fakeResponse, nil);
  STAssertEqualObjects(responseData, [fakeResponse dataUsingEncoding:NSUTF8StringEncoding], nil);
}

@end
