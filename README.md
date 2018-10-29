# SCNTechniqueMtGl

I wanted to see if I can produce a multi target SceneKit project with SCNTechnique which supports both Metal as well as GL shaders. It seems to indeed be supported. 

Targets include macOS, tvOS, iOS but I was not able to figure out how to attach the SCNTechnique object to a watchOS WKInterfaceSCNScene object.

The shaders apply a simple displacament map based on [this tutorial](http://blog.simonrodriguez.fr/articles/26-08-2015_a_few_scntechnique_examples.html) and a simple alpha mask from an external image. I leanred how to add Metal shaders by [browsing this repo](https://github.com/lachlanhurst/SCNTechniqueTest).