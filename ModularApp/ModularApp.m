
@import ModularFramework; // EVERYTHING is imoported through this modular Umbrella framework.

@interface      ModularApp : NSObject // NSObject, etc, as well.

// There is an instance of one of ourt SUb sub umbrella classes instantiated in IB!
@property (weak) IBOutlet SubSubUmbrella * subsubumbrella;

@end

@implementation ModularApp - (void) awakeFromNib {

  [ModularFramework beModular];

  ModularFrameworkClass    * prvt = ModularFrameworkClass.new;

  [self testPrivateIvars:prvt];

  [prvt setValue:@"clang" forKey:@"a"];
  [prvt setValue:@NO      forKey:@"b"];

  [self testPrivateIvars:prvt];

  SubLibPrint( ModularSubLibrary.new );
  SubLibPrint( SubLibRunCLITest()    );
  SubLibPrint( _subsubumbrella );
  SubLibPrint( _subsubumbrella.availableSounds);
 
  
}

- (void) testPrivateIvars:(ModularFrameworkClass*)i {

  SubLibPrint(@"%@ a = %@ b = %@", i, [i valueForKey:@"a"], [[i valueForKey:@"b"]boolValue] ? @"YES" : @"NO");
}

//  setDockIcon([NSImage imageNamed:@"LLVM.logo"]);

@end

SUBLIB_MAIN( return SUBLIB_APP_MAIN(c,v); )


