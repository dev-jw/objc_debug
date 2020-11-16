//
//  main.m
//  ObjcTest
//
//  Created by neotv on 2020/9/7.
//

#import <Foundation/Foundation.h>
#import <objc/runtime.h>
#import <malloc/malloc.h>
#import <objc/message.h>

@interface Person : NSObject
//@property (nonatomic, strong) NSString *name;
//@property (nonatomic, strong) NSString *nickName;
//
//@property (nonatomic, assign) char a;
//@property (nonatomic, assign) char b;
//
//@property (nonatomic, assign) int age;
//@property (nonatomic, assign) int height;

- (void)doFirst;
- (void)doSecond;
- (void)doThird;

- (void)run;


@end

@implementation Person
+ (void)load {
    
}
//- (void)run {
//    NSLog(@"%s", __func__);
//}

- (void)doFirst {}
- (void)doSecond {}
- (void)doThird {}

@end

struct Year {
    int year;
}Year;

struct YearWithMonth {
    int year;
    int month;
}YearWithMonth;

void validClass() {
    Class class1 = [Person class];
    Class class2 = [Person alloc].class;
    Class class3 = object_getClass([Person alloc]);
    NSLog(@"\n%p\n%p\n%p\n",class1,class2,class3);
}


//- (NSException *)uncaughtExceptionHandler() {
//
//}


int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        
//        NSSetUncaughtExceptionHandler(&)
        
         [Person init];
        
        Person *p = [Person alloc];
        [p run];
        
        BOOL res1 = [(id)[NSObject class] isKindOfClass:[NSObject class]];
        BOOL res2 = [(id)[NSObject class] isMemberOfClass:[NSObject class]];
        BOOL res3 = [(id)[Person class] isKindOfClass:[Person class]];
        BOOL res4 = [(id)[Person class] isMemberOfClass:[Person class]];

        NSLog(@"%d %d %d %d", res1, res2, res3, res4);
        
        BOOL res5 = [(id)[NSObject alloc] isKindOfClass:[NSObject class]];
        BOOL res6 = [(id)[NSObject alloc] isMemberOfClass:[NSObject class]];
        BOOL res7 = [(id)[Person alloc] isKindOfClass:[Person class]];
        BOOL res8 = [(id)[Person alloc] isMemberOfClass:[Person class]];

        NSLog(@"%d %d %d %d", res5, res6, res7, res8);
        
        validClass();
        
        NSObject *obj = [NSObject alloc];
        //
        Person *person = [Person alloc];
        [person run];
//        size_t pSize = sizeof(person);
//        size_t gSize  = class_getInstanceSize(Person.class);
//        size_t mSize = malloc_size((__bridge const void *)(person));
//
//        objc_msgSend(person, sel_registerName("run"));
                
//        objc_msgSendSuper(<#struct objc_super * _Nonnull super#>, <#SEL  _Nonnull op, ...#>)
        
        struct Year y;
        y.year = 2020;
        size_t yearSize = sizeof(y);
        
        struct YearWithMonth ym;
        ym.year  = 2020;
        ym.month = 9;
        size_t yearWithMonthSize = sizeof(ym);
        
        NSLog(@"Hello, World!");
        
    }
    return 0;
}
