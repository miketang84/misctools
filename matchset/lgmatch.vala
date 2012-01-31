using Gee;
using Lua;

static int main(string[] args){
	string[,] tagset = {
			{ "{{", "}}" },
			{ "{(", ")}" },
			{ "{%", "%}" },
			{ "{{", "}}" },
			{ "{^", "^}" },
			{ "{<", ">}" }
	};
	
	string passin = "fndslkjfdso{}nvckb {{ 1234 }} hoidfguerug9e {{984jur348fgdvncn ,mn}} kvnvifdgvheuriguee3ifd{}jvgbsfsnd{%fl%}kkfdsiu{% fff %}fh{^^}reugf{<regfnvg";

	var tset = new HashMap<string, string>();
	for (var i=0; i<tagset.length[0]; i++) {
		tset.set(tagset[i,0], tagset[i,1]);
	}
	
	var vm = new LuaVM ();
	unichar nc, rc;
	string[] collections = {};
	
	for (var i=0; passin.get_next_char (ref i, out nc);) {
		int start, end;
		
		if (nc == '{') {
			// store the start position
			start = i;
			passin.get_next_char (ref i, out nc);
			var ltag = "{%s".printf(nc.to_string());
			
			if (tset.has_key(ltag)) {
				//stdout.printf("meet left tag: %s\n", ltag);
				var rtag = tset.get(ltag);
				//stdout.printf("right tag: %s %s %s\n", rtag, rtag[0].to_string(), rtag[1].to_string());
				
				passin.get_next_char (ref i, out nc);
				while ( nc != 0) {
					if (nc == rtag[0]) {
						passin.get_next_char (ref i, out rc);
						//stdout.printf("ready to meet right tag: %s\n", rc.to_string());
						if (rc == rtag[1]) {
							// store the end position
							end = i;
							//stdout.printf("%d %d, %s\n", start, end, rtag);
							collections += passin[start-1:end];
							break;
						}
					}
					passin.get_next_char (ref i, out nc);
				}
			}
		}
	}
	
	foreach (var s in collections) {
		print("--->> " + s + "\n");
	}
	
	return 0;
}

