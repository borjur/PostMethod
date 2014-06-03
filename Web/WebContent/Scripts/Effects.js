function FadeElem(ELEM,R1,G1,B1,R2,G2,B2)
{
	elem = ELEM;
	r1=R1 || 255;
	r2=R2 || 255;
	g1=G1 || 255;
	g2=G2 || 255;
	b1=B1 || 0;
	b2=B2 || 255;
	
	elem.style.backgroundColor="rgb("+r1+","+g1+","+b1+")";
	elem.style.borderStyle="dashed";
	elem.style.display="block";
	if (r1 > r2)
		r1--;
	else if (r1 < r2)
		r1++;
	if (g1 > g2)
		g1--;
	else if (g1 < g2)
		g1++;
	if (b1 > b2)
		b1--;
	else if (b1 < b2)
		b1++;

	if (r1 != r2 || g1 != g2 || b1 != b2)
	{
		setTimeout("FadeElem(elem,r1,g1,b1,r2,g2,b2)","5");
	}
	else
	{
		elem.innerHTML="";
		elem.style.display="none";
	}
}