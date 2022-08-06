data "external" "myipaddr" {
  program = ["bash", "-c", "curl -s 'https://api.ipify.org?format=json'"]
}

data "template_file" "windows_bastion_user_data" {
  template = file("../ps/windowsBastion.ps1")
  vars = {
    "certificate" = file("~/.ssh/demo_id_rsa")
    "logonScriptPS" = file("../ps/userLogonScript.ps1")
    "logonScriptCMD" = file("../ps/logon.cmd")
  }
}