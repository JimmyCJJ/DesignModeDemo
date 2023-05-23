//
//  OCProxy.h
//  DesignModeDemo
//
//  Created by 曹鉴津 on 2023/5/23.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@protocol TargetProtocol <NSObject>

- (void)sendRequest;
- (void)sendMsg:(NSString *)msg;

@end

@interface Target : NSObject<TargetProtocol>
- (void)print;
@end

@interface OCProxy : NSProxy
- (instancetype)initWithTarget:(id)target;
@property (nonatomic,copy) void (^invokeBlock)(NSInvocation *invocation);
@end

NS_ASSUME_NONNULL_END
