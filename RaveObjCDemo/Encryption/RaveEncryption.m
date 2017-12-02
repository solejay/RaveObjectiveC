//
//  RaveEncryption.m
//  RaveObjCDemo
//
//  Created by Johnson Ejezie on 02/12/2017.
//  Copyright © 2017 Olusegun Solaja. All rights reserved.
//

#import "RaveEncryption.h"
#import <CommonCrypto/CommonDigest.h>
#import <CommonCrypto/CommonCrypto.h>
#import <Security/Security.h>

@implementation RaveEncryption

+ (NSString *) MD5:(NSString *) string {
    const char *cStr = [string UTF8String];
    unsigned char result[CC_MD5_DIGEST_LENGTH];
    CC_MD5( cStr, (CC_LONG)strlen(cStr), result );
    return [NSString stringWithFormat:
            @"%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X",
            result[0], result[1], result[2], result[3],
            result[4], result[5], result[6], result[7],
            result[8], result[9], result[10], result[11],
            result[12], result[13], result[14], result[15]
            ];
}
+ (NSString *)getEncryptionKey:(NSString *)secretKey {
    NSString *MD5 = [RaveEncryption MD5:secretKey];
    NSString *secretKeyHex = [[secretKey componentsSeparatedByString:@"-"] lastObject];
    NSString *first12 = [secretKeyHex substringToIndex:12];
    NSString *last12 = [MD5 substringFromIndex: [MD5 length] - 12];
    return [NSString stringWithFormat:@"%@%@", first12, last12];
}
+ (NSData *)tripleDesEncryptString:(NSString *)input
                               key:(NSString *)key
                             error:(NSError **)error
{
    NSParameterAssert(input);
    NSParameterAssert(key);
    
    NSData *inputData = [input dataUsingEncoding:NSUTF8StringEncoding];
    NSData *keyData = [key dataUsingEncoding:NSUTF8StringEncoding];
    
    size_t outLength;
    
    NSAssert(keyData.length == kCCKeySize3DES, @"the keyData is an invalid size");
    
    NSMutableData *outputData = [NSMutableData dataWithLength:(inputData.length  +  kCCBlockSize3DES)];
    
    CCCryptorStatus
    result = CCCrypt(kCCEncrypt, // operation
                     kCCAlgorithm3DES, // Algorithm
                     kCCOptionPKCS7Padding | kCCOptionECBMode, // options
                     keyData.bytes, // key
                     keyData.length, // keylength
                     nil,// iv
                     inputData.bytes, // dataIn
                     inputData.length, // dataInLength,
                     outputData.mutableBytes, // dataOut
                     outputData.length, // dataOutAvailable
                     &outLength); // dataOutMoved
    
    if (result != kCCSuccess) {
        if (error != NULL) {
            *error = [NSError errorWithDomain:@"com.your_domain.your_project_name.your_class_name."
                                         code:result
                                     userInfo:nil];
        }
        return nil;
    }
    [outputData setLength:outLength];
    return outputData;
}

@end
