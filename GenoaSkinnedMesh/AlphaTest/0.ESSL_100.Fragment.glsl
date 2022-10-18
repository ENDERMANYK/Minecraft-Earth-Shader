//Instancing=Off

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
  highp float tmpvar_2;
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
  tmpvar_2 = SurfaceRoughness.x;
  highp vec4 tmpvar_7;
  tmpvar_7.w = 0.0;
  tmpvar_7.xyz = LightWorldSpaceDirection.xyz;
  tmpvar_1 = (LightDiffuseColorAndIntensity.xyz * LightDiffuseColorAndIntensity.w);
  lowp vec3 tmpvar_8;
  highp vec3 tmpvar_9;
  tmpvar_9 = normalize(v_viewSpaceNormal);
  highp vec3 tmpvar_10;
  tmpvar_10 = normalize(-((u_view * tmpvar_7).xyz));
  highp vec3 tmpvar_11;
  tmpvar_11 = (LightAmbientColorAndIntensity.xyz * LightAmbientColorAndIntensity.w);
  highp vec3 tmpvar_12;
  tmpvar_12 = (clamp (dot (tmpvar_9, tmpvar_10), 0.0, 1.0) * tmpvar_1);
  highp vec3 tmpvar_13;
  tmpvar_13 = normalize((tmpvar_10 + normalize(
    -(v_viewSpacePosition.xyz)
  )));
  highp float tmpvar_14;
  if ((0.95 < SurfaceRoughness.x)) {
    tmpvar_14 = 0.95;
  } else {
    tmpvar_14 = tmpvar_2;
  };
  highp float tmpvar_15;
  if ((0.05 > tmpvar_14)) {
    tmpvar_15 = 0.05;
  } else {
    highp float tmpvar_16;
    if ((0.95 < SurfaceRoughness.x)) {
      tmpvar_16 = 0.95;
    } else {
      tmpvar_16 = tmpvar_2;
    };
    tmpvar_15 = tmpvar_16;
  };
  highp float tmpvar_17;
  tmpvar_17 = ((2.0 / pow (tmpvar_15, 4.0)) - 2.0);
  highp vec3 tmpvar_18;
  tmpvar_18 = (clamp ((
    ((tmpvar_17 + 2.0) / (12.56637 * (2.0 - exp2(
      (-(tmpvar_17) / 2.0)
    ))))
   * 
    pow (clamp (dot (tmpvar_9, tmpvar_13), 0.0, 1.0), tmpvar_17)
  ), 0.0, 1.0) * tmpvar_1);
  highp float tmpvar_19;
  highp int filterOffset_21;
  highp int filterWidth_22;
  highp float shadowOcclusion_23;
  highp vec2 shadowCoord_24;
  highp float projectedDepth_25;
  highp vec4 shadowPos_26;
  highp vec4 tmpvar_27;
  tmpvar_27 = (ShadowTransform * v_worldSpacePosition);
  shadowPos_26.xyw = tmpvar_27.xyw;
  shadowPos_26.z = ((tmpvar_27.z * 0.5) + 0.5);
  projectedDepth_25 = ((shadowPos_26.z / tmpvar_27.w) - ShadowBias.x);
  highp vec2 tmpvar_28;
  tmpvar_28 = (((tmpvar_27.xy / tmpvar_27.w) * 0.5) + vec2(0.5, 0.5));
  shadowCoord_24.x = tmpvar_28.x;
  shadowCoord_24.y = (1.0 - tmpvar_28.y);
  highp vec2 tmpvar_29;
  tmpvar_29.x = shadowCoord_24.x;
  tmpvar_29.y = (1.0 - shadowCoord_24.y);
  shadowCoord_24 = tmpvar_29;
  shadowOcclusion_23 = 0.0;
  highp int tmpvar_30;
  tmpvar_30 = (int(ShadowFilterSize.x) * 2);
  filterWidth_22 = tmpvar_30;
  filterOffset_21 = (tmpvar_30 / 2);
  for (highp int iy_20 = 0; ((iy_20 < filterWidth_22) && (iy_20 < 4)); iy_20++) {
    for (highp int ix_31 = 0; ((ix_31 < filterWidth_22) && (ix_31 < 4)); ix_31++) {
      highp vec2 tmpvar_32;
      tmpvar_32.x = float((ix_31 - filterOffset_21));
      tmpvar_32.y = float((iy_20 - filterOffset_21));
      highp vec4 tmpvar_33;
      tmpvar_33 = texture2D (s_ShadowTexture, (shadowCoord_24 + (tmpvar_32 * ShadowTexel.xy)));
      highp float tmpvar_34;
      if (((projectedDepth_25 - tmpvar_33.x) > 0.0)) {
        tmpvar_34 = 1.0;
      } else {
        tmpvar_34 = 0.0;
      };
      shadowOcclusion_23 = (shadowOcclusion_23 + tmpvar_34);
    };
  };
  highp float tmpvar_35;
  tmpvar_35 = (float(tmpvar_30) + 1.0);
  shadowOcclusion_23 = (shadowOcclusion_23 / (tmpvar_35 * tmpvar_35));
  highp vec2 tmpvar_36;
  tmpvar_36 = (ShadowTexel.xy * ShadowFadeAmount.x);
  highp vec2 tmpvar_37;
  tmpvar_37 = clamp ((tmpvar_29 / tmpvar_36), 0.0, 1.0);
  highp vec2 edge0_38;
  edge0_38 = (vec2(1.0, 1.0) - tmpvar_36);
  highp vec2 tmpvar_39;
  tmpvar_39 = clamp (((tmpvar_29 - edge0_38) / (vec2(1.0, 1.0) - edge0_38)), 0.0, 1.0);
  highp vec2 tmpvar_40;
  tmpvar_40 = ((tmpvar_37 * (tmpvar_37 * 
    (3.0 - (2.0 * tmpvar_37))
  )) * (vec2(1.0, 1.0) - (tmpvar_39 * 
    (tmpvar_39 * (3.0 - (2.0 * tmpvar_39)))
  )));
  shadowOcclusion_23 = ((shadowOcclusion_23 * tmpvar_40.x) * tmpvar_40.y);
  shadowOcclusion_23 = (shadowOcclusion_23 * ShadowIntensity.x);
  tmpvar_19 = (1.0 - shadowOcclusion_23);
  tmpvar_8 = (((
    (tmpvar_11 * diffuse_6.xyz)
   + 
    ((tmpvar_12 * diffuse_6.xyz) * tmpvar_19)
  ) + (tmpvar_18 * tmpvar_19)) + (ShadowColor.xyz * (1.0 - tmpvar_19)));
  mediump vec4 tmpvar_41;
  tmpvar_41.xyz = tmpvar_8;
  tmpvar_41.w = 1.0;
  mediump vec4 tmpvar_42;
  tmpvar_42.w = tmpvar_41.w;
  tmpvar_42.xyz = mix (tmpvar_41.xyz, v_fog.xyz, v_fog.w);
  gl_FragColor = tmpvar_42;
}

