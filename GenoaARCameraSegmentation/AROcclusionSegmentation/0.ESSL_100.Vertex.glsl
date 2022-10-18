
attribute highp vec3 a_position;
attribute highp vec3 a_texcoord0;
varying highp vec2 v_texcoord0;
varying highp vec2 v_texcoord1;
uniform vec4 CameraUVTransform[4];
void main ()
{
  highp vec4 tmpvar_1;
  tmpvar_1.zw = vec2(0.0, 1.0);
  tmpvar_1.xy = ((a_position.xy * 2.0) - 1.0);
  highp int tmpvar_2;
  tmpvar_2 = int(a_texcoord0.z);
  v_texcoord0 = CameraUVTransform[tmpvar_2].xy;
  v_texcoord1 = a_texcoord0.xy;
  gl_Position = tmpvar_1;
}

