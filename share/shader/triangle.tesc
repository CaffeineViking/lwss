#version 410

layout(vertices = 4) out;

in PipelineData {
    vec3 position;
    vec3 normal;
    vec2 texture_coordinate;
} tc_in[];

#pragma include("matrices.glsl")

out PipelineData {
    vec3 position;
    vec3 normal;
    vec2 texture_coordinate;
} tc_out[];

void main() {
    tc_out[gl_InvocationID].normal = tc_in[gl_InvocationID].normal;
    tc_out[gl_InvocationID].texture_coordinate = tc_in[gl_InvocationID].texture_coordinate;
    tc_out[gl_InvocationID].position = tc_in[gl_InvocationID].position;

    gl_TessLevelInner[0] = 1; gl_TessLevelInner[1] = 1;
    gl_TessLevelOuter[0] = 1; gl_TessLevelOuter[1] = 1;
    gl_TessLevelOuter[2] = 1; gl_TessLevelOuter[3] = 1;
}