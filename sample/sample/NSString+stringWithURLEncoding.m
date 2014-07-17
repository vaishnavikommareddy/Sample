#import "NSString+stringWithURLEncoding.h"

@implementation NSString (stringWithURLEncoding)

- (NSString *)stringWithURLEncoding
{
    NSString *result = (__bridge_transfer NSString *)CFURLCreateStringByAddingPercentEscapes(
        NULL,
        (__bridge CFStringRef)self,
        NULL,
        (CFStringRef)@"!*'();:@&=+$,/?%#[]",
        kCFStringEncodingUTF8);

    return result;
}

@end
