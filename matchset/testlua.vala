using Lua;

static int main () {

    var vm = new LuaVM ();
    vm.open_libs ();

    // Create a Lua table with name 'foo'
    vm.new_table ();
    for (int i = 1; i <= 5; i++) {
        vm.push_number (i);         // Push the table index
        vm.push_number (i * 2);     // Push the cell value
        vm.raw_set (-3);            // Stores the pair in the table
    }
    vm.set_global ("foo");

    // Ask Lua to run our little script
    vm.do_string ("""

        -- Receives a table, returns the sum of its components.
        io.write("The table the script received has:\n");
        x = 0
        for i = 1, #foo do
          print(i, foo[i])
          x = x + foo[i]
        end
        io.write("Returning data back to C\n");
        return x

    """);

    // Get the returned value at the top of the stack (index -1)
    var sum = vm.to_number (-1);

    stdout.printf ("Script returned: %.0f\n", sum);

    vm.pop (1);  // Take the returned value out of the stack

    return 0;
}
