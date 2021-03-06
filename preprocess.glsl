#version 330

in vec2 texCoord;

layout(location = 0) out vec4 outColor;

uniform sampler2D img;
uniform sampler2D base;

//lut containing F inverse
uniform sampler1D Finverse;

void main() {
	float scale = (256 - 1.0) / 256;
	float offset = 1.0 / (2.0 * 256);

	vec4 p = texture(img, texCoord);
	vec4 q = texture(base, texCoord);
	outColor.r = texture(Finverse, (p.r*scale) + offset).r - q.r;
	outColor.g = texture(Finverse, (p.g*scale) + offset).r - q.g;
	outColor.b = texture(Finverse, (p.b*scale) + offset).r - q.b;
	outColor = max(outColor, vec4(0.0, 0.0, 0.0, 1.0));
}

