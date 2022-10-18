//Instancing=On

attribute highp vec4 a_color0;
attribute highp float a_indices;
attribute highp vec3 a_position;
attribute highp vec2 a_texcoord0;
attribute highp vec2 a_texcoord1;
attribute highp vec2 a_texcoord2;
attribute highp vec4 i_data0;
attribute highp vec4 i_data1;
attribute highp vec4 i_data2;
attribute highp vec4 i_data3;
varying highp vec4 v_color0;
varying highp vec2 v_texcoord0;
uniform highp mat4 u_viewProj;
uniform highp vec4 Thickness;
uniform vec4 BoneVectors[48];
void main ()
{
  highp int tmpvar_1;
  tmpvar_1 = int(a_indices);
  highp vec3 tmpvar_2;
  highp vec3 tmpvar_3;
  tmpvar_3.xy = a_texcoord1;
  tmpvar_3.z = a_texcoord2.x;
  tmpvar_2 = (a_position + ((
    (tmpvar_3 * 2.0)
   - 1.0) * (Thickness.x / 16.0)));
  highp vec4 tmpvar_4;
  tmpvar_4.w = 1.0;
  tmpvar_4.xyz = tmpvar_2;
  tmpvar_2.x = dot (tmpvar_4, BoneVectors[(tmpvar_1 * 3)]);
  tmpvar_2.y = dot (tmpvar_4, BoneVectors[((tmpvar_1 * 3) + 1)]);
  tmpvar_2.z = dot (tmpvar_4, BoneVectors[((tmpvar_1 * 3) + 2)]);
  highp mat4 model_5;
  model_5[0] = i_data0;
  model_5[1] = i_data1;
  model_5[2] = i_data2;
  model_5[3] = i_data3;
  highp vec4 tmpvar_6;
  tmpvar_6.w = 1.0;
  tmpvar_6.xyz = tmpvar_2;
  highp vec4 tmpvar_7;
  tmpvar_7.w = 1.0;
  tmpvar_7.xyz = (model_5 * tmpvar_6).xyz;
  v_texcoord0 = a_texcoord0;
  v_color0 = a_color0;
  gl_Position = (u_viewProj * tmpvar_7);
}

