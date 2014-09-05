

#import "EEChecklistManager.h"
#import "EEAppDelegate.h"

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
    if (!self.swipedCellIdNumbers) {
        self.swipedCellIdNumbers = [[NSMutableArray alloc]init];
    }
    
    for (NSNumber *swipedCellIdNumber in self.swipedCellIdNumbers) {

    EEAppDelegate *appDelegate =
    [[UIApplication sharedApplication] delegate];
    
    NSManagedObjectContext *context =
    [appDelegate managedObjectContext];
    NSManagedObject *cellIdNumber;
    
    cellIdNumber = [NSEntityDescription
                  insertNewObjectForEntityForName:@"Cell_Id_Numbers"
                  inManagedObjectContext:context];
    
    [cellIdNumber setValue:swipedCellIdNumber forKey:@"id_number"];
   
    NSError *error;
    [context save:&error];
        
    }
}

- (void)fetchSavedChecklist
{
    if (!self.swipedCellIdNumbers) {
        self.swipedCellIdNumbers = [[NSMutableArray alloc]init];
    }
    
   EEAppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];
    
    NSManagedObjectContext *context =
    [appDelegate managedObjectContext];
    
    NSEntityDescription *entityDesc =
    [NSEntityDescription entityForName:@"Cell_Id_Numbers"
                inManagedObjectContext:context];
    
    NSFetchRequest *request = [[NSFetchRequest alloc] init];
    [request setEntity:entityDesc];
    
    NSError *error;
    NSArray *objects = [context executeFetchRequest:request
                                              error:&error];
    
    if ([objects count] == 0) {
        NSLog(@"No swiped cells persisted.");
        
    } else {
        
        //Lop through returned objects, create NSNumbers,
        //and add NSNumbers to swipedCellRows
        for (id object in objects) {
            
            NSManagedObject *managedObject = object;
            NSNumber *finalCellIdNumber = [managedObject valueForKey:@"id_number"];
            [self.swipedCellIdNumbers addObject:finalCellIdNumber];
            
        }
        

    }
}

@end
