//
//  SharedConfiguration.h
//  SCNTechnique
//
//  Created by Doron Adler on 28/10/2018.
//  Copyright © 2018 Doron Adler. All rights reserved.
//

#ifndef SharedConfiguration_h
#define SharedConfiguration_h

#if !defined(_STRINGIFY)
#define __STRINGIFY( _x )   # _x
#define _STRINGIFY( _x )   __STRINGIFY( _x )
#endif

/*
 Listing 1 shows an example definition dictionary for a technique that uses displacement mapping with a noise texture to postprocess a rendered scene. For ease of reading, the dictionary is formatted in JSON syntax. (To load an NSDictionary object from text in this format, use the NSJSONSerialization class.) Listing 2 and Listing 3 show the GLSL source code for the technique’s vertex and fragment shaders.
 */


static const char* sDisplacementMappingVertexShader = _STRINGIFY(\n
                                                                 \n attribute vec4 a_position;
                                                                 \n varying vec2 uv;
                                                                 \n
                                                                 \n void main() {
                                                                 \n     gl_Position = a_position;
                                                                 \n     uv = (a_position.xy + 1.0) * 0.5;
                                                                 \n }
                                                                 );

static const char* sDisplacementMappingFragmentShader = _STRINGIFY(\n
                                                                 \n uniform sampler2D colorSampler;
                                                                 \n uniform sampler2D noiseSampler;
                                                                 
                                                                 \n varying vec2 uv;
                                                                 
                                                                 \n void main() {
                                                                 \n     vec2 displacement = texture2D(noiseSampler, uv).rg - vec2(0.5, 0.5);
                                                                 \n     gl_FragColor = texture2D(colorSampler, uv + displacement * vec2(0.1,0.1));
                                                                 \n }
                                                                 );

#endif /* SharedConfiguration_h */
