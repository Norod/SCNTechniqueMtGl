#include <metal_stdlib>
using namespace metal;
#include <SceneKit/scn_metal>

struct custom_vertex_t
{
    float4 position [[attribute(SCNVertexSemanticPosition)]];
};

constexpr sampler s = sampler(coord::normalized,
                              address::repeat,
                              filter::linear);

struct out_vertex_t
{
    float4 position [[position]];
    float2 uv;
    float sinTime;
};

vertex out_vertex_t pass_through_vertex(custom_vertex_t in [[stage_in]],
                                        constant SCNSceneBuffer& scn_frame [[buffer(0)]])
{
    out_vertex_t out;
    out.position = in.position;    
    out.uv = float2(in.position.x - 1.0, 1.0 - in.position.y) * float(0.5);
    out.sinTime = scn_frame.sinTime;
    return out;
};

fragment half4 displacement_frag(out_vertex_t vert [[stage_in]],
                       texture2d<float, access::sample> colorSampler [[texture(0)]],
                       texture2d<float, access::sample> noiseSampler [[texture(1)]],
                       texture2d<float, access::sample> alphaSampler [[texture(2)]])
{
    float2 displacement = noiseSampler.sample( s, vert.uv).rg - float2(0.5, 0.5);
    float alphaValue = alphaSampler.sample( s, vert.uv).r - float(0.5);
    float4 rgba = float4(colorSampler.sample( s, vert.uv + displacement * float2(0.02, 0.02)).rgb * alphaValue, 1.0 - alphaValue);
    
    return half4(rgba);
};
