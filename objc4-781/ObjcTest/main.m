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
//@property (nonatomic, strong) NSString *name;
//@property (nonatomic, strong) NSString *nickName;
//
//@property (nonatomic, assign) char a;
//@property (nonatomic, assign) char b;
//
//@property (nonatomic, assign) int age;
//@property (nonatomic, assign) int height;

@end

@implementation Person

@end

struct Year {
    int year;
}Year;

struct YearWithMonth {
    int year;
    int month;
}YearWithMonth;


int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        
        NSObject *obj = [NSObject alloc];
//
        Person *person = [Person alloc];
        size_t pSize = sizeof(person);
        size_t gSize  = class_getInstanceSize(Person.class);
        size_t mSize = malloc_size((__bridge const void *)(person));
        
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
