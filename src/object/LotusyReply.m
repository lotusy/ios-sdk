//
//  LotusyReply.m
//  LotusySDK
//
//  Created by indochino on 2014-07-29.
//  Copyright (c) 2014 lotusy. All rights reserved.
//

#import "LotusyReply.h"

@interface LotusyReply()

@property (nonatomic) int _replyId;
@property (nonatomic, strong) NSString* _message;
@property (nonatomic, strong) NSString* _nickName;
@property (nonatomic, strong) NSDate* _createTime;

@end


@implementation LotusyReply

- (id) initWithParam:(int)replyId
             message:(NSString*)message
            nickName:(NSString*)nickName
          createTime:(int)createTime {
    self._replyId = replyId;
    self._message = message;
    self._nickName = nickName;
    self._createTime = [[NSDate date] dateByAddingTimeInterval:-1*createTime];

    return self;
}

- (int) replyId { return self._replyId; }
- (NSString*) message { return self._message; }
- (NSString*) nickName { return self._nickName; }
- (NSDate*) createTime { return self._createTime; }

@end
