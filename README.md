ObjC-Clang-Modules
==================

Reduce clutter, speed up compilations, etc. by using (and writing your own!) clang "modules"

What used to involve LOTS of moving pieces....

* Link to a framework via `ld`, á la.. `clang -framework Cocoa main.m -o MyApp`
* Import headers, á la `#import <Cocoa/Cocoa.h>`
* Icky precompiled headers, and their littany of woes.

Now (Xcode5, OSX 10.9) is as simple as...

```bash
CLANG_ENABLE_MODULES   = YES
CLANG_MODULES_AUTOLINK = YES
```
aka
`clang -fmodules ...`

```objective-c
@import Cocoa;
```

No linker flags, nothing, zilcha, nada zero.  No muss, no fuss.  

* Get rid of `YourProject-Prefix.pch`!
* Delete the `Frameworks` group from Xcode projects.
* Purge the `Link to Frameworks` build phase!
* Buiild faster, and smile, it's Objc, not Chekov!

BONUS:

Although you'll be hard-pressed to find even a mention of "modules" on Apple's site.. and that 

> [At this time, modules are only available for Apple’s frameworks. and have been implicitly disabled for C++.](http://stoneofarc.wordpress.com/2013/06/25/introduction-to-objective-c-modules/)

...it IS INDEED possible to "write your own modules!".  Fork this repo to find out how!

Now you can import YOUR OWN frameworks with a simple.

`@import ModularFramework`

Genius!

