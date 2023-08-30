from subprocess import PIPE, Popen 
activesink = 'pactl list sinks short | awk \'{print $1,$7}\''
process = Popen(activesink, shell=True, stdin=PIPE, stdout=PIPE, stderr=PIPE)
stdout, stderr = process.communicate()
res = stdout.splitlines()
#res is an array like  [b'0' 'SUSPENDED',b'4' 'RUNNING']
