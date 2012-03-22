#import <Foundation/Foundation.h>

#import "URURLProtocol.h"

@interface URLRaider : NSObject

+ (URLRaider *)sharedRaider;
+ (BOOL)order:(NSURLResponse *)response;
+ (BOOL)order:(NSURL *)url body:(NSString *)body;
+ (void)purge;

@property (nonatomic, retain) NSMutableArray* rules;

@end
