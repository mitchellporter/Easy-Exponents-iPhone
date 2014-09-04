


@interface EEChecklistManager : NSObject

@property (nonatomic) NSMutableArray *swipedCellIdNumbers;

+ (EEChecklistManager *)sharedMMChecklistManager;
- (void)saveChecklist;
- (void)fetchSavedChecklist;

@end
