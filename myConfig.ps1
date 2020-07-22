Import-Module posh-git
Import-Module oh-my-posh
Set-Theme PowerLine

try { \$null = gcm pshazz -ea stop; pshazz init 'default' } catch { }

# Chocolatey profile

$ChocolateyProfile = "$env:ChocolateyInstall\helpers\chocolateyProfile.psm1"
if (Test-Path($ChocolateyProfile)) {
  Import-Module "$ChocolateyProfile"
}

function getBranch() {
	git branch
}
function clear() {
  clear
}

function gitCommit() {

  git add .

  Write-Output "文件当前状态为";

  git status

  $message = Read-Host '请输入提交信息'

  git commit -m $message

  Write-Output "当前状态为";
  git status

}

function getLog() {
  git log --date-order -C -M --pretty=format:"%Cred%h  %Cblue%ad  %Cgreen%s" --all --date=format:'%Y-%m-%d %H:%M:%S' --max-count=15
}

function getStatus() {
  git status
}

function checkout() {
  git checkout $args
}

function checkoutNew() {
  git checkout -b $args
}

function deleteBr() {
  git branch -D $args
}



Set-Alias br getBranch
Set-Alias c clear
Set-Alias commit gitCommit
Set-Alias log getLog
Set-Alias st getStatus
Set-Alias ck checkout
Set-Alias ckn checkoutNew
Set-Alias remove deleteBr


