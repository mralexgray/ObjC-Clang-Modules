
/**  ModularFramework.h  *//* © 𝟮𝟬𝟭𝟯 𝖠𝖫𝖤𝖷 𝖦𝖱𝖠𝖸  𝗀𝗂𝗍𝗁𝗎𝖻.𝖼𝗈𝗆/𝗺𝗿𝗮𝗹𝗲𝘅𝗴𝗿𝗮𝘆 */


#import   "ModularSubLibrary.h"
#import  "SubUmbrella.h"

#define NSAPPMAIN NSApplicationMain

@interface         SidewaysDep : ModularSubLibrary
@end

@interface         PrivateIvar : NSObject
@end

@interface    ModularFramework : NSProxy        + (void) beModular; /** Mainly proxies as a timer, but also has a few of it's own methods. */
@end

CAAnimation * spin (CALayer* l);  // Actually implemented in "ModularSubLibrary", but declared and used here.

//NSString * SubLibRunCLITest();
