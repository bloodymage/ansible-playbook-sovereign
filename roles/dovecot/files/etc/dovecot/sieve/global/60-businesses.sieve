require ["variables", "envelope", "fileinto", "subaddress", "mailbox","regex"];

# ==================================================================================================
#
# Dropbox
#
# support-noreply@dropbox.com
# support-noreply@dropboxmail.com
# support-mobiledeals@dropbox.com
# support-mobiledeals@dropboxmail.com
#
# ==================================================================================================
if anyof (
          address :contains "from" "dropbox.com",
          address :contains "from" "dropboxmail.com"
          )
{
 fileinto :create "Archive/Dropbox";
  stop;
}

# ==================================================================================================
#
# Firefox
#
# verification@accounts.firefox.com
#
# ==================================================================================================
if anyof (
          address :contains "from" "firefox.com"
          )
{
 fileinto :create "Archive/Firefox";
  stop;
}

# ==================================================================================================
#
# ID.me
#
# hello@id.me
# team@troopid.com
#
# ==================================================================================================
if anyof (
    address :contains "from" "id.me",
    address :contains "from" "troopid.com"
          )
{
 fileinto :create "Archive/ID.me";
  stop;
}
