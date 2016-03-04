#ifdef GL_ES
precision mediump float;
#endif

#define light vec3(1.4, 0.4, 0.7)

#define ambient_color vec3(0.2, 0.0, 0.0)
#define diffuse_color vec3(0.6, 0.0, 0.0)
#define specular_color vec3(1.0, 1.0, 1.0)

uniform vec2 u_resolution;
uniform float u_time;

varying vec3 v_position;
varying vec3 v_normal;

void main()
{
	vec2 uv = gl_FragCoord.xy/u_resolution.xy;
	float diffuse = max(dot(normalize(v_normal), normalize(light)), 0.0);
	vec3 camera_dir = normalize(-v_position);
	vec3 half_direction = normalize(normalize(light) + camera_dir);
	float specular = pow(max(dot(half_direction, normalize(v_normal)), 0.0), 16.0);
	gl_FragColor = vec4(ambient_color + diffuse * diffuse_color + specular * specular_color, 1.0);


}