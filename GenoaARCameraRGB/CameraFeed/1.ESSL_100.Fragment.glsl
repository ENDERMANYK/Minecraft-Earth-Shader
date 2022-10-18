//NightMode=On

varying highp vec2 v_texcoord0;
uniform highp vec4 MultiplyColor;
uniform highp vec4 OverlayColor;
uniform highp vec4 DarkenColor;
uniform sampler2D s_CameraTexture;
void main ()
{
  mediump vec4 tmpvar_1;
  tmpvar_1 = vec4(0.0, 0.0, 0.0, 0.0);
  lowp vec4 tmpvar_2;
  tmpvar_2 = texture2D (s_CameraTexture, v_texcoord0);
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
  highp vec3 blend_9;
  blend_9 = DarkenColor.xyz;
  lowp float base_10;
  base_10 = tmpvar_4.x;
  highp float blend_11;
  blend_11 = blend_9.x;
  lowp float tmpvar_12;
  if ((DarkenColor.x < tmpvar_4.x)) {
    tmpvar_12 = blend_11;
  } else {
    tmpvar_12 = base_10;
  };
  lowp float base_13;
  base_13 = tmpvar_4.y;
  highp float blend_14;
  blend_14 = blend_9.y;
  lowp float tmpvar_15;
  if ((DarkenColor.y < tmpvar_4.y)) {
    tmpvar_15 = blend_14;
  } else {
    tmpvar_15 = base_13;
  };
  lowp float base_16;
  base_16 = tmpvar_4.z;
  highp float blend_17;
  blend_17 = blend_9.z;
  lowp float tmpvar_18;
  if ((DarkenColor.z < tmpvar_4.z)) {
    tmpvar_18 = blend_17;
  } else {
    tmpvar_18 = base_16;
  };
  lowp vec3 tmpvar_19;
  tmpvar_19.x = tmpvar_12;
  tmpvar_19.y = tmpvar_15;
  tmpvar_19.z = tmpvar_18;
  lowp vec4 tmpvar_20;
  tmpvar_20.w = 1.0;
  tmpvar_20.xyz = ((tmpvar_19 * DarkenColor.w) + (tmpvar_4 * (1.0 - DarkenColor.w)));
  tmpvar_1 = tmpvar_20;
  gl_FragColor = tmpvar_1;
}

