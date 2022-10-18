//Instancing=On

varying highp vec4 v_color0;
varying highp vec4 v_pos;
varying highp vec3 v_viewSpaceNormal;
uniform highp mat4 u_view;
uniform highp vec4 LightWorldSpaceDirection;
uniform highp vec4 LightAmbientColorAndIntensity;
uniform highp vec4 LightDiffuseColorAndIntensity;
void main ()
{
  mediump float tmpvar_1;
  tmpvar_1 = 1.0;
  highp vec4 color_2;
  color_2 = v_color0;
  highp float tmpvar_3;
  if ((v_pos.y > -0.5)) {
    tmpvar_3 = (v_pos.y + 0.5);
  } else {
    tmpvar_3 = 0.0;
  };
  highp float tmpvar_4;
  if ((tmpvar_3 < 1.0)) {
    highp float tmpvar_5;
    if ((v_pos.y > -0.5)) {
      tmpvar_5 = (v_pos.y + 0.5);
    } else {
      tmpvar_5 = 0.0;
    };
    tmpvar_4 = tmpvar_5;
  } else {
    tmpvar_4 = 1.0;
  };
  color_2.w = (v_color0.w * tmpvar_4);
  tmpvar_1 = color_2.w;
  highp vec4 tmpvar_6;
  tmpvar_6.w = 0.0;
  tmpvar_6.xyz = LightWorldSpaceDirection.xyz;
  mediump vec4 tmpvar_7;
  tmpvar_7.xyz = (((LightAmbientColorAndIntensity.xyz * LightAmbientColorAndIntensity.w) * v_color0.xyz) + ((LightDiffuseColorAndIntensity.xyz * 
    clamp (dot (v_viewSpaceNormal, -((u_view * tmpvar_6).xyz)), 0.0, 1.0)
  ) * v_color0.xyz));
  tmpvar_7.w = tmpvar_1;
  gl_FragColor = tmpvar_7;
}

