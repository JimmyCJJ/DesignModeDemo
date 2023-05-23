//
//  OCProxy.m
//  DesignModeDemo
//
//  Created by 曹鉴津 on 2023/5/23.
//

#import "OCProxy.h"

@implementation Target

- (void)sendRequest {
    NSLog(@"sendRequest");
}

- (void)sendMsg:(NSString *)msg {
    NSLog(@"sendMsg:%@", msg);
}

- (void)print {
    NSLog(@"打印Target");
}

@end

@interface OCProxy ()
@property (nonatomic, strong) id target;
@end

@implementation OCProxy

- (instancetype)initWithTarget:(id)target {
    _target = target;
    return self;
}

- (void)forwardInvocation:(NSInvocation *)invocation {
    if (_target) {
        [invocation setTarget:_target];
        if (self.invokeBlock) {
            self.invokeBlock(invocation);
        } else {
            [invocation invoke];
        }
    }
}

- (nullable NSMethodSignature *)methodSignatureForSelector:(SEL)sel {
    if ([_target isKindOfClass:[NSObject class]]) {
        return [(NSObject *)_target methodSignatureForSelector:sel];
    }
    return [super methodSignatureForSelector:sel];
}

@end
