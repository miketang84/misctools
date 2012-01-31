using Gee;

class TagMatchManager:Object {
	public int test() {
		string[,] tagset = {
				{ "{{", "}}" },
				{ "{(", ")}" },
				{ "{%", "%}" },
				{ "{{", "}}" },
				{ "{^", "^}" },
				{ "{<", ">}" }
		};
		
		foreach (var l in tagset) {
			print(l + "\n");
		}		
		
		print(("{{" in tagset).to_string());
		
		//print(tagset.length.to_string());
		print(tagset.length[0].to_string());
		print(tagset.length[1].to_string());
		
		
		return 0;		
	}
	
	
	public static int main(string[] args){
		string[,] tagset = {
				{ "{{", "}}" },
				{ "{(", ")}" },
				{ "{%", "%}" },
				{ "{{", "}}" },
				{ "{^", "^}" },
				{ "{<", ">}" }
		};
		string passin = "fndslkjfdso{}nvckb {{ 1234 }} hoidfguerug9e {{984jur348fgdvncn ,mn}} kvnvifdgvheuriguee3ifd{}jvgbsfsnd{%fl%}kkfdsiu{% fff %}fh{^^}reugfregfnvg";

		var tset = new HashMap<string, string>();

		for (var i=0; i<tagset.length[0]; i++) {
			tset.set(tagset[i,0], tagset[i,1]);
		}
		
		//for (unowned string it = passin; it.get_char () != 0; it = it.next_char ()) {
		for (var i=0; passin.get_next_char (ref i, out c);) {
		
			//unichar c = it.get_char();
			unichar nc, rc;
			
			//int start, end;
			
			if (c == '{') {
				//it = it.next_char ();
				//var atag = "{%s".printf(it.get_char().to_string());
				
				
				if (tset.has_key(atag)) {
					stdout.printf("meet left tag: %s\n", atag);
					
					var rtag = tset.get(atag);
					//stdout.printf("right tag: %s %s %s\n", rtag, rtag[0].to_string(), rtag[1].to_string());
					
					it = it.next_char ();
					while ( (nc = it.get_char ()) != 0) {
						if (nc == rtag[0]) {
							it = it.next_char ();
							rc = it.get_char();
							
							//stdout.printf("ready to meet right tag: %s\n", rc.to_string());
							
							if (rc == rtag[1]) {
								stdout.printf("%s\n", rtag);
								break;
							}
						}
						it = it.next_char ();
						
					} ;
					
					
				}
			}
			
		}
		
		
		if (tset.has_key("{{")) {
			print("OK\n");
		}
		else {
			print("Not\n");
		}
		
		
		return 0;
	}
}
