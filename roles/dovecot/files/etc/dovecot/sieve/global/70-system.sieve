require ["variables", "envelope", "fileinto", "subaddress", "mailbox","regex"];

# ==================================================================================================
#
# Mailer Daemon (Auto responders)
#
# ==================================================================================================
if anyof (
          address :contains "from" "mailer-daemon@",
          address :contains "from" "postmaster@"
          )
{
 fileinto :create "Archive/Mailer Daemon";
  stop;
}

