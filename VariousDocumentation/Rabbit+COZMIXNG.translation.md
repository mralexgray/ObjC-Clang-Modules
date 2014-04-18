<kbd>Translated version of Rabbit+COZMIXNG.pdf</kbd>
---

####Page 1
Clang Full Modules Cocoa barely be # 62 / 2013-10-19 / Kimura crossing Powered by Rabbit 2.1.1 and COZMIXNG
####Page 2
Highlights of Xcode 5 Compiler Modules for system frameworks to speed build time Auto Link frameworks imported by code modules (...) "Whats New in Xcode"
####Page 3
Modules Xcode 5 (Clang 3.3) Full of new functions iOS 7 or Mac OS X 10.9 C, Objective-C (C + + not ready)
####Page 4
Shabuっちゃけ, thou san ma ri Genki ni yo te ku Kei Shinano Xcode ga yo ni ki はka ra te kuれっru
####Page 5
Modules But co Lymph test suitable speed ku na ru (ra expands Kei) Thou ru kind Full precompiled header module Unitでperfect Suiナreをgeneration ASTをSilysia Ann Suiズexpands ra taもFull (ra expands Kei) But u san san fragile rice bran Full Profileをはhe see te ne.
####Page 6
Modules @ import / / Including header file # Import <Foundation/Foundation.h> # Import <Foundation/NSString.h> / / Using Modules @ Import Foundation; @ Import Foundation.NSString; Thouっとーma ku + import. ヘッdie phi holds an Hikaru nameでji na ku Rue have suitable nameをbook ku. Typicallyヘッdie phi ji Rue holds an Hikaru nameとはsameじhave suitable name.
####Page 7
Modules Auto Link Uードthe ni @ import → Fullをもnecessary automatic na ni ri nn ku. Ri nn ku su ru ra riやSui Bra gift Ritz one woods Wakuー But do not ni ku Full instructions.
####Page 8
Modules Auto Linking clangをdirect ru na ta ta ~ te ra, ri nn Cal But we wrote Io plastic Shin Do ni. -Llib -Framework f Standard Full places ni na-i-ki,-I-Fはやnecessary
####Page 9
Then koとす modules by borrowers (Economic Mi) module.map Try expands te mi-ru clang-3.4でnew Full Function (Full predetermined)
####Page 10
module.map Rue holds an ji have suitableをdefine su ru phi Hikaru. Koれさればえthou Sui Bra ri ra, one woods gift Ritz But Wakuーku holds an Applied ji ni Rue have suitable Producers. module.map Full bodyはTe goes in strike
####Page 11
module.map $ Cd `xcrun - sdk iphoneos - Show-sdk-path ` $ Find.-Name module.map : . / System / Library / Frameworks / Foundation.framework / module.map : . / System / Library / Frameworks / StoreKit / module.map :
####Page 12
module.map . / System / Library / Frameworks / UIKit.framework / module.map : . / Usr / include / module.map . / Usr / include / objc / module.map 10.9はnot re Lease da ka ra, iOS7 Full SDK ni ru module.mapをthou see te Mi Yo u. Gift Ritz one woods Wakuーッkuとinludeとヘdie phi Hikaru But thouっta ni yo u na places But set module.map Kei te kaれru.
####Page 13
Foundation.framework / module.map framework module Foundation [system] { umbrella header "Foundation.h" export * module * { export * } module.map Full of themselves. Full details expands kuはドClang goes Rue Suites see me nn te ne.
####Page 14
/ Usr / include / module.map module Darwin [system] { / / Headers that are repeatedly included, and / / Assigned to any given module. exclude header "_structs.h" exclude header "sys / _structs.h" module cdefs { header "sys / cdefs.h" export * }
####Page 15
/ Usr / include / module.map / / C standard library module C { module complex { header "complex.h" export * } :
####Page 16
"Module Map Language" Changes wa mada mada Resona u. clang 3.4 to aboutで Increase ~ te ruもlanguage. iOS7 SDKではmake te na waれもKei function. config_macros conflict link Rue holds an ji have suitableとSui Bra ra ri User NameちBut uとki ni link so u pop Kei.
####Page 17
"Module declaration" Name.framework / module.map / * Module map file * / Headers / Frameworks / Resources / Name Next. Framework Full module.mapをすstrongly set ku ni yo u ni naっKei te ru.
####Page 18
Soっte mi-ru iOS 7.0 SDKをreference ni, Mountain Lion Module.mapをっzu ni koむ! framework module Foundation [system] { umbrella header "Foundation.h" export * module * { export * } }
####Page 19
mod1.m / Fullやでtoday ma ri party # Import <Foundation/Foundation.h> int main (int argc, const char * argv []) { @ Autoreleasepool { NSLog (@ "Hello, modules!"); } return 0; }
####Page 20
mod1.m / Fullやでtoday ma ri party % Clang mod1.m-o mod1 -Framework Foundation # Framework name ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ % Otool-L mod1 mod1: / System / Library / Frameworks / Foundation.framework / Versions / C / Foundation (...) :
####Page 21
mod2.m / Modulesをmake u @ Import Foundation; / * ^ ^ ^ ^ Using modules * / int main (int argc, const char * argv []) { @ Autoreleasepool { NSLog (@ "Hello, modules!"); } return 0; }
####Page 22
mod2.m / Modulesをmake u % Clang mod2.m-o mod2-fmodules # No-framework ^ ^ ^ ^ ^ ^ ^ ^ ^ % Otool-L mod2 mod2: : / System / Library / Frameworks / Foundation.framework / Versions / C / Foundation (...)
####Page 23
# ImportをReading Mi ni @ import forえ % Clang mod1.m-o mod1-fmodules % ./mod1 2013-10-18 ... [] Hello, modules! # Works fine! ソーsu coードinは# import holds an ji ni na Full Rue have suitable But so ~ te ru. Ri nn ku su ru one woods gift Ritz-framework Wakuーkuをでdesignated expands Kei te na → automatic ri nn But te ru ku function expands.
####Page 24
autolinkをinvalid ni % Clang mod1.m-o mod1-fmodules -Fno-autolink # disable autolink ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ Undefined symbols for architecture x86_64: "_NSLog", Referenced from: _main in mod1-dTLx89.o :
####Page 25
XcodeでFull Set CLANG_ENABLE_MODULES: YES →-fmodules CLANG_MODULES_AUTOLINK: NO →-fno-autolink
####Page 26
Full ma ko ko maでとrather But thouればmodules module.map But so えru # Import-fmodulesでも@ importと Xie Shiされexpands te ru → Do Uードcorrection Apple versionでna Kei, clang-3.3でもsame specifications
####Page 27
mod3.m / cache @ Import Foundation.NSObjCRuntime; / * ^ ^ ^ ^ Using modules * / int main (int argc, const char * argv []) { @ Autoreleasepool { NSLog (@ "Hello, modules!"); } return 0; }
####Page 28
mod3.m / cache % Clang mod3.m-o mod3-fmodules -Fmodules-cache-path =. / Tmp % Find. / Tmp . / Tmp ./tmp/B76TNZTEB88L ./tmp/B76TNZTEB88L/_Builtin_intrinsics.pcm ./tmp/B76TNZTEB88L/Foundation.pcm ./tmp/B76TNZTEB88L/modules.idx . / Tmp / modules.timestamp
####Page 29
mod3.m / cache % Clang-module-file-info . / Tmp / ... / Foundation.pcm Information for module file '. / Tmp / .. / Foundation.pcm.': Generated by this Clang: (clang-500.2.75) Language options: C99: Yes C11: No Microsoft extensions: No :
####Page 30
mod3.m / cache .% Strings / tmp / .. / Foundation.pcm. | grep ^ NS NS, I NSs @ NSGreaterThanPredicateOperatorType NSURLRequest NSInvalidArchiveOperationException : ShinボHikaruもintoっte ru pop Kei.
####Page 31
Problems modules do not solve Rewrite the world's code Versioning Namespaces Binary distribution of modules "Clang 3.3 documentation"
####Page 32
clang-3.4 modules C + + support (experimental) compiler options -Fmodule-maps,-fmodule-map- file, ... module map lang private, extern, use
####Page 33
clang-3.4 modularize clang-tools-extra generate module.map (r192703) ヘッdie phi Hikaru ka ra su ru generating function module.mapをされta But added.
####Page 34
Resources Clang documentation WWDC 2013
####Page 35
Impression Uniーザ(R & D by) But AMARI Genki naさをback Te moo ma ku ku ku Kei yo u, yo ku readyさ れte ru Changes wa mada mada Resona u ヘッda na ku module GreetingとででHealth Unit A su ru koとでForward-bread have ma nn gift Jia Keiでsu Ru?
####Page 36
End Powered by Rabbit 2.1.1 and COZMIXNG