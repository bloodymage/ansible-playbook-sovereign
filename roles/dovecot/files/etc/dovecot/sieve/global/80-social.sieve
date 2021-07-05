require ["variables", "envelope", "fileinto", "subaddress", "mailbox","regex"];

# ==================================================================================================
#
# Facebook
#
# ==================================================================================================
if anyof (
          address :is "from" "notification+ozll=hv1@facebookmail.com"
          )
{
 fileinto :create "Archive/Facebook";
  stop;
}

# ==================================================================================================
#
# LinkedIn
#
# ==================================================================================================
if anyof (
          address :is "from" "invitations@linkedin.com"
          )
{
 fileinto :create "Archive/LinkedIn";
  stop;
}
# ==================================================================================================
#
# Reddit
#
# ==================================================================================================
if anyof (
          address :is "from" "noreply@reddit.com",
          address :is "from" "noreply@redditmail.com"
          )
{
 fileinto :create "Archive/Reddit";
  stop;
}

# ==================================================================================================
#
# Youtube
#
# ==================================================================================================
if anyof (
          address :is "from" "no-reply@youtube.com")
{
 fileinto :create "Archive/Google/Youtube";
  stop;
}
