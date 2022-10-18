
varying highp vec2 v_texcoord0;
uniform highp vec4 CurrentFrame;
uniform highp vec4 NextFrame;
uniform highp vec4 InterpolationFactor;
uniform highp vec4 Tint;
uniform sampler2D s_SpriteSheet;
void main ()
{
  mediump vec4 tmpvar_1;
  lowp vec4 tmpvar_2;
  highp vec2 tmpvar_3;
  tmpvar_3.x = (CurrentFrame.x + (CurrentFrame.z * v_texcoord0.x));
  tmpvar_3.y = (CurrentFrame.y + (CurrentFrame.w * v_texcoord0.y));
  highp vec2 tmpvar_4;
  tmpvar_4.x = (NextFrame.x + (NextFrame.z * v_texcoord0.x));
  tmpvar_4.y = (NextFrame.y + (NextFrame.w * v_texcoord0.y));
  tmpvar_2 = (mix (texture2D (s_SpriteSheet, tmpvar_3), texture2D (s_SpriteSheet, tmpvar_4), InterpolationFactor.x) * Tint);
  tmpvar_1 = tmpvar_2;
  gl_FragColor = tmpvar_1;
}

