//Instancing=On

varying highp vec2 v_texcoord0;
uniform highp vec4 ChangeColor;
uniform highp vec4 MatColor;
uniform sampler2D s_MatTexture;
void main ()
{
  lowp vec4 albedo_1;
  albedo_1 = (MatColor * texture2D (s_MatTexture, v_texcoord0));
  albedo_1.xyz = mix (albedo_1.xyz, (albedo_1.xyz * ChangeColor.xyz), albedo_1.w);
  albedo_1.w = (albedo_1.w * ChangeColor.w);
  if ((albedo_1.w < 0.5)) {
    discard;
  };
  gl_FragColor = vec4(0.0, 0.0, 0.0, 0.0);
}

