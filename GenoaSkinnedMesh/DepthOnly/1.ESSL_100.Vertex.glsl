//Instancing=On

attribute highp float a_indices;
attribute highp vec4 a_normal;
attribute highp vec3 a_position;
attribute highp vec4 i_data0;
attribute highp vec4 i_data1;
attribute highp vec4 i_data2;
attribute highp vec4 i_data3;
varying highp vec4 v_color0;
varying highp vec4 v_fog;
varying highp vec4 v_light;
varying highp vec2 v_texcoord0;
varying highp vec3 v_viewSpaceNormal;
varying highp vec4 v_viewSpacePosition;
varying highp vec4 v_worldSpacePosition;
uniform highp mat4 u_viewProj;
uniform mat4 u_model[32];
uniform highp vec4 FogControl;
uniform highp vec4 OverlayColor;
uniform highp vec4 FogColor;
uniform vec4 BoneVectors[48];
uniform highp vec4 PlayerPosition;
highp mat4 World;
void main ()
{
  World = u_model[0];
  highp int tmpvar_1;
  tmpvar_1 = int(a_indices);
  highp vec3 tmpvar_2;
  highp float lightIntensity_3;
  highp vec4 tmpvar_4;
  tmpvar_4.w = 0.0;
  tmpvar_4.xyz = a_normal.xyz;
  highp vec4 tmpvar_5;
  tmpvar_5 = normalize((World * tmpvar_4));
  lightIntensity_3 = (((
    ((0.275 * (1.0 + tmpvar_5.y)) + ((tmpvar_5.x * tmpvar_5.x) * -0.1))
   + 
    ((tmpvar_5.z * tmpvar_5.z) * 0.1)
  ) + 0.45) + (OverlayColor.w * 0.35));
  highp vec4 tmpvar_6;
  tmpvar_6.w = 1.0;
  tmpvar_6.x = lightIntensity_3;
  tmpvar_6.y = lightIntensity_3;
  tmpvar_6.z = lightIntensity_3;
  highp vec4 tmpvar_7;
  tmpvar_7.w = 1.0;
  tmpvar_7.xyz = a_position;
  tmpvar_2.x = dot (tmpvar_7, BoneVectors[(tmpvar_1 * 3)]);
  tmpvar_2.y = dot (tmpvar_7, BoneVectors[((tmpvar_1 * 3) + 1)]);
  tmpvar_2.z = dot (tmpvar_7, BoneVectors[((tmpvar_1 * 3) + 2)]);
  highp vec4 tmpvar_8;
  highp mat4 model_9;
  model_9[0] = i_data0;
  model_9[1] = i_data1;
  model_9[2] = i_data2;
  model_9[3] = i_data3;
  highp vec4 tmpvar_10;
  tmpvar_10.w = 1.0;
  tmpvar_10.xyz = tmpvar_2;
  highp vec4 tmpvar_11;
  tmpvar_11.w = 1.0;
  tmpvar_11.xyz = (model_9 * tmpvar_10).xyz;
  tmpvar_8 = (u_viewProj * tmpvar_11);
  highp vec4 tmpvar_12;
  tmpvar_12.w = 1.0;
  tmpvar_12.xyz = tmpvar_2;
  highp vec3 tmpvar_13;
  tmpvar_13 = (PlayerPosition.xyz - (World * tmpvar_12).xyz);
  highp float tmpvar_14;
  tmpvar_14 = (sqrt(dot (tmpvar_13, tmpvar_13)) / FogControl.z);
  highp float tmpvar_15;
  tmpvar_15 = (FogControl.y - FogControl.x);
  highp float tmpvar_16;
  tmpvar_16 = sign(tmpvar_15);
  highp float tmpvar_17;
  if ((tmpvar_16 > 0.0)) {
    tmpvar_17 = sign(tmpvar_15);
  } else {
    tmpvar_17 = 0.0;
  };
  highp vec4 tmpvar_18;
  tmpvar_18.xyz = FogColor.xyz;
  tmpvar_18.w = (tmpvar_17 * clamp ((
    (tmpvar_14 - FogControl.x)
   / tmpvar_15), 0.0, 1.0));
  v_texcoord0 = vec2(0.0, 0.0);
  v_viewSpacePosition = vec4(0.0, 0.0, 0.0, 0.0);
  v_color0 = vec4(0.0, 0.0, 0.0, 0.0);
  v_viewSpaceNormal = vec3(0.0, 0.0, 0.0);
  v_worldSpacePosition = vec4(0.0, 0.0, 0.0, 0.0);
  v_fog = tmpvar_18;
  v_light = tmpvar_6;
  gl_Position = tmpvar_8;
}

