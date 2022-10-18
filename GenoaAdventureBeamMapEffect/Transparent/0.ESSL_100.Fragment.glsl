
varying highp vec2 v_texcoord0;
varying highp vec3 v_worldPosition;
uniform highp vec4 FogControl;
uniform highp vec4 TintColor;
uniform highp vec4 PlayerPosition;
uniform highp vec4 FogColor;
uniform sampler2D s_SpriteTexture;
void main ()
{
  mediump vec4 tmpvar_1;
  tmpvar_1 = vec4(0.0, 0.0, 0.0, 0.0);
  lowp vec4 tmpvar_2;
  tmpvar_2 = (texture2D (s_SpriteTexture, v_texcoord0) * TintColor);
  highp vec2 tmpvar_3;
  tmpvar_3 = (PlayerPosition.xz - v_worldPosition.xz);
  highp float tmpvar_4;
  tmpvar_4 = (sqrt(dot (tmpvar_3, tmpvar_3)) / FogControl.z);
  highp float tmpvar_5;
  tmpvar_5 = (FogControl.y - FogControl.x);
  highp float tmpvar_6;
  tmpvar_6 = sign(tmpvar_5);
  highp float tmpvar_7;
  if ((tmpvar_6 > 0.0)) {
    tmpvar_7 = sign(tmpvar_5);
  } else {
    tmpvar_7 = 0.0;
  };
  tmpvar_2.xyz = mix (tmpvar_2.xyz, FogColor.xyz, (tmpvar_7 * clamp (
    ((tmpvar_4 - FogControl.x) / tmpvar_5)
  , 0.0, 1.0)));
  tmpvar_1 = tmpvar_2;
  gl_FragColor = tmpvar_1;
}

