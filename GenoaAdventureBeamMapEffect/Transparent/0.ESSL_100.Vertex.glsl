
attribute highp vec4 a_color0;
attribute highp vec3 a_position;
attribute highp vec2 a_texcoord0;
varying highp vec4 v_color0;
varying highp vec2 v_texcoord0;
varying highp vec3 v_worldPosition;
uniform mat4 u_model[32];
uniform highp mat4 u_modelViewProj;
void main ()
{
  highp vec4 tmpvar_1;
  tmpvar_1.w = 1.0;
  tmpvar_1.xyz = a_position;
  highp vec4 tmpvar_2;
  tmpvar_2.w = 1.0;
  tmpvar_2.xyz = a_position;
  v_texcoord0 = a_texcoord0;
  v_worldPosition = (u_model[0] * tmpvar_2).xyz;
  v_color0 = a_color0;
  gl_Position = (u_modelViewProj * tmpvar_1);
}

