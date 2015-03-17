//
//  LotusyBusiness.m
//  LotusySDK
//
//  Created by indochino on 2014-07-29.
//  Copyright (c) 2014 lotusy. All rights reserved.
//

#import "LotusyBusiness.h"

@interface LotusyBusiness()

@property (nonatomic) int _businessId;
@property (nonatomic) int _creatorId;
@property (nonatomic, strong) NSString* _zhName;
@property (nonatomic, strong) NSString* _twName;
@property (nonatomic, strong) NSString* _enName;
@property (nonatomic, strong) NSString* _price;
@property (nonatomic) BOOL _cashOnly;
@property (nonatomic) BOOL _verified;
@property (nonatomic, strong) NSString* _phone;
@property (nonatomic, strong) NSString* _website;
@property (nonatomic, strong) NSString* _social;
@property (nonatomic, strong) NSString* _imageUrl;
@property (nonatomic) int _commentCount;
@property (nonatomic) int _ratingCount;
@property (nonatomic, strong) LotusyLatLng* _location;
@property (nonatomic, strong) LotusyHours* _hours;
@property (nonatomic, strong) LotusyAddress* _address;
@property (nonatomic, strong) LotusyRating* _rating;

@end


@implementation LotusyBusiness

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
              rating:(LotusyRating*)rating {
    self._businessId = businessId;
    self._creatorId = creatorId;
    self._zhName = zhName;
    self._twName = twName;
    self._enName = enName;
    self._price = price;
    self._cashOnly = cashOnly;
    self._verified = verified;
    self._phone = phone;
    self._website = website;
    self._social = social;
    self._imageUrl = imageUrl;
    self._commentCount = commentCount;
    self._ratingCount = ratingCount;
    self._location = location;
    self._hours = hours;
    self._address = address;
    self._rating = rating;

    return self;
}

- (int) businessId { return self._businessId; }
- (int) creatorId { return self._creatorId; }
- (NSString*) zhName { return self._zhName; }
- (NSString*) twName { return self._twName; }
- (NSString*) enName { return self._enName; }
- (NSString*) price { return self._price; }
- (BOOL) cashOnly { return self._cashOnly; }
- (BOOL) verified { return self._verified; }
- (NSString*) phone { return self._phone; }
- (NSString*) website { return self._website; }
- (NSString*) social { return self._social; }
- (NSString*) imageUrl { return self._imageUrl; }
- (int) commentCount { return self._commentCount; }
- (int) ratingCount { return self._ratingCount; }
- (LotusyLatLng*) location { return self._location; }
- (LotusyHours*) hours { return self._hours; }
- (LotusyAddress*) address { return self._address; }
- (LotusyRating*) rating { return self._rating; }
@end
