
attribute highp vec3 a_position;
attribute highp vec3 a_texcoord0;
varying highp vec2 v_texcoord0;
void main ()
{
  highp vec4 tmpvar_1;
  tmpvar_1.zw = vec2(0.0, 1.0);
  tmpvar_1.xy = ((a_position.xy * 2.0) - 1.0);
  v_texcoord0 = a_texcoord0.xy;
  gl_Position = tmpvar_1;
}

