#import <SenTestingKit/SenTestingKit.h>

@interface Tests : SenTestCase
@end

@implementation Tests

- (void)setUp
{
  [super setUp];
}

- (void)tearDown
{
  [super tearDown];
}

- (void)testSimple
{
  STAssertTrue(YES, nil);
  //STAssertTrue(NO, nil);
}

@end
