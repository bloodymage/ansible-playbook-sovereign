require ["variables", "envelope", "fileinto", "subaddress", "mailbox", "duplicate"];

# if duplicate {
#   discard;
#   stop;
# }

if envelope :matches :detail "to" "*" {
  /*  Save name in ${name} in all lowercase except for the first letter */
  set :lower :upperfirst "name" "${1}";
}

if string :is "${name}" "" {
  /*  Default case if no detail is specified */
  fileinto "Inbox";
           } else {
  /*  For Inbox.work@ this will become Inbox/word */
 fileinto :create "Archive/${name}";
 }
