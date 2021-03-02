# TSIReport





Open Test.workspace， compile dynamicframework target in arm64 iOS device target mode.
Compile it and checkout dynamic framework.framework.

Use command line:
nm DynamicFramework 

0000000000007e64 t -[UseStaticLibrary test]
0000000000007f80 S _DynamicFrameworkVersionNumber
0000000000007f40 S _DynamicFrameworkVersionString
                 U _OBJC_CLASS_$_NSObject
000000000000c0c8 S _OBJC_CLASS_$_UseStaticLibrary
                 U _OBJC_METACLASS_$_NSObject
000000000000c0a0 S _OBJC_METACLASS_$_UseStaticLibrary
0000000000007f28 s __OBJC_$_INSTANCE_METHODS_UseStaticLibrary
000000000000c050 s __OBJC_CLASS_RO_$_UseStaticLibrary
000000000000c008 s __OBJC_METACLASS_RO_$_UseStaticLibrary
0000000000007e8c T __ZN4CppA5test1Ev
0000000000007eb4 T __ZN4CppA5test2Ev
0000000000007edc T __ZN4CppA5test3Ev
000000000000c0f0 d __dyld_private
                 U __objc_empty_cache
                 U _printf
                 U dyld_stub_binder



We can see symbols of test1,test2,test3 are all there.
I already turn on Link Time Optimization, which means only test2 should be there, we shouldn't link test1,test3.

The same result happens when we use testApp link against static library. The symbols are still there, not strip or optimized.


However If we open macLibrary folder, open Untitiled.xcworkspace.
Compile mac command line and net.framework, they both link against net-static library and only called ffffff2 function.
after compile and use command line : nm    check those target symbols.

Turns out mac command line was able to optimized unused function and net.framework can't.

https://llvm.org/docs/LinkTimeOptimization.html

above document we tried, also works, but why it doesn't work in xcode ios app and framework, mac framework, only works in mac command line executable app?




