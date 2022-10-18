//Instancing=On

varying highp vec4 v_color0;
varying highp vec4 v_fog;
varying highp vec4 v_light;
varying highp vec2 v_texcoord0;
varying highp vec3 v_viewSpaceNormal;
varying highp vec4 v_viewSpacePosition;
varying highp vec4 v_worldSpacePosition;
uniform highp mat4 u_view;
uniform highp vec4 ShadowBias;
uniform highp vec4 ChangeColor;
uniform highp vec4 OverlayColor;
uniform highp vec4 ShadowIntensity;
uniform highp vec4 ShadowFilterSize;
uniform highp vec4 LightWorldSpaceDirection;
uniform highp vec4 LightDiffuseColorAndIntensity;
uniform highp vec4 SurfaceRoughness;
uniform highp vec4 HudOpacity;
uniform highp vec4 MatColor;
uniform highp vec4 ShadowTexel;
uniform highp vec4 ShadowFadeAmount;
uniform highp vec4 LightAmbientColorAndIntensity;
uniform highp vec4 ShadowColor;
uniform highp mat4 ShadowTransform;
uniform highp sampler2D s_ShadowTexture;
uniform sampler2D s_MatTexture;
void main ()
{
  highp vec3 tmpvar_1;
  lowp float tmpvar_2;
  highp float tmpvar_3;
  lowp vec4 albedo_4;
  albedo_4 = (MatColor * texture2D (s_MatTexture, v_texcoord0));
  albedo_4.xyz = mix (albedo_4.xyz, (albedo_4.xyz * ChangeColor.xyz), albedo_4.w);
  albedo_4.w = (albedo_4.w * ChangeColor.w);
  if ((albedo_4.w < 0.5)) {
    discard;
  };
  lowp vec4 albedo_5;
  albedo_5.w = albedo_4.w;
  albedo_5.xyz = (albedo_4.xyz * v_color0.xyz);
  lowp vec4 diffuse_6;
  diffuse_6.w = albedo_5.w;
  diffuse_6.xyz = mix (albedo_5.xyz, OverlayColor.xyz, OverlayColor.w);
  lowp vec4 diffuse_7;
  diffuse_7.w = diffuse_6.w;
  diffuse_7.xyz = (diffuse_6.xyz * v_light.xyz);
  albedo_5 = diffuse_7;
  tmpvar_2 = (diffuse_6.w * HudOpacity.x);
  tmpvar_3 = SurfaceRoughness.x;
  highp vec4 tmpvar_8;
  tmpvar_8.w = 0.0;
  tmpvar_8.xyz = LightWorldSpaceDirection.xyz;
  tmpvar_1 = (LightDiffuseColorAndIntensity.xyz * LightDiffuseColorAndIntensity.w);
  lowp vec3 tmpvar_9;
  highp vec3 tmpvar_10;
  tmpvar_10 = normalize(v_viewSpaceNormal);
  highp vec3 tmpvar_11;
  tmpvar_11 = normalize(-((u_view * tmpvar_8).xyz));
  highp vec3 tmpvar_12;
  tmpvar_12 = (LightAmbientColorAndIntensity.xyz * LightAmbientColorAndIntensity.w);
  highp vec3 tmpvar_13;
  tmpvar_13 = (clamp (dot (tmpvar_10, tmpvar_11), 0.0, 1.0) * tmpvar_1);
  highp vec3 tmpvar_14;
  tmpvar_14 = normalize((tmpvar_11 + normalize(
    -(v_viewSpacePosition.xyz)
  )));
  highp float tmpvar_15;
  if ((0.95 < SurfaceRoughness.x)) {
    tmpvar_15 = 0.95;
  } else {
    tmpvar_15 = tmpvar_3;
  };
  highp float tmpvar_16;
  if ((0.05 > tmpvar_15)) {
    tmpvar_16 = 0.05;
  } else {
    highp float tmpvar_17;
    if ((0.95 < SurfaceRoughness.x)) {
      tmpvar_17 = 0.95;
    } else {
      tmpvar_17 = tmpvar_3;
    };
    tmpvar_16 = tmpvar_17;
  };
  highp float tmpvar_18;
  tmpvar_18 = ((2.0 / pow (tmpvar_16, 4.0)) - 2.0);
  highp vec3 tmpvar_19;
  tmpvar_19 = (clamp ((
    ((tmpvar_18 + 2.0) / (12.56637 * (2.0 - exp2(
      (-(tmpvar_18) / 2.0)
    ))))
   * 
    pow (clamp (dot (tmpvar_10, tmpvar_14), 0.0, 1.0), tmpvar_18)
  ), 0.0, 1.0) * tmpvar_1);
  highp float tmpvar_20;
  highp int filterOffset_22;
  highp int filterWidth_23;
  highp float shadowOcclusion_24;
  highp vec2 shadowCoord_25;
  highp float projectedDepth_26;
  highp vec4 shadowPos_27;
  highp vec4 tmpvar_28;
  tmpvar_28 = (ShadowTransform * v_worldSpacePosition);
  shadowPos_27.xyw = tmpvar_28.xyw;
  shadowPos_27.z = ((tmpvar_28.z * 0.5) + 0.5);
  projectedDepth_26 = ((shadowPos_27.z / tmpvar_28.w) - ShadowBias.x);
  highp vec2 tmpvar_29;
  tmpvar_29 = (((tmpvar_28.xy / tmpvar_28.w) * 0.5) + vec2(0.5, 0.5));
  shadowCoord_25.x = tmpvar_29.x;
  shadowCoord_25.y = (1.0 - tmpvar_29.y);
  highp vec2 tmpvar_30;
  tmpvar_30.x = shadowCoord_25.x;
  tmpvar_30.y = (1.0 - shadowCoord_25.y);
  shadowCoord_25 = tmpvar_30;
  shadowOcclusion_24 = 0.0;
  highp int tmpvar_31;
  tmpvar_31 = (int(ShadowFilterSize.x) * 2);
  filterWidth_23 = tmpvar_31;
  filterOffset_22 = (tmpvar_31 / 2);
  for (highp int iy_21 = 0; ((iy_21 < filterWidth_23) && (iy_21 < 4)); iy_21++) {
    for (highp int ix_32 = 0; ((ix_32 < filterWidth_23) && (ix_32 < 4)); ix_32++) {
      highp vec2 tmpvar_33;
      tmpvar_33.x = float((ix_32 - filterOffset_22));
      tmpvar_33.y = float((iy_21 - filterOffset_22));
      highp vec4 tmpvar_34;
      tmpvar_34 = texture2D (s_ShadowTexture, (shadowCoord_25 + (tmpvar_33 * ShadowTexel.xy)));
      highp float tmpvar_35;
      if (((projectedDepth_26 - tmpvar_34.x) > 0.0)) {
        tmpvar_35 = 1.0;
      } else {
        tmpvar_35 = 0.0;
      };
      shadowOcclusion_24 = (shadowOcclusion_24 + tmpvar_35);
    };
  };
  highp float tmpvar_36;
  tmpvar_36 = (float(tmpvar_31) + 1.0);
  shadowOcclusion_24 = (shadowOcclusion_24 / (tmpvar_36 * tmpvar_36));
  highp vec2 tmpvar_37;
  tmpvar_37 = (ShadowTexel.xy * ShadowFadeAmount.x);
  highp vec2 tmpvar_38;
  tmpvar_38 = clamp ((tmpvar_30 / tmpvar_37), 0.0, 1.0);
  highp vec2 edge0_39;
  edge0_39 = (vec2(1.0, 1.0) - tmpvar_37);
  highp vec2 tmpvar_40;
  tmpvar_40 = clamp (((tmpvar_30 - edge0_39) / (vec2(1.0, 1.0) - edge0_39)), 0.0, 1.0);
  highp vec2 tmpvar_41;
  tmpvar_41 = ((tmpvar_38 * (tmpvar_38 * 
    (3.0 - (2.0 * tmpvar_38))
  )) * (vec2(1.0, 1.0) - (tmpvar_40 * 
    (tmpvar_40 * (3.0 - (2.0 * tmpvar_40)))
  )));
  shadowOcclusion_24 = ((shadowOcclusion_24 * tmpvar_41.x) * tmpvar_41.y);
  shadowOcclusion_24 = (shadowOcclusion_24 * ShadowIntensity.x);
  tmpvar_20 = (1.0 - shadowOcclusion_24);
  tmpvar_9 = (((
    (tmpvar_12 * diffuse_7.xyz)
   + 
    ((tmpvar_13 * diffuse_7.xyz) * tmpvar_20)
  ) + (tmpvar_19 * tmpvar_20)) + (ShadowColor.xyz * (1.0 - tmpvar_20)));
  mediump vec4 tmpvar_42;
  tmpvar_42.xyz = tmpvar_9;
  tmpvar_42.w = tmpvar_2;
  mediump vec4 tmpvar_43;
  tmpvar_43.w = tmpvar_42.w;
  tmpvar_43.xyz = mix (tmpvar_42.xyz, v_fog.xyz, v_fog.w);
  gl_FragColor = tmpvar_43;
}

