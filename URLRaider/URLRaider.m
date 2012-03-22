#import "URLRaider.h"

#import "URURLProtocol.h"
#import "URURLResponse.h"

@interface URLRaider()
@end


@implementation URLRaider

@synthesize rules = _rules;

+ (URLRaider *)sharedRaider
{
  static URLRaider* __sharedManager;
  if(__sharedManager == nil){
    __sharedManager = [[URLRaider alloc] init];
    [__sharedManager registerURLProtocol];
  }
  return __sharedManager;
}

+ (BOOL)order:(URURLResponse *)response
{
  return [[URLRaider sharedRaider] order:response];
}

+ (BOOL)order:(NSURL *)url body:(NSString *)body
{
  return [[URLRaider sharedRaider] order:url body:body];
}

+ (void)purge
{
  [[URLRaider sharedRaider] purge];
}

- (id)init
{
  static URLRaider* __sharedManager;
  if(__sharedManager){
    return __sharedManager;
  }
  
  self = [super init];
  if(!self){
    return nil;
  }
  
  self.rules = [[NSMutableArray alloc] init];
  
  return self;
}

- (void)registerURLProtocol
{
  [NSURLProtocol registerClass:[URURLProtocol class]];
}

- (BOOL)order:(URURLResponse *)response
{
  return [self orderByResponse:response];
}

- (BOOL)order:(NSURL *)url body:(NSString *)body
{
  URURLResponse* response = [[URURLResponse alloc] initWithURL:url 
                                                      MIMEType:nil 
                                         expectedContentLength:[body length] 
                                              textEncodingName:nil];
  response.httpBody = [body dataUsingEncoding:NSUTF8StringEncoding];
  [self orderByResponse:response];
  return YES;
}

- (BOOL)orderByResponse:(URURLResponse *)response
{
  [[self rules] addObject:response];
  return YES;
}

- (void)purge
{
  [[self rules] removeAllObjects];
}

@end
