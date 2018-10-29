//
//  InterfaceController.m
//  SCNTechnique watchOS App Extension
//
//  Created by Doron Adler on 28/10/2018.
//  Copyright © 2018 Doron Adler. All rights reserved.
//

#import "InterfaceController.h"
#import "GameController.h"

@interface InterfaceController ()

@property (strong, nonatomic) IBOutlet WKInterfaceSCNScene *scnInterface;
@property (strong, nonatomic) GameController *gameController;

@end

@implementation InterfaceController

- (void)awakeWithContext:(id)context {
    [super awakeWithContext:context];
    
    self.gameController = [[GameController alloc] initWithWatchSceneRenderer:self.scnInterface];
    
    NSString *pathToJSON = [[NSBundle mainBundle] pathForResource:@"sDisplacementMappingTechnique" ofType:@"json"];
    NSData *jsonData = [NSData dataWithContentsOfFile:pathToJSON];
    
    NSError *error = nil;
    NSDictionary<NSString *,id> *techniqueDict = [NSJSONSerialization JSONObjectWithData:jsonData options:(0) error:&error];
    //self.scnInterface.technique = [SCNTechnique techniqueWithDictionary:techniqueDict];
}

- (IBAction)handleTap:(WKTapGestureRecognizer *)gestureRecognize {
    // Highlight the tapped nodes
    CGPoint p = gestureRecognize.locationInObject;
    [self.gameController highlightNodesAtPoint:p];
}

- (void)willActivate {
    // This method is called when watch view controller is about to be visible to user
    [super willActivate];
}

- (void)didDeactivate {
    // This method is called when watch view controller is no longer visible
    [super didDeactivate];
}

@end
