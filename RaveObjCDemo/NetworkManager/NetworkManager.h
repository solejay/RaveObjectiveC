//
//  NetworkManager.h
//  RaveObjCDemo
//
//  Created by Johnson Ejezie on 02/12/2017.
//  Copyright © 2017 Olusegun Solaja. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AFNetworking/AFNetworking.h>

typedef void (^NetworkManagerSuccess)(id responseObject);
typedef void (^NetworkManagerFailure)(NSString *failureReason, NSInteger statusCode);
@interface NetworkManager : NSObject
+ (id) sharedManager;
@property (nonatomic, strong) AFHTTPSessionManager *networkingManager;

- (void) charge:(NSString *)pubKey withPayload: (NSDictionary *)payload success:(NetworkManagerSuccess)success failure:(NetworkManagerFailure)failure;;
- (void) accountCharge:(NSString *)pubKey withPayload: (NSDictionary *)payload success:(NetworkManagerSuccess)success failure:(NetworkManagerFailure)failure;;
@end
