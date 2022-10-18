
varying highp vec2 v_texcoord0;
uniform lowp samplerExternalOES s_CameraTexture;
void main ()
{
  mediump vec4 tmpvar_1;
  lowp vec4 tmpvar_2;
  tmpvar_2.w = 1.0;
  tmpvar_2.xyz = texture2D (s_CameraTexture, v_texcoord0).xyz;
  tmpvar_1 = tmpvar_2;
  gl_FragColor = tmpvar_1;
}

