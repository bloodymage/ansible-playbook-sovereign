require ["variables", "envelope", "fileinto", "subaddress", "mailbox","regex"];

# ==================================================================================================
#
# Openpgp
#
# ==================================================================================================
if anyof (
          address :is "from" "keyserver@keys.openpgp.org"
          )
{
 fileinto :create "Archive/Openpgp";
  stop;

}
