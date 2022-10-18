//Instancing=Off

uniform highp vec4 OverlayColor;
void main ()
{
  mediump vec4 tmpvar_1;
  tmpvar_1.xyz = OverlayColor.xyz;
  tmpvar_1.w = OverlayColor.w;
  gl_FragColor = tmpvar_1;
}

