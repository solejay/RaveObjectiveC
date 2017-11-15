//
//  Constants.m
//  RaveObjCDemo
//
//  Created by Olusegun Solaja on 27/09/2017.
//  Copyright © 2017 Olusegun Solaja. All rights reserved.
//

#import "Constants.h"


@implementation Constants

+(NSString *) paymentMethodFor:(Country) country{
    switch (country) {
        case NGN:
            return @"CARD,ACCOUNT,USSD";
            break;
        case KES:
            return @"CARD,MPESA";
            break;
        case USD:
            return @"CARD,ACCOUNT";
            break;
        case ZAR:
            return @"CARD,ACCOUNT";
            break;
        case GHS:
            return @"CARD,ACCOUNT";
            break;
        default:
            return @"CARD,ACCOUNT";
            break;
    }
}
@end
