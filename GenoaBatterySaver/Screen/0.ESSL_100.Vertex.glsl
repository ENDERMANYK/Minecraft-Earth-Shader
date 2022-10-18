
attribute highp vec3 a_position;
attribute highp vec3 a_texcoord0;
varying highp vec2 v_texcoord0;
uniform highp vec4 AspectRatio;
void main ()
{
  highp vec4 tmpvar_1;
  highp vec4 tmpvar_2;
  tmpvar_2.zw = vec2(0.0, 1.0);
  tmpvar_2.xy = ((a_position.xy * 2.0) - 1.0);
  tmpvar_1.zw = tmpvar_2.zw;
  tmpvar_1.x = (tmpvar_2.x * 0.8);
  tmpvar_1.y = (((tmpvar_2.y * AspectRatio.x) * 0.8) / AspectRatio.y);
  highp vec2 tmpvar_3;
  tmpvar_3.x = a_texcoord0.x;
  tmpvar_3.y = (1.0 - a_texcoord0.y);
  v_texcoord0 = tmpvar_3;
  gl_Position = tmpvar_1;
}

