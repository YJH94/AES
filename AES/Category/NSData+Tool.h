//
//  NSData+Tool.h
//  AES
//
//  Created by 姚军辉 on 2020/3/31.
//  Copyright © 2020 姚军辉. All rights reserved.
//


#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSData (Tool)

- (NSData *)aes_encryptWithKey:(NSString *)key
                            iv:(nullable NSString *)iv;

- (NSData *)aes_decryptWithKey:(NSString *)key
                            iv:(nullable NSString *)iv;

@end

NS_ASSUME_NONNULL_END
