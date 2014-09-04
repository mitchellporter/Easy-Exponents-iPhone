


@interface EEChecklistManager : NSObject

@property (nonatomic) NSMutableArray *swipedCellRows;

+ (EEChecklistManager *)sharedMMChecklistManager;
- (void)saveChecklist;
- (void)fetchSavedChecklist;

@end
