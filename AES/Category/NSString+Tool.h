//
//  NSString+Tool.h
//  AES
//
//  Created by 姚军辉 on 2020/3/31.
//  Copyright © 2020 姚军辉. All rights reserved.
//


#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSString (Tool)

/// AES加密
/// @param key 密钥
/// @param iv 偏移量 ecb模式下无
- (NSString *)aes_encryptWithKey:(NSString *)key
                              iv:(nullable NSString *)iv;

- (NSString *)aes_decryptWithKey:(NSString *)key
                              iv:(nullable NSString *)iv;

@end

NS_ASSUME_NONNULL_END
