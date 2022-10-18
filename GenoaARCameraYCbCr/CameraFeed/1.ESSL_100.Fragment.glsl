//NightMode=Off

varying highp vec2 v_texcoord0;
uniform lowp samplerExternalOES s_CameraTextureY;
uniform lowp samplerExternalOES s_CameraTextureCbCr;
void main ()
{
  lowp vec4 tmpvar_1;
  tmpvar_1.w = 1.0;
  tmpvar_1.x = texture2D (s_CameraTextureY, v_texcoord0).x;
  tmpvar_1.yz = texture2D (s_CameraTextureCbCr, v_texcoord0).xy;
  lowp vec4 tmpvar_2;
  tmpvar_2.w = 1.0;
  tmpvar_2.xyz = (mat4(1.0, 1.0, 1.0, 0.0, 0.0, -0.3441, 1.772, 0.0, 1.402, -0.7141, 0.0, 0.0, -0.701, 0.5291, -0.886, 1.0) * tmpvar_1).xyz;
  lowp vec3 tmpvar_3;
  tmpvar_3 = tmpvar_2.xyz;
  mediump vec4 tmpvar_4;
  tmpvar_4.w = 1.0;
  tmpvar_4.xyz = tmpvar_3;
  gl_FragColor = tmpvar_4;
}

