#import "HTTPHelper.h"

@implementation HTTPHelper

+(NSString*)encodeurl:(NSString*)url Dict:(NSMutableDictionary *)params
{
        NSArray * keys = [params allKeys];
        NSArray *values=[params allValues];
        NSString * strurl=[NSString stringWithFormat:@"%@",url];
        NSString *strparams;
        for (int j = 0; j < keys.count; j ++){
            if (j == 0){
                //拼接时加？
                strparams = [NSString stringWithFormat:@"?%@=%@", keys[j], values[j]];
            }else{
                //拼接时加&
                strparams = [NSString stringWithFormat:@"&%@=%@", keys[j], values[j]];
            }
            //拼接字符串
            strurl=[strurl stringByAppendingString:strparams];
        }
        return strurl;
}
@end
