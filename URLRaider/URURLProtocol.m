//
//  URURLProtocol.m
//  FixieRequest
//
//  Created by  on 3/21/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "URURLProtocol.h"

#import "URURLResponse.h"

#import "URLRaider.h"

@interface URURLProtocol()
@end

@implementation URURLProtocol

+ (BOOL)canInitWithRequest:(NSURLRequest *)request
{
  return YES;
}

+ (NSURLRequest *)canonicalRequestForRequest:(NSURLRequest *)request
{
  return request;
}

- (void)startLoading
{
  for(URURLResponse* response in [[URLRaider sharedRaider] rules]){
    if([self.request.URL isEqual:response.URL]){
      [self.client URLProtocol:self didLoadData:response.httpBody];
      [self.client URLProtocolDidFinishLoading:self];
      return;
    }
  }
  
  NSError* err = [NSError errorWithDomain:@"so.lai.URURLRaider" code:1 userInfo:[NSDictionary dictionary]];
  [self.client URLProtocol:self didFailWithError:err];
}

- (void)stopLoading
{
  ;
}


@end
