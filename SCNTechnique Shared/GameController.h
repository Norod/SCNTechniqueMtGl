//
//  GameController.h
//  SCNTechnique Shared
//
//  Created by Doron Adler on 28/10/2018.
//  Copyright © 2018 Doron Adler. All rights reserved.
//

#import <SceneKit/SceneKit.h>


@interface GameController : NSObject <SCNSceneRendererDelegate>

@property (strong, readonly) SCNScene *scene;
@property (strong, readonly) id <SCNSceneRenderer,SCNTechniqueSupport> sceneRenderer;

- (instancetype)initWithSceneRenderer:(id <SCNSceneRenderer, SCNTechniqueSupport>)sceneRenderer;
- (instancetype)initWithWatchSceneRenderer:(id <SCNSceneRenderer>)sceneRenderer;

- (void)highlightNodesAtPoint:(CGPoint)point;

@end
