//
//  LotusyReply.h
//  LotusySDK
//
//  Created by indochino on 2014-07-29.
//  Copyright (c) 2014 lotusy. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LotusyReply : NSObject

- (id) initWithParam:(int)replyId
             message:(NSString*)message
            nickName:(NSString*)nickName
          createTime:(int)createTime;

- (int) replyId;
- (NSString*) message;
- (NSString*) nickName;
- (NSDate*) createTime;

@end
