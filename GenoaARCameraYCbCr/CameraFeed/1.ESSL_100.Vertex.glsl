//NightMode=Off

attribute highp vec3 a_position;
attribute highp vec3 a_texcoord0;
varying highp vec2 v_texcoord0;
uniform vec4 CameraUVTransform[4];
uniform highp vec4 CameraColor;
void main ()
{
  highp vec4 tmpvar_1;
  highp vec2 texCoordOut_2;
  highp vec4 tmpvar_3;
  tmpvar_3.zw = vec2(0.0, 1.0);
  tmpvar_3.xy = ((a_position.xy * 2.0) - 1.0);
  tmpvar_1.yzw = tmpvar_3.yzw;
  highp int tmpvar_4;
  tmpvar_4 = int(a_texcoord0.z);
  highp vec2 tmpvar_5;
  tmpvar_5 = CameraUVTransform[tmpvar_4].xy;
  texCoordOut_2.x = tmpvar_5.x;
  highp float tmpvar_6;
  tmpvar_6 = abs(((tmpvar_5.y * 2.0) - 1.0));
  tmpvar_1.x = (tmpvar_3.x / tmpvar_6);
  tmpvar_1.xy = (tmpvar_1.xy * CameraColor.ww);
  texCoordOut_2.y = (((tmpvar_5.y - 0.5) / tmpvar_6) + 0.5);
  v_texcoord0 = texCoordOut_2;
  gl_Position = tmpvar_1;
}

