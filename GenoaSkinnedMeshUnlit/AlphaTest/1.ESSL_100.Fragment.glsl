//Instancing=On

varying highp vec4 v_color0;
varying highp vec4 v_fog;
varying highp vec4 v_light;
varying highp vec2 v_texcoord0;
uniform highp vec4 ChangeColor;
uniform highp vec4 OverlayColor;
uniform highp vec4 MatColor;
uniform sampler2D s_MatTexture;
void main ()
{
  lowp vec3 tmpvar_1;
  lowp vec4 albedo_2;
  albedo_2 = (MatColor * texture2D (s_MatTexture, v_texcoord0));
  albedo_2.xyz = mix (albedo_2.xyz, (albedo_2.xyz * ChangeColor.xyz), albedo_2.w);
  albedo_2.w = (albedo_2.w * ChangeColor.w);
  if ((albedo_2.w < 0.5)) {
    discard;
  };
  lowp vec4 albedo_3;
  albedo_3.w = albedo_2.w;
  albedo_3.xyz = (albedo_2.xyz * v_color0.xyz);
  lowp vec4 diffuse_4;
  diffuse_4.w = albedo_3.w;
  diffuse_4.xyz = mix (albedo_3.xyz, OverlayColor.xyz, OverlayColor.w);
  lowp vec4 diffuse_5;
  diffuse_5.w = diffuse_4.w;
  diffuse_5.xyz = (diffuse_4.xyz * v_light.xyz);
  albedo_3 = diffuse_5;
  tmpvar_1 = diffuse_5.xyz;
  mediump vec4 tmpvar_6;
  tmpvar_6.xyz = tmpvar_1;
  tmpvar_6.w = 1.0;
  mediump vec4 tmpvar_7;
  tmpvar_7.w = tmpvar_6.w;
  tmpvar_7.xyz = mix (tmpvar_6.xyz, v_fog.xyz, v_fog.w);
  gl_FragColor = tmpvar_7;
}

