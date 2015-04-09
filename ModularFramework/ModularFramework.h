
/**  ModularFramework.h  *//* © 𝟮𝟬𝟭𝟱 𝖠𝖫𝖤𝖷 𝖦𝖱𝖠𝖸  𝗀𝗂𝗍𝗁𝗎𝖻.𝖼𝗈𝗆/𝗺𝗿𝗮𝗹𝗲𝘅𝗴𝗿𝗮𝘆 */

@import  SubUmbrella;
#import  "ModularSubLibrary.h"

@interface  SidewaysDependentClass : ModularSubLibrary
@end

@interface   ModularFrameworkClass : NSObject
@end

@interface        ModularFramework : NSProxy

+ (void) beModular; /** Mainly proxies as a timer, but also has a few of it's own methods. */

@end

extern CAAnimation * spin (CALayer* l);  // Actually implemented in "ModularSubLibrary", but declared and used here.




//NSString * SubLibRunCLITest();
