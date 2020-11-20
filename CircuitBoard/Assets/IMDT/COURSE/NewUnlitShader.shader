Shader "Unlit/NewUnlitShader"
{
    Properties
    {
         _Color("Color", Color) = (1,1,1,1)
    }
        SubShader
    {

        Pass
        {

           CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
           fixed4 _Color;
            struct appdata
            {
                float4 vertex:POSITION;
                float2 uv:TEXCOORD;
            };
            struct v2f
            {
                float4 pos:SV_POSITION;
                float2 uv:TEXCOORD;
            };
            v2f vert(appdata v)
            {
                v2f o;
                o.pos = UnityObjectToClipPos(v.vertex);
                o.uv = v.uv;
                return o;
            }
            float4 frag(v2f i) :SV_TARGET
            {
                return fixed4(i.uv,0,0);
            }
                ENDCG
        }
        
    }
    FallBack "Diffuse"
    CustomEditor "EditorName"
}
