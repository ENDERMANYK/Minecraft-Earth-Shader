
attribute highp vec3 a_position;
attribute highp vec2 a_texcoord0;
varying highp vec2 v_texcoord0;
uniform highp mat4 u_modelViewProj;
void main ()
{
  highp vec4 tmpvar_1;
  tmpvar_1.w = 1.0;
  tmpvar_1.xyz = a_position;
  v_texcoord0 = a_texcoord0;
  gl_Position = (u_modelViewProj * tmpvar_1);
}

