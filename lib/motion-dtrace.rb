desc "Run dtrace on Simulator process"
task :dtrace do
  trace_file = ENV['DTRACE'] || File.expand_path(File.join(File.dirname(__FILE__), "/../dtrace/time.d"))  
  trace_pid  = `ps ax | grep -P 'iPhone Simulator/[0-9\.]+/Applications/[^/]+/[^/]+\.app' | awk '{print $1}'`
  command    = "sudo dtrace -qs #{trace_file} -p #{trace_pid}"
  puts "#{command}"
  pid = fork { exec command }

  Signal.trap("HUP") do
    Process.kill("HUP", pid)
    Process.wait(pid)
    exit
  end
  Process.wait(pid)
end