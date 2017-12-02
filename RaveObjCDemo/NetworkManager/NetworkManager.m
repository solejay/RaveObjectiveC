//
//  NetworkManager.m
//  RaveObjCDemo
//
//  Created by Johnson Ejezie on 02/12/2017.
//  Copyright © 2017 Olusegun Solaja. All rights reserved.
//

#import "NetworkManager.h"

#define BASE_URL = @"http://flw-pms-dev.eu-west-1.elasticbeanstalk.com/flwv3-pug/getpaidx/api/";
#define CHARGE_ENDPOINT = @"charge";
#define VALIDATE_CHARGE = @"validatecharge";
#define VALIDATE_ACCOUNT = @"validate";
#define VARIFY = @"verify";
@implementation NetworkManager
static NetworkManager *sharedManager = nil;

+ (NetworkManager *) sharedManager {
    static dispatch_once_t once;
    dispatch_once(&once, ^{
        sharedManager = [[NetworkManager alloc] init];
    });
    return sharedManager;
}
- (id) init {
    if ((self = [super init])) {
        
    }
    return self;
}

- (AFHTTPSessionManager*)getNetworkingManager {
    if (self.networkingManager == nil) {
        self.networkingManager = [[AFHTTPSessionManager alloc] initWithBaseURL:[NSURL URLWithString:@"http://flw-pms-dev.eu-west-1.elasticbeanstalk.com/flwv3-pug/getpaidx/api/"]];
        self.networkingManager.requestSerializer = [AFJSONRequestSerializer serializer];
        self.networkingManager.responseSerializer.acceptableContentTypes = [self.networkingManager.responseSerializer.acceptableContentTypes setByAddingObjectsFromArray:@[@"text/html", @"application/json", @"text/json"]];
    }
    return self.networkingManager;
}

- (void)charge:(NSString *)pubKey withPayload:(NSDictionary *)payload success:(NetworkManagerSuccess)success failure:(NetworkManagerFailure)failure {
    [[self getNetworkingManager] POST:@"charge" parameters:payload progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if (success != nil) {
            success(responseObject);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSString *errorMessage = [self getError:error];
        if (failure != nil) {
            failure(errorMessage, ((NSHTTPURLResponse*)task.response).statusCode);
        }
    }];
}

- (void)accountCharge:(NSString *)pubKey withPayload:(NSDictionary *)payload success:(NetworkManagerSuccess)success failure:(NetworkManagerFailure)failure {
    [[self getNetworkingManager] POST:@"charge" parameters:payload progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if (success != nil) {
            success(responseObject);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSString *errorMessage = [self getError:error];
        if (failure != nil) {
            failure(errorMessage, ((NSHTTPURLResponse*)task.response).statusCode);
        }
    }];
}

- (NSString*)getError:(NSError*)error {
    if (error != nil) {
        NSData *errorData = error.userInfo[AFNetworkingOperationFailingURLResponseDataErrorKey];
        NSDictionary *responseObject = [NSJSONSerialization JSONObjectWithData: errorData options:kNilOptions error:nil];
        //TODO: Extract error message. Check server response for key of error message
        if (responseObject != nil && [responseObject isKindOfClass:[NSDictionary class]] && [responseObject objectForKey:@"message"] != nil && [[responseObject objectForKey:@"message"] length] > 0) {
            return [responseObject objectForKey:@"message"];
        }
    }
    return @"Server Error. Please try again later";
}
@end

