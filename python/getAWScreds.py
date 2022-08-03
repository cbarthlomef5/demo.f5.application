# getAWScreds.py
# Python script to get AWS credentials from UDF

# Import Modules
import subprocess, sys, os

# Import Third Party modules
from testSSH import testSSHconnection

# Global variables
udfVPNip = '100.111.211.127'
awsCredFiles = ['config', 'credentials']

# Test SSH connection to udfVPNip
try:
    testSSHconnection(udfVPNip)
except:
    print('Unable to connect to UDF Ubuntu instance! Validate UDF instance was started successfully!')
    print('UDF Ubuntu IP:', udfVPNip)
    sys.exit('Failed to connect to UDF instance.')

# Copy credentials from UDF Ubuntu host to localhost
print('Copying UDF AWS credentials to local machine')
for file in awsCredFiles:
    print('Copying %s file from remote host. Please wait...' % (file))
    try:
        src = 'ubuntu@%s:/home/ubuntu/.aws/%s' % (udfVPNip, file)
        dst = '%s/.aws/%s' % (os.getenv('HOME') ,file)
        subprocess.run(['scp', src, dst])
    except:
        print('Unable to copy file from remote host! ')