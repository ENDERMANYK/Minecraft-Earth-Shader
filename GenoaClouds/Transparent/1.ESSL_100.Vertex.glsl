//Instancing=On

attribute highp vec4 a_color0;
attribute highp vec4 a_normal;
attribute highp vec3 a_position;
attribute highp vec2 a_texcoord0;
attribute highp vec4 i_data0;
attribute highp vec4 i_data1;
attribute highp vec4 i_data2;
attribute highp vec4 i_data3;
varying highp vec4 v_color0;
varying highp vec4 v_pos;
varying highp vec2 v_texcoord0;
varying highp vec3 v_viewSpaceNormal;
uniform highp mat4 u_viewProj;
uniform highp mat4 u_modelView;
void main ()
{
  highp vec4 tmpvar_1;
  highp vec4 ndc_2;
  ndc_2.w = 0.001;
  ndc_2.xz = vec2(0.0, 0.0);
  ndc_2.y = 0.0;
  tmpvar_1 = ndc_2;
  ndc_2.xyz = vec3(0.0, 0.0, 0.0);
  highp mat4 model_3;
  model_3[0] = i_data0;
  model_3[1] = i_data1;
  model_3[2] = i_data2;
  model_3[3] = i_data3;
  highp vec4 tmpvar_4;
  tmpvar_4.w = 1.0;
  tmpvar_4.xyz = a_position;
  highp vec4 tmpvar_5;
  tmpvar_5.w = 1.0;
  tmpvar_5.xyz = (model_3 * tmpvar_4).xyz;
  highp vec4 tmpvar_6;
  tmpvar_6.w = 0.0;
  tmpvar_6.xyz = a_normal.xyz;
  v_pos = tmpvar_1;
  v_texcoord0 = a_texcoord0;
  v_color0 = a_color0;
  v_viewSpaceNormal = (u_modelView * tmpvar_6).xyz;
  gl_Position = (u_viewProj * tmpvar_5);
}

