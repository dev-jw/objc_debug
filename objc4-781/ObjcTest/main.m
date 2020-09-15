//
//  main.m
//  ObjcTest
//
//  Created by neotv on 2020/9/7.
//

#import <Foundation/Foundation.h>
#import <objc/runtime.h>
#import <malloc/malloc.h>

@interface Person : NSObject
@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *nickName;

@property (nonatomic, assign) int age;
@property (nonatomic, assign) long height;

@property (nonatomic) char c1;
@property (nonatomic) char c2;

@end

@implementation Person

@end

struct SimaplePerson {
    int idCard;
    double age;
    bool sex;
}SimaplePerson;

struct PersonBaseInfo {
    double height;
    double weight;
}PersonBaseInfo;

struct Struct1 {
    char ch:   1;  //1位
    int  size: 3;  //3位
} Struct1;

struct Struct2 {
    char ch;    //1位
    int  size;  //4位
} Struct2;

void validClass() {
    Class class1 = [Person class];
    Class class2 = [Person alloc].class;
    Class class3 = object_getClass([Person alloc]);
    NSLog(@"\n%p\n%p\n%p\n",class1,class2,class3);
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        
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
        
        NSLog(@"Struct:%lu——BitArea:%lu", sizeof(Struct1), sizeof(Struct2));
        
        Person *obj = [Person alloc];
        obj.name      = @"Zsy";
        obj.nickName  = @"dev";
        obj.age       = 18;
        obj.c1        = 'a';
        obj.c2        = 'b';

        
        validClass();
        
        
        // NSObject *obj = [NSObject alloc];
        
        Person *person = [Person alloc];
        size_t pSize = sizeof(person);
        size_t gSize  = class_getInstanceSize(Person.class);
        size_t mSize = malloc_size((__bridge const void *)(obj));
        NSLog(@"class_getInstanceSize = %zd", gSize);
        NSLog(@"malloc_size = %zd", mSize);
        NSLog(@"sizeOf = %zd", pSize);
        
        struct SimaplePerson y;
        y.age = 20;
        size_t yearSize = sizeof(y);
        
        struct PersonBaseInfo ym;
        ym.weight  = 120;
        ym.height = 180;
        size_t yearWithMonthSize = sizeof(ym);
        
        NSLog(@"y: %lu %lu", yearSize, sizeof(SimaplePerson));
        NSLog(@"ym: %lu", yearWithMonthSize);
        
        NSLog(@"Hello, World!");
        
    }
    return 0;
}
