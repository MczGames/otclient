// Projeto JJK: flash branco no alvo atingido por tecnica (o servidor liga por ~140 ms com creature:setShader).
uniform sampler2D u_Tex0;
varying vec2 v_TexCoord;

void main()
{
	vec4 col = texture2D(u_Tex0, v_TexCoord);
	gl_FragColor = vec4(mix(col.rgb, vec3(1.0, 0.97, 0.9), 0.72), col.a);
}
