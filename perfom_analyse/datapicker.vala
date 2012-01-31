using Posix;

class DataAnalyse:Object {
	
//	public void hello_world() {
//		print("Hello world!\n");
//	}

//	public void read_line() {
//		print("Please enter your name:");
//		string name = stdin.read_line();
//		if (name != null) {
//			print("Hello, %s.\n", name);
//		}
//	}

//	public void splitstring() {
//		var ostr = "123	456	789	12345";
//		var strs = ostr.split("\t");
//		foreach(var s in strs) {
//			print("%s\n", s);
//		}

//		if ("" == "") {
//			print("True");
//		
//		}
//	}

//	public int divide_data_files() {
//		var fd = FileStream.open("liuliang_000002.tsv", "r");
//		var i = 0;
//		string[] timestamp = {};
//		string[] stat_bandwidth = {};
//		string[] stat_memory = {};
//		string[] stat_disk = {};
//		string[] stat_cpu = {};
//		
//		
//		while (!fd.eof() && i < 300000) {
//			var line_content = fd.read_line();
//			//print(line_content);
//			i++;
//			//if ( line_content.strip() == "") continue;
//			var strs = line_content.split("\t");
//			timestamp += strs[0];
//			stat_bandwidth += strs[1];
//			stat_memory += strs[5];
//			stat_disk += strs[6];
//			stat_cpu += strs[7];
//			
//		}
//		
//		print(timestamp.length.to_string() + "\n");
//		
//		var fd_timestamp = FileStream.open("timestamp.tsv", "w");
//		var fd_bandwidth = FileStream.open("bandwidth.tsv", "w");
//		var fd_memory = FileStream.open("memory.tsv", "w");
//		var fd_disk = FileStream.open("disk.tsv", "w");
//		var fd_cpu = FileStream.open("cpu.tsv", "w");
//		
//		for (i = 0; i < timestamp.length; i++) {
//			string tmp0 = timestamp[i].slice(1, -5);
//			string tmp1 = stat_bandwidth[i].slice(1, -1);
//			string tmp2 = stat_memory[i].slice(1, -1);
//			string tmp3 = stat_disk[i].slice(1, -1);
//			string tmp4 = stat_cpu[i].slice(1, -1);
//			
////			fd_bandwidth.printf("%s\t\t%s\n", tmp0, tmp1);
////			fd_memory.printf("%s\t\t%s\n", tmp0, tmp2);
////			fd_disk.printf("%s\t\t%s\n", tmp0, tmp3);
////			fd_cpu.printf("%s\t\t%s\n", tmp0, tmp4);
//			fd_timestamp.printf("%s\n", tmp0);
//			fd_bandwidth.printf("%s\n", tmp1);
//			fd_memory.printf("%s\n", tmp2);
//			fd_disk.printf("%s\n", tmp3);
//			fd_cpu.printf("%s\n", tmp4);
//		}
//		
//		return 0;
//	}

	public static int midd2(){
		var fd = FileStream.open("timestamp.tsv", "r");
		Regex expr = /\d\d\/\d\d\/\d\d\d\d \d\d:00:00/;
		//Regex expr = new Regex("[0-9][0-9]/[0-9][0-9]/[0-9][0-9][0-9][0-9] ");
		var i = 0;
		string[] collection = {};
		int[] icollection = {};
		
		
		while (!fd.eof()) {
			var line_content = fd.read_line();
			if (line_content == null) continue;
			//print(line_content + "\n");
			var matched = expr.match(line_content);
			if (matched) {
				icollection += i;
				collection += line_content;	
				
			}
			i++;
		}
		
		print(icollection.length.to_string() + "\n");
		print(collection.length.to_string() + "\n");
		
		var fd1 = FileStream.open("isave.tsv", "w");
		var fd2 = FileStream.open("zhendian.tsv", "w");
		
		for (i=0; i<icollection.length; i++) {
			print(icollection[i].to_string() + "\n");
			print(collection[i] + "\n");
			fd1.printf("%s\n", icollection[i].to_string());
			fd2.printf("%s\n", collection[i]);
			
		}
		
		
		
		return 0;
	}

	public static int main(){
		var fd = FileStream.open("isave.tsv", "r");
		var fd1 = FileStream.open("zhendian.tsv", "r");
		int[] icollection = {};
		string[] collection = {};
		
		while (!fd.eof()) {
			var line_content = fd.read_line();
			if (line_content == null) continue;
			//print(line_content + "\n");
			var num = int.parse(line_content);
			icollection += num;
			
		}
		
		while (!fd1.eof()) {
			var line_content = fd1.read_line();
			if (line_content == null) continue;
			collection += line_content;
		}
		
		for (var i=1; i< icollection.length; i++) {
			var start = icollection[i-1];
			var end = icollection[i];
			var name = collection[i-1];
			name = name.replace(" ", "_").replace("/", "_");
			var cmd0 = @"gnuplot -e \"set term post eps color; set output 'memory/$name.eps'; set size 2, 2; set title 'memory time load'; set xlabel 'time'; set ylabel 'load'; plot [$start:$end] 'memory.tsv' \"";
			//print(cmd0 + "\n");
			Posix.system(cmd0);
			
			cmd0 = @"gnuplot -e \"set term post eps color; set output 'cpu/$name.eps'; set size 2, 2; set title 'cpu time load'; set xlabel 'time'; set ylabel 'load'; plot [$start:$end] 'cpu.tsv' \"";
			//print(cmd0 + "\n");
			Posix.system(cmd0);
			
			cmd0 = @"gnuplot -e \"set term post eps color; set output 'disk/$name.eps'; set size 2, 2; set title 'disk time load'; set xlabel 'time'; set ylabel 'load'; plot [$start:$end] 'disk.tsv' \"";
			//print(cmd0 + "\n");
			Posix.system(cmd0);
			
			cmd0 = @"gnuplot -e \"set term post eps color; set output 'bandwidth/$name.eps'; set size 2, 2; set title 'bandwidth time load'; set xlabel 'time'; set ylabel 'load'; plot [$start:$end] 'bandwidth.tsv' \"";
			//print(cmd0 + "\n");
			Posix.system(cmd0);
			
		}

		return 0;
	}

}
