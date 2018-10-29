uniform sampler2D colorSampler;
uniform sampler2D noiseSampler;
uniform sampler2D alphaSampler;

varying vec2 uv;

void main() {
    vec2 displacement = texture2D(noiseSampler, uv).rg - vec2(0.5, 0.5);
    float alphaValue = texture2D(alphaSampler, uv).r - float(0.5);
    vec3 rgb = texture2D(colorSampler, uv + displacement * vec2(0.02,0.02)).rgb;
    vec4 rgba = vec4(rgb * alphaValue, 1.0 - alphaValue);
    gl_FragColor = rgba;
}
