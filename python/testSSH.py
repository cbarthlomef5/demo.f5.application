# testSSH.py
# Attempt connection to UDF appliance and validate it is online

# Import Modules
import subprocess, sys

# Module to test SSH connection
def testSSHconnection(ip):
    try:
        print('Attempting SSH connection to remote host. IP:', ip)
        host = 'ubuntu@%s' % (ip)
        subprocess.check_output(['ssh', host, 'exit'])
    except:
        sys.exit('SSH connection to remote host failed!')
