//NightMode=On

varying highp vec2 v_texcoord0;
uniform highp vec4 MultiplyColor;
uniform highp vec4 OverlayColor;
uniform highp vec4 DarkenColor;
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
  tmpvar_3 = (((tmpvar_2.xyz * MultiplyColor.xyz) * MultiplyColor.w) + (tmpvar_2.xyz * (1.0 - MultiplyColor.w)));
  lowp vec3 tmpvar_4;
  lowp float tmpvar_5;
  if ((tmpvar_3.x < 0.5)) {
    tmpvar_5 = ((2.0 * tmpvar_3.x) * OverlayColor.x);
  } else {
    tmpvar_5 = (1.0 - ((2.0 * 
      (1.0 - tmpvar_3.x)
    ) * (1.0 - OverlayColor.x)));
  };
  lowp float tmpvar_6;
  if ((tmpvar_3.y < 0.5)) {
    tmpvar_6 = ((2.0 * tmpvar_3.y) * OverlayColor.y);
  } else {
    tmpvar_6 = (1.0 - ((2.0 * 
      (1.0 - tmpvar_3.y)
    ) * (1.0 - OverlayColor.y)));
  };
  lowp float tmpvar_7;
  if ((tmpvar_3.z < 0.5)) {
    tmpvar_7 = ((2.0 * tmpvar_3.z) * OverlayColor.z);
  } else {
    tmpvar_7 = (1.0 - ((2.0 * 
      (1.0 - tmpvar_3.z)
    ) * (1.0 - OverlayColor.z)));
  };
  lowp vec3 tmpvar_8;
  tmpvar_8.x = tmpvar_5;
  tmpvar_8.y = tmpvar_6;
  tmpvar_8.z = tmpvar_7;
  tmpvar_4 = ((tmpvar_8 * OverlayColor.w) + (tmpvar_3 * (1.0 - OverlayColor.w)));
  lowp vec3 tmpvar_9;
  highp vec3 blend_10;
  blend_10 = DarkenColor.xyz;
  lowp float base_11;
  base_11 = tmpvar_4.x;
  highp float blend_12;
  blend_12 = blend_10.x;
  lowp float tmpvar_13;
  if ((DarkenColor.x < tmpvar_4.x)) {
    tmpvar_13 = blend_12;
  } else {
    tmpvar_13 = base_11;
  };
  lowp float base_14;
  base_14 = tmpvar_4.y;
  highp float blend_15;
  blend_15 = blend_10.y;
  lowp float tmpvar_16;
  if ((DarkenColor.y < tmpvar_4.y)) {
    tmpvar_16 = blend_15;
  } else {
    tmpvar_16 = base_14;
  };
  lowp float base_17;
  base_17 = tmpvar_4.z;
  highp float blend_18;
  blend_18 = blend_10.z;
  lowp float tmpvar_19;
  if ((DarkenColor.z < tmpvar_4.z)) {
    tmpvar_19 = blend_18;
  } else {
    tmpvar_19 = base_17;
  };
  lowp vec3 tmpvar_20;
  tmpvar_20.x = tmpvar_13;
  tmpvar_20.y = tmpvar_16;
  tmpvar_20.z = tmpvar_19;
  tmpvar_9 = ((tmpvar_20 * DarkenColor.w) + (tmpvar_4 * (1.0 - DarkenColor.w)));
  mediump vec4 tmpvar_21;
  tmpvar_21.w = 1.0;
  tmpvar_21.xyz = tmpvar_9;
  gl_FragColor = tmpvar_21;
}

