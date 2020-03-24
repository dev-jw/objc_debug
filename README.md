##  objc_debug

编译苹果官方源码objc！探索iOS底层原理 ！objc4-779.1可编译版本，可自由LLDB调试！

[![Build Status](https://travis-ci.org/LGCooci/objc4_debug.svg?branch=master)](https://travis-ci.org/LGCooci/objc4_debug)[![Xcode 11.0+](https://img.shields.io/badge/Xcode-11.0%2B-blue.svg?colorA=3caefc&colorB=24292e)](https://developer.apple.com/xcode/)[![VSTS Build](https://alchemistxxd.visualstudio.com/_apis/public/build/definitions/e0656143-5484-4af8-8aa3-01f9baba5da1/1/badge)](https://alchemistxxd.visualstudio.com/Apple%20Open%20Source/_git/objc4)![support](https://img.shields.io/badge/support-macOS%20%7C%20iOS-orange.svg) ![GitHub top language](https://img.shields.io/github/languages/top/0xxd0/objc4.svg?colorB=6866fb) [![Join the chat at https://gitter.im/0xxd0/objc4](https://badges.gitter.im/0xxd0/objc4.svg)](https://gitter.im/0xxd0/objc4?utm_source=badge&utm_medium=badge&utm_campaign=pr-badge&utm_content=badge)

> 无需配置工程，直接clone工程，打开编译调试`Apple` 提供的最新源码 `objc4-779.1`，像我们平常开发代码那样直接 LLDB 调试，流程跟踪。



### 探索alloc的过程

首先，之前在`objc4-750`源码下探索了`alloc`的流程，这次探索一下最新源码 `objc4-779.1`，分析2个版本的源码有哪些区别。



#### 探索所在源码 

1. 符号断点设置alloc
2. 代码跟踪 
3. 汇编跟踪 Debug - Debug WorkFlow -  Always Show Disassembly
4. 符号断点识别



#### alloc源码流程

```mermaid
graph TD

alloc --> _objc_rootAlloc

_objc_rootAlloc --> version{callAlloc}

version -->|version=750| 750[initInstanceIsa]

750 --> initIsa

version -->|version=779.1| 779.1[_objc_rootAllocWithZone]

779.1 --> _class_createInstanceFromZone

_class_createInstanceFromZone --> initInstanceIsa

initInstanceIsa --> initIsa

```



