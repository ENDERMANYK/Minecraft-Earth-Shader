//Instancing=Off

varying highp vec4 v_color0;
varying highp vec4 v_fog;
varying highp vec4 v_light;
varying highp vec2 v_texcoord0;
uniform highp vec4 ChangeColor;
uniform highp vec4 OverlayColor;
uniform highp vec4 HudOpacity;
uniform highp vec4 MatColor;
uniform sampler2D s_MatTexture;
void main ()
{
  lowp vec3 tmpvar_1;
  lowp float tmpvar_2;
  lowp vec4 albedo_3;
  albedo_3 = (MatColor * texture2D (s_MatTexture, v_texcoord0));
  albedo_3.xyz = mix (albedo_3.xyz, (albedo_3.xyz * ChangeColor.xyz), albedo_3.w);
  albedo_3.w = (albedo_3.w * ChangeColor.w);
  if ((albedo_3.w < 0.5)) {
    discard;
  };
  lowp vec4 albedo_4;
  albedo_4.w = albedo_3.w;
  albedo_4.xyz = (albedo_3.xyz * v_color0.xyz);
  lowp vec4 diffuse_5;
  diffuse_5.w = albedo_4.w;
  diffuse_5.xyz = mix (albedo_4.xyz, OverlayColor.xyz, OverlayColor.w);
  lowp vec4 diffuse_6;
  diffuse_6.w = diffuse_5.w;
  diffuse_6.xyz = (diffuse_5.xyz * v_light.xyz);
  albedo_4 = diffuse_6;
  tmpvar_1 = diffuse_6.xyz;
  tmpvar_2 = (diffuse_5.w * HudOpacity.x);
  mediump vec4 tmpvar_7;
  tmpvar_7.xyz = tmpvar_1;
  tmpvar_7.w = tmpvar_2;
  mediump vec4 tmpvar_8;
  tmpvar_8.w = tmpvar_7.w;
  tmpvar_8.xyz = mix (tmpvar_7.xyz, v_fog.xyz, v_fog.w);
  gl_FragColor = tmpvar_8;
}

