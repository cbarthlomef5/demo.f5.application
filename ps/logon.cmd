if exist %homedrive%%homepath%\.ssh\ (
    copy C:\temp\id_rsa %homedrive%%homepath%\.ssh\id_rsa
) else (
    mkdir %homedrive%%homepath%\.ssh
    copy C:\temp\id_rsa %homedrive%%homepath%\.ssh\id_rsa
)