//
//  URURLResponse.h
//  FixieRequest
//
//  Created by  on 3/21/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface URURLResponse : NSURLResponse
@property (nonatomic, retain) NSData* httpBody;
@end
