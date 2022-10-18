
varying highp float v_gradient;
uniform highp vec4 GradientCurveAmount;
uniform highp vec4 SkyColor;
uniform highp vec4 GradientCurveSelector;
uniform highp vec4 FogColor;
void main ()
{
  gl_FragColor = mix (SkyColor, FogColor, mix (pow (v_gradient, GradientCurveAmount.x), (1.0 - 
    pow ((1.0 - v_gradient), GradientCurveAmount.x)
  ), GradientCurveSelector.x));
}

