//
//  Constants.h
//  RaveObjCDemo
//
//  Created by Olusegun Solaja on 27/09/2017.
//  Copyright © 2017 Olusegun Solaja. All rights reserved.
//

#import <Foundation/Foundation.h>
typedef enum{
    NGN, USD, KES, ZAR, GHS
    
} Country;
@interface Constants : NSObject
+(NSDictionary *) paymentMethodFor:(Country) country;
@end
