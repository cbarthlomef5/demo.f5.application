data "template_file" "windows_bastion_user_data" {
  template = file("../ps/windowsBastion.ps1")
  vars = {
    "userpassword" = var.windows_demo_password
    "certificate" = file("~/.ssh/demo_id_rsa")
    "pubcert" = file("~/.ssh/demo_id_rsa.pub")
    "logonScriptCMD" = file("../ps/logon.cmd")
    "sshd_config" = file("../ps/sshd_config")
  }
}