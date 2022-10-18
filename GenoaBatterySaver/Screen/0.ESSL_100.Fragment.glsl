
varying highp vec2 v_texcoord0;
uniform highp vec4 GreyscaleFactor;
uniform highp vec4 BlitColor;
uniform sampler2D s_BlitTexture;
void main ()
{
  mediump vec4 tmpvar_1;
  lowp vec4 tmpvar_2;
  tmpvar_2 = texture2D (s_BlitTexture, v_texcoord0);
  lowp vec4 tmpvar_3;
  tmpvar_3.w = 1.0;
  tmpvar_3.xyz = mix (((tmpvar_2.xyz * 
    (1.0 - GreyscaleFactor.x)
  ) + (vec3(
    dot (tmpvar_2.xyz, vec3(0.21, 0.71, 0.07))
  ) * GreyscaleFactor.x)), BlitColor.xyz, BlitColor.www);
  tmpvar_1 = tmpvar_3;
  gl_FragColor = tmpvar_1;
}

