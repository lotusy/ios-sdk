//
//  LotusyBusiness.h
//  LotusySDK
//
//  Created by indochino on 2014-07-29.
//  Copyright (c) 2014 lotusy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LotusyLatLng.h"
#import "LotusyHours.h"
#import "LotusyAddress.h"
#import "LotusyRating.h"

@interface LotusyBusiness : NSObject

- (id) initWithParam:(int)businessId
           creatorId:(int)creatorId
              zhName:(NSString*)zhName
              twName:(NSString*)twName
              enName:(NSString*)enName
               price:(NSString*)price
            cashOnly:(BOOL)cashOnly
            verified:(BOOL)verified
               phone:(NSString*)phone
             website:(NSString*)website
              social:(NSString*)social
            imageUrl:(NSString*)imageUrl
        commentCount:(int)commentCount
         ratingCount:(int)ratingCount
            location:(LotusyLatLng*)location
               hours:(LotusyHours*)hours
             address:(LotusyAddress*)address
              rating:(LotusyRating*)rating;

- (int) businessId;
- (int) creatorId;
- (NSString*) zhName;
- (NSString*) twName;
- (NSString*) enName;
- (NSString*) price;
- (BOOL) cashOnly;
- (BOOL) verified;
- (NSString*) phone;
- (NSString*) website;
- (NSString*) social;
- (NSString*) imageUrl;
- (int) commentCount;
- (int) ratingCount;
- (LotusyLatLng*) location;
- (LotusyHours*) hours;
- (LotusyAddress*) address;
- (LotusyRating*) rating;

@end
