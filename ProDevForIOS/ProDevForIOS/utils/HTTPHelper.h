#import <Foundation/Foundation.h>

@interface HTTPHelper : NSObject
   +(NSString*)encodeurl:(NSString*)neturl Dict:(NSMutableDictionary*)params;
@end
