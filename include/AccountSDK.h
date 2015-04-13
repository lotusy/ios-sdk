//
//  AccountSDK.h
//  LotusySDK
//
//  Created by pshen on 2014-07-29.
//  Copyright (c) 2014 lotusy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LotusyRESTResult.h"
#import "LotusyToken.h"


@interface AccountSDK : NSObject

+ (void) registerAccount:(NSString*)externalType
              externalId:(NSString*)externalId
                userName:(NSString*)userName
                nickName:(NSString*)nickName
                 picture:(NSString*)picture
             description:(NSString*)description
                callback:(void(^)(LotusyRESTResult*, LotusyToken*))callback;


+ (void) login:(NSString*)externalType
    externalId:(NSString*)externalId
      callback:(void(^)(LotusyRESTResult*, LotusyToken*))callback;


+ (void) logout:(void(^)(LotusyRESTResult*))callback;


+ (void) currentUserProfile:(void(^)(LotusyRESTResult*, NSDictionary*))callback;


+ (void) userProfile:(int)userId
            callback:(void(^)(LotusyRESTResult*, NSDictionary*))callback;


+ (void) updateProfile:(NSString*)userName
              nickName:(NSString*)nickName
               picture:(NSString*)picture
           description:(NSString*)description
              callback:(void(^)(LotusyRESTResult*, NSDictionary*))callback;


+ (void) userFollowings:(int)userId
                  start:(int)start
                   size:(int)size
               callback:(void(^)(LotusyRESTResult*, NSArray*))callback;


+ (void) userFollowers:(int)userId
                 start:(int)start
                  size:(int)size
              callback:(void(^)(LotusyRESTResult*, NSArray*))callback;


+ (void) userCollection:(int)userId
                  start:(int)start
                   size:(int)size
               callback:(void(^)(LotusyRESTResult*, NSArray*))callback;


+ (void) userHitlist:(int)userId
               start:(int)start
                size:(int)size
            callback:(void(^)(LotusyRESTResult*, NSArray*))callback;


+ (void) userActivities:(int)userId
                  start:(int)start
                   size:(int)size
               callback:(void(^)(LotusyRESTResult*, NSArray*))callback;


+ (void) buddyUser:(int)userId
          callback:(void(^)(LotusyRESTResult*))callback;


+ (void) unBuddyUser:(int)userId
            callback:(void(^)(LotusyRESTResult*))callback;


+ (void) updateUserAlert:(NSString*)alertCode
                   isAdd:(BOOL)isAdd;
@end
