//
//  RaveEncryption.h
//  RaveObjCDemo
//
//  Created by Johnson Ejezie on 02/12/2017.
//  Copyright © 2017 Olusegun Solaja. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RaveEncryption : NSObject
+ (NSString *) getEncryptionKey: (NSString *)secretKey;
@end
