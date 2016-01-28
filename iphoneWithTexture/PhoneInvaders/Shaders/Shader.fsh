//
//  Shader.fsh
//  PhoneInvaders
//

precision mediump float;
varying mediump vec2 vTexCoord;
uniform sampler2D tsampler;
uniform sampler2D backgroundsampler;
uniform int shaderSelector;

void main()
{
    vec4 color;
    if (shaderSelector == 1)
    {
        color   = texture2D(backgroundsampler, vTexCoord);
        color.a = 1.0;
    }
    else
    {
        vec4 modColor = vec4(0.85);
        vec4 texColor;
        float y = vTexCoord.x;
        float x = vTexCoord.y;
        texColor = texture2D(tsampler, vTexCoord);
        if ((y > 0.8) && (y < 0.865))
        {
            modColor  = vec4(1.0, 0.0, 0.0, 1.0);  //red
        }
        else if (y < 0.25)
        {
            if ((y > 0.06) || ((x > 0.08) && (x < 0.60)))
                modColor  = vec4(0.0, 1.0, 0.0, 1.0);
        }
        color = modColor * texColor;
        if (texColor.b < 0.1)
            color.a = 0.1;
        else
            color.a = 0.8;
    }
    gl_FragColor = color;
}
