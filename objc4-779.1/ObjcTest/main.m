//
//  main.m
//  ObjcTest
//
//  Created by neotv on 2020/3/23.
//

#import <Foundation/Foundation.h>
#import "Person.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        Person * obj = [Person alloc];
        Person * obj1 = [obj init];
        Person * obj2 = [obj init];
        NSLog(@"%@ - %p", obj, &obj);
        NSLog(@"%@ - %p", obj1, &obj1);
        NSLog(@"%@ - %p", obj2, &obj2);
    }
    return 0;
}
