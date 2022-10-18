
varying highp vec2 v_texcoord0;
varying highp vec2 v_texcoord1;
uniform highp vec4 CameraInfo;
uniform lowp samplerExternalOES s_SegmentationTexture;
uniform lowp samplerExternalOES s_EstimatedDepthDataTexture;
uniform sampler2D s_CameraBuffer;
uniform sampler2D s_FramebufferColor;
uniform sampler2D s_FramebufferDepth;
void main ()
{
  mediump vec4 tmpvar_1;
  tmpvar_1 = vec4(0.0, 0.0, 0.0, 0.0);
  lowp vec4 tmpvar_2;
  tmpvar_2 = tmpvar_1;
  lowp vec4 tmpvar_3;
  tmpvar_3 = texture2D (s_SegmentationTexture, v_texcoord0);
  lowp vec4 tmpvar_4;
  tmpvar_4 = texture2D (s_FramebufferColor, v_texcoord1);
  if ((tmpvar_3.x > 0.0)) {
    lowp vec4 color_5;
    lowp vec4 tmpvar_6;
    tmpvar_6 = texture2D (s_CameraBuffer, v_texcoord1);
    lowp vec4 tmpvar_7;
    tmpvar_7 = texture2D (s_FramebufferDepth, v_texcoord1);
    lowp float tmpvar_8;
    highp float tmpvar_9;
    tmpvar_9 = (CameraInfo.y - CameraInfo.x);
    tmpvar_8 = (((
      (CameraInfo.y + CameraInfo.x)
     / 
      (2.0 * tmpvar_9)
    ) + (
      (1.0/((texture2D (s_EstimatedDepthDataTexture, v_texcoord0).x * CameraInfo.z)))
     * 
      ((-(CameraInfo.y) * CameraInfo.x) / tmpvar_9)
    )) + 0.5);
    color_5 = tmpvar_4;
    if ((tmpvar_7.x > tmpvar_8)) {
      color_5 = mix (tmpvar_4, tmpvar_6, tmpvar_3.x);
    };
    tmpvar_2 = color_5;
  } else {
    tmpvar_2 = tmpvar_4;
  };
  tmpvar_1 = tmpvar_2;
  gl_FragColor = tmpvar_1;
}

