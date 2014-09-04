

#import "EEChecklistManager.h"

#pragma mark - Static Variables
static NSString *kSavedSwipedCellRows = @"savedSwipedCellRows";

@implementation EEChecklistManager

#pragma mark - Singleton
+ (EEChecklistManager *)sharedMMChecklistManager
{
    static EEChecklistManager *sharedMMChecklistManager = nil;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        sharedMMChecklistManager = [[self alloc]init];
    });
    return sharedMMChecklistManager;
}

#pragma mark - Instance methods
- (void)saveChecklist
{
    if (!self.swipedCellRows) {
        self.swipedCellRows = [[NSMutableArray alloc]init];
    }

    NSUserDefaults *standardDefaults = [NSUserDefaults standardUserDefaults];
    [standardDefaults setObject:[NSKeyedArchiver archivedDataWithRootObject:self.swipedCellRows] forKey:kSavedSwipedCellRows];
}

- (void)fetchSavedChecklist
{
    if (!self.swipedCellRows) {
        self.swipedCellRows = [[NSMutableArray alloc]init];
    }
    
    NSUserDefaults *standardDefaults = [NSUserDefaults standardUserDefaults];
    NSData *data = [standardDefaults objectForKey:kSavedSwipedCellRows];
    self.swipedCellRows = [NSKeyedUnarchiver unarchiveObjectWithData:data];   
}

@end
