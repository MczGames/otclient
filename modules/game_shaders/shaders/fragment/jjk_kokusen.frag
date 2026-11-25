// Projeto JJK: golpe final do combo que abre a janela do critico (Kokusen): corpo escurece e ganha contorno vermelho.
const float offset = 1.0 / 64.0;
uniform sampler2D u_Tex0;
varying vec2 v_TexCoord;

void main()
{
	vec4 col = texture2D(u_Tex0, v_TexCoord);
	if (col.a > 0.5) {
		gl_FragColor = vec4(mix(col.rgb, vec3(0.06, 0.0, 0.03), 0.8), col.a);
	} else {
		float a = texture2D(u_Tex0, vec2(v_TexCoord.x + offset, v_TexCoord.y)).a +
			texture2D(u_Tex0, vec2(v_TexCoord.x, v_TexCoord.y - offset)).a +
			texture2D(u_Tex0, vec2(v_TexCoord.x - offset, v_TexCoord.y)).a +
			texture2D(u_Tex0, vec2(v_TexCoord.x, v_TexCoord.y + offset)).a;
		gl_FragColor = a > 0.0 ? vec4(0.95, 0.08, 0.12, 1.0) : col;
	}
}
