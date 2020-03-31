//
//  NSString+Tool.m
//  AES
//
//  Created by 姚军辉 on 2020/3/31.
//  Copyright © 2020 姚军辉. All rights reserved.
//

#import "NSString+Tool.h"
#import "NSData+Tool.h"


@implementation NSString (Tool)

- (NSString *)aes_encryptWithKey:(NSString *)key
                              iv:(nullable NSString *)iv
{
    const char *cstr = [self cStringUsingEncoding:NSUTF8StringEncoding];
    NSData *data = [NSData dataWithBytes:cstr length:self.length];
    //对数据进行加密
    NSData *result = [data aes_encryptWithKey:key iv:iv];
    
    return [NSString hexStringFromData:result];
}

- (NSString *)aes_decryptWithKey:(NSString *)key
                              iv:(nullable NSString *)iv
{
     NSMutableData *data = [NSMutableData dataWithCapacity:self.length / 2];
        unsigned char whole_byte;
        char byte_chars[3] = {'\0','\0','\0'};
        int i;
        for (i=0; i < [self length] / 2; i++) {
            byte_chars[0] = [self characterAtIndex:i*2];
            byte_chars[1] = [self characterAtIndex:i*2+1];
            whole_byte = strtol(byte_chars, NULL, 16);
            [data appendBytes:&whole_byte length:1];
        }
        //对数据进行解密
        NSData* result = [data aes_decryptWithKey:key iv:iv];
        if (result && result.length > 0) {
            return [[NSString alloc] initWithData:result encoding:NSUTF8StringEncoding];
        }
        return nil;
}


// 普通字符串转换为十六进
+ (NSString *)hexStringFromData:(NSData *)data {
    Byte *bytes = (Byte *)[data bytes];
    // 下面是Byte 转换为16进制。
    NSString *hexStr = @"";
    for(int i=0; i<[data length]; i++) {
        NSString *newHexStr = [NSString stringWithFormat:@"%x",bytes[i] & 0xff]; //16进制数
        newHexStr = [newHexStr uppercaseString];
        if([newHexStr length] == 1) {
            newHexStr = [NSString stringWithFormat:@"0%@",newHexStr];
        }
        hexStr = [hexStr stringByAppendingString:newHexStr];
    }
    return hexStr;
}

@end
